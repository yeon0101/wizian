package com.ca.dormitory.staff.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.login.service.StaffLoginService;
import com.ca.dormitory.vo.StaffVo;

@Controller
@RequestMapping("/staff/login/*")
public class StaffLoginController {
	
	@Autowired
	private StaffLoginService staffLoginService;
	
	@RequestMapping("staffLoginProcess")
	public String loginProcess(StaffVo staffVo,HttpSession session, Model model) {
		StaffVo full_staffVo = staffLoginService.getStaffVo(staffVo);
		
		if(full_staffVo==null) {
//			System.out.println("로그인실패");
			
			return "redirect: ../../main/loginPage?loginState=fail";
		}else {
			session.setAttribute("sessionStaffInfo", full_staffVo);
//			System.out.println("로그인성공-sessionUserInfo 세션저장");
			model.addAttribute("sessionStaffInfo", full_staffVo);
			return "redirect:../admin/adminPage";
		}

	}
	
	@RequestMapping("staffLogoutProcess")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionStaffInfo");
		
		return "redirect:../../main/loginPage";
	}

}
