package com.ca.dormitory.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	
	@RequestMapping("studentMainPage")
	public String studentMainPage() {
		
		return "student/main/student_mainPage";
	}

	@RequestMapping("loginPage")
	public String loginPage(Model model, @RequestParam(value = "loginState", defaultValue = "0") String loginState) {
		model.addAttribute("loginState",loginState);
		return "login/loginPage";
	}
	
	@RequestMapping("loginPage2")
	public String loginPage2(Model model, @RequestParam(value = "loginState", defaultValue = "0") String loginState) {
		model.addAttribute("loginState",loginState);
		return "login/loginPage2";
	}
}
