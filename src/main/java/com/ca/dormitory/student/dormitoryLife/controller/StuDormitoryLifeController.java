package com.ca.dormitory.student.dormitoryLife.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.dormitoryLife.service.DormitoryLifeService;
import com.ca.dormitory.student.dormitoryLife.service.StuDormitoryLifeService;
import com.ca.dormitory.vo.EntStudVo;
import com.ca.dormitory.vo.StudInfoVo;

@Controller
@RequestMapping("/student/dormitoryLife/*")
public class StuDormitoryLifeController {
	
	@Autowired
	private StuDormitoryLifeService stuDormitoryLifeService;
	@Autowired
	private DormitoryLifeService dormitoryLifeService;

	@RequestMapping("nightOutApplyPage")//외박신청관리
	public String nightOutApplyPage(Model model, HttpSession session) {
		StudInfoVo studInfoVo = (StudInfoVo) session.getAttribute("sessionStudentInfo");
		EntStudVo entStudVo = stuDormitoryLifeService.selectENTStudentInfoByID(studInfoVo.getStud_id());
		if(entStudVo != null) {
			model.addAttribute("studInfo", studInfoVo);
			model.addAttribute("studInfoVo", stuDormitoryLifeService.selectStudentInfoByID(studInfoVo.getStud_id())); //학생모든정보
			model.addAttribute("entInfo", stuDormitoryLifeService.selectENTInfoByID(studInfoVo.getStud_id()));
			model.addAttribute("dmtInfo", stuDormitoryLifeService.selectDMTInfoByRoom(entStudVo.getRoom_code()));
			model.addAttribute("actStandard", dormitoryLifeService.selectACTStandardList());//외박활동 기준
			
			//restAPI 옮길ㅇㅖ정 내가 신청한 외박리스트
			model.addAttribute("myActDtlList", stuDormitoryLifeService.getMyActDtlList(studInfoVo.getStud_id(),entStudVo.getEnt_no()));
			
			return "student/dormitoryLife/nightOutApplyPage";
		}else {
			model.addAttribute("studInfo", studInfoVo);
			return "student/dormitoryLife/nightOutApplyPage";
		}
		
	}
	
	//입사자종합: 윤설-----------------------------------------
	@RequestMapping("studentAssortmentPage")
	   public String studentAssortmentPage(HttpSession session, Model model) {
	
	    	  String stud_id = ((StudInfoVo)(session.getAttribute("sessionStudentInfo"))).getStud_id();
		      ArrayList<HashMap<String, Object>> ApplMap =stuDormitoryLifeService.ApplList(stud_id);
		      //EntStudVo entStudVo = stuDormitoryLifeService.selectENTStudentInfoByID(stud_id);
		   
		      model.addAttribute("ApplMap",ApplMap);
		      return "student/dormitoryLife/studentAssortmentPage"; 
	   }    
}
