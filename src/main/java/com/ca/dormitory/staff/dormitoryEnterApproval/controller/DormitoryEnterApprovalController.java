package com.ca.dormitory.staff.dormitoryEnterApproval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.dormitoryEnterApproval.service.DormitoryEnterApprovalService;

@Controller
@RequestMapping("/staff/dormitoryEnterApproval/*")
public class DormitoryEnterApprovalController {
	
	@Autowired
	private DormitoryEnterApprovalService dormitoryEnterApprovalService;
	
	@RequestMapping("dormitoryEnterApprovalPage")
	public String dormitoryEnterApprovalPage(Model model) {		
		return "staff/dormitoryEnterApproval/dormitoryEnterApprovalPage";
	}
}
