package com.ca.dormitory.staff.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.admin.service.AdminService;

@Controller
@RequestMapping("/staff/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminPage")
	public String adminPage(Model model) {
		model.addAttribute("adminVo", adminService.getAdminList());
		
		return "staff/admin/adminPage";
	}
	
	@RequestMapping("facultyPage")
	public String facultyPage(Model model) {
		model.addAttribute("staffVo", adminService.getfacultyList());
		
		return "staff/admin/facultyPage";
	}
	
}
