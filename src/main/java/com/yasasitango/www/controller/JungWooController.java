package com.yasasitango.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yasasitango.www.jungwooJava.PaPago;
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
		tts.speech(voice);
		tts.playSound();
	}
}
