package com.ca.dormitory.student.dormitoryEnterApplication.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.student.dormitoryEnterApplication.service.EntInfoService;
import com.ca.dormitory.vo.ApplVo;
import com.ca.dormitory.vo.EntInfoVo;
import com.ca.dormitory.vo.RecrInfoVo;
import com.ca.dormitory.vo.StudInfoVo;

@Controller
@RequestMapping("/student/dormitoryEnterApplication/*")
public class dormitoryEnterApplicationController {
	
	@Autowired
	private EntInfoService entInfoService;
	
	@RequestMapping("dormitoryEnterApplicationPage")
	public String dormitoryEnterApplicationPage( HttpSession session, Model model){
		
		String stud_grade=((StudInfoVo)(session.getAttribute("sessionStudentInfo"))).getStud_grade();
		String studId=((StudInfoVo)(session.getAttribute("sessionStudentInfo"))).getStud_id();
		
		RecrInfoVo recrInfo = entInfoService.getCheckRecrInfo(stud_grade);

		if(recrInfo != null) {
			int recrNo = recrInfo.getRecr_no();
			if(entInfoService.getCherkApplInfo(studId, recrNo) == null) {
				EntInfoVo dmtEntInfo= entInfoService.getEntInfoDate(recrInfo.getEnt_no());
				model.addAttribute("pageResult","success" ); //신청페이지로
				model.addAttribute("DmtEntInfo" ,dmtEntInfo);
				model.addAttribute("RecrInfo",recrInfo);
			}else {
				model.addAttribute("pageResult","already" );//이미 신청
			}
		}else {
			model.addAttribute("pageResult","deny" );//신청기간아님
		}
		
		
		
		
		//if(CheckRecr !=null && entInfoService.getCherkApplInfo(studId, recrNo) == null ) {
		//	model.addAttribute("pageResult","success" );
		//}else if(CheckRecr !=null && entInfoService.getCherkApplInfo(studId, recrNo) != null ) {
		//	model.addAttribute("pageResult","already" );
		//}else {
		//	model.addAttribute("pageResult","deny" );
		//}
		
		//RecrInfoVo recrInfo = entInfoService.getRecrInfoDateList();//오류
		//EntInfoVo dmtEntInfo= entInfoService.getEntInfoDate(recrInfo.getEnt_no());
		
		//model.addAttribute("DmtEntInfo" ,dmtEntInfo);
		//model.addAttribute("RecrInfo",recrInfo);
		
		
		
		
		return"./student/dormitoryEnterApplication/dormitoryEnterApplicationPage";
	}
	@RequestMapping("applicationProcess")
	public String applicationProcess(ApplVo applVo, HttpSession session) {
//		System.out.println(applVo.getStud_id());
//		//StudInfoVo studInfoVo = (StudInfoVo)session.getAttribute("sessionStudentInfo");
//		String stud_id = ((StudInfoVo)session.getAttribute("sessionStudentInfo")).getStud_id();
		
		entInfoService.application(applVo);
		return"redirect:./dormitoryEnterApplicationPage";
	}
	
}
