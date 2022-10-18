package com.ca.dormitory.staff.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff/plan/*")
public class PlanController {

	@RequestMapping("dormitoryInfoPage")
	public String dormitoryInfoPage() {
		return "staff/plan/dormitoryInfoPage";
	}
	
	@RequestMapping("planRegisterPage")
	public String planRegisterPage() {
		return "staff/plan/planRegisterPage";
	}
	

}
