package com.yasasitango.www.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yasasitango.www.jungwooJava.FindTextToImage;
import com.yasasitango.www.jungwooJava.PaPago;
import com.yasasitango.www.jungwooJava.Speech_To_Text;
import com.yasasitango.www.jungwooJava.Text_To_Speech;
import com.yasasitango.www.service.TangoService;
import com.yasasitango.www.vo.TangoVO;

@Controller
public class JungWooController {
	@Autowired
	TangoService service;

	@RequestMapping(value = "/JungWooPage", method = RequestMethod.GET)
	public String JungWoo() {
		return "JungWooPage";
	}
	
	@RequestMapping(value = "/searchTango", method = RequestMethod.GET)
	public String searchTango() {
		return "searchTango";
	}
	
	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
	public String searchResult(String lang, String langCheck, Model model) {
		System.out.println("텍스트:" + lang);
		System.out.println("언어:" + langCheck);
		TangoVO tango = new TangoVO();
<<<<<<< HEAD
		String korean = lang;
		tango = service.tangoResultKO(korean, langCheck);
		System.out.println(tango);
=======
		String searchWord = lang;
		tango = service.tangoResultKO(searchWord, langCheck);
		//System.out.println(tango);
>>>>>>> jungwoo3
		model.addAttribute("tango", tango);	
		return "searchResult";
	}
	
	@ResponseBody
	@RequestMapping(value = "/nmtReturnRseult", method = RequestMethod.POST, produces = "application/text; charset=utf-8;")
	public String nmtReturnRseult(String original_str, String code) {
		PaPago papago = new PaPago();
		String resultString = papago.Trans(original_str, code);
		return resultString;
	}
	
	@ResponseBody
	@RequestMapping(value = "/text_to_speech", method = RequestMethod.POST, produces = "application/text; charset=utf-8;")
	public void text_to_speech(String voice, String code) throws Exception {
		Text_To_Speech tts = new Text_To_Speech();
		System.out.println("시작" + voice + " " + code);
		tts.speech(voice, code);
		tts.playSound();
	}
	
	@ResponseBody
	@RequestMapping(value = "/speech_to_text", method = RequestMethod.POST, produces = "application/text; charset=utf-8;")
	public String speech_to_text(String code) throws Exception {
		System.out.println("현재 코드:" + code);
		Speech_To_Text stt = new Speech_To_Text();
		String result = "";
		ArrayList<String> list = stt.streamingMicRecognize(code);
		for(int i=0; i<list.size(); i++) {
			System.out.println("대본: " + list.get(i));
			result += list.get(i);
			result += "\n";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/find_Text_To_Image", method = RequestMethod.POST, produces = "application/text; charset=utf-8;")
	public String find_Text_To_Image(String Image) throws IOException {
		FindTextToImage fti = new FindTextToImage();
		System.out.println("이미지 링크: " + Image);
		String result = fti.detectTextGcs(Image);
		return result;
	}
}
