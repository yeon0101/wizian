package com.ca.dormitory.student.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.student.login.service.StudentLoginService;
import com.ca.dormitory.vo.StudInfoVo;

@Controller
@RequestMapping("/student/login/*")
public class StudentLoginController {
	
	@Autowired
	private StudentLoginService studentLoginService;
	
	@RequestMapping("studentLoginProcess")
	public String studentLoginProcess(StudInfoVo studInfoVo,HttpSession session) {
		StudInfoVo full_studInfoVo = studentLoginService.getStudInfoVo(studInfoVo);
		
		if(full_studInfoVo==null) {
//			System.out.println("로그인실패");
			
			return "redirect: ../../main/loginPage?loginState=fail";
		}else {
			session.setAttribute("sessionStudentInfo", full_studInfoVo);
//			System.out.println("로그인성공-sessionUserInfo 세션저장");
			return "redirect: ../main/studentMainPage";
		}

	}
	
	@RequestMapping("studentLogoutProcess")
	public String studentLogout(HttpSession session) {
		session.removeAttribute("sessionStudentInfo");
		
		return "redirect:../../main/loginPage";
	}

}
