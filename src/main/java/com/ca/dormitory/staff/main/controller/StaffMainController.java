package com.ca.dormitory.staff.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff/main/*")
public class StaffMainController {

	@RequestMapping("staffMainPage")
	public String staffMainPage() {
		
		return "staff/main/staff_mainPage";
	}
	
	
	
}
