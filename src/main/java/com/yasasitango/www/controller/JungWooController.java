package com.yasasitango.www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yasasitango.www.jungwooJava.PaPago;

@Controller
public class JungWooController {

	@RequestMapping(value = "/JungWooPage", method = RequestMethod.GET)
	public String JungWoo() {
		return "JungWooPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/nmtReturnRseult", method = RequestMethod.POST, produces = "application/text; charset=utf-8;")
	public String nmtReturnRseult(String original_str) {
		PaPago papago = new PaPago();
		String resultString = papago.KoToJa(original_str);
		return resultString;
	}
}
