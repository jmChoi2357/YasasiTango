package com.yasasitango.www.controller;

<<<<<<< HEAD
=======
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
>>>>>>> Jungwoo
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yasasitango.www.jungwooJava.PaPago;
import com.yasasitango.www.jungwooJava.Speech_To_Text;
import com.yasasitango.www.jungwooJava.Text_To_Speech;

@Controller
public class JungWooController {

	@RequestMapping(value = "/JungWooPage", method = RequestMethod.GET)
	public String JungWoo() {
		return "JungWooPage";
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
}
