package com.yasasitango.www.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yasasitango.www.service.QuizService;
import com.yasasitango.www.vo.TangoVO;

import java.util.Random;

@Controller
@RequestMapping(value="/quiz")
public class QuizController {
	@Autowired
	HttpSession session;
	@Autowired
	QuizService service;
	
	static int point = 0;
	static int count = 0;
	static int lev = 0;
	static boolean isRandom = true;
	static String seikai;
	
	@RequestMapping(value="/quiz_random", method = RequestMethod.GET)
	public String  quiz_random(Model model) {
		isRandom = true;
		ArrayList<TangoVO> quiz_list = service.quiz_random();
		
		Random rand = new Random();
		TangoVO quiz = quiz_list.get(rand.nextInt(quiz_list.size()));
		
		int seikai_num = rand.nextInt(4);
		
		ArrayList<TangoVO> question_list = service.make_question(quiz.getKanji());
		ArrayList<TangoVO> question = new ArrayList<TangoVO>();
		for(int i=0; i<4; i++) {
			if(i == seikai_num) {
				question.add(quiz);
				seikai = quiz.getKorean();
			} else {
				question.add(question_list.get(rand.nextInt(question_list.size())));
			}
		}
		model.addAttribute("quiz", quiz);
		model.addAttribute("question", question);
		return "/quiz/quiz_random";
	}
	
	@RequestMapping(value="/quiz_level", method = RequestMethod.GET)
	public String  quiz_level(Model model, int level) {
		isRandom = false;
		lev = level;
		ArrayList<TangoVO> quiz_list = service.quiz_level(level);
		
		Random rand = new Random();
		TangoVO quiz = quiz_list.get(rand.nextInt(quiz_list.size()));
		
		int seikai_num = rand.nextInt(4);
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("kanji", quiz.getKanji());
		map.put("level", Integer.toString(level));
		
		ArrayList<TangoVO> question_list = service.make_question_level(map);
		ArrayList<TangoVO> question = new ArrayList<TangoVO>();
		for(int i=0; i<4; i++) {
			if(i == seikai_num) {
				question.add(quiz);
				seikai = quiz.getKorean();
			} else {
				question.add(question_list.get(rand.nextInt(question_list.size())));
			}
		}
		model.addAttribute("quiz", quiz);
		model.addAttribute("question", question);
		return "/quiz/quiz_random";
	}
	
	@RequestMapping(value="/quiz_level_two", method = RequestMethod.GET)
	public String  quiz_level_two(Model model) {
		isRandom = false;
		ArrayList<TangoVO> quiz_list = service.quiz_level(lev);
		
		Random rand = new Random();
		TangoVO quiz = quiz_list.get(rand.nextInt(quiz_list.size()));
		
		int seikai_num = rand.nextInt(4);
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("kanji", quiz.getKanji());
		map.put("level", Integer.toString(lev));
		
		ArrayList<TangoVO> question_list = service.make_question_level(map);
		ArrayList<TangoVO> question = new ArrayList<TangoVO>();
		for(int i=0; i<4; i++) {
			if(i == seikai_num) {
				question.add(quiz);
				seikai = quiz.getKorean();
			} else {
				question.add(question_list.get(rand.nextInt(question_list.size())));
			}
		}
		model.addAttribute("quiz", quiz);
		model.addAttribute("question", question);
		return "/quiz/quiz_random";
	}
	
	@RequestMapping(value="/answer", method = RequestMethod.GET)
	public String answer(Model model, String answer) {
		count++;
		System.out.println("정답:" + answer);
		if(seikai.equals(answer)) {
			System.out.println("정답");
		    System.out.println("현재 점수:" + ++point);
		} else {
			System.out.println("오답");
		}
		
		if(count >= 5) {
            model.addAttribute("point", point); 
			return "redirect:/quiz/quizResult";
		} else {
			if(isRandom) return "redirect:/quiz/quiz_random";
			else return "redirect:/quiz/quiz_level_two";
		}
	}
	
	@RequestMapping(value="/quizResult", method = RequestMethod.GET)
	public String quizResult(Model model) {
		model.addAttribute("point", point);
		return "/quiz/quizResult";
	}
	
	@RequestMapping(value="/goHome", method = RequestMethod.GET)
	public String goHome() {
		point = 0;
		count = 0;
		return "redirect:/";
	}

}
