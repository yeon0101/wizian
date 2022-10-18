package com.ca.dormitory.staff.dormitoryLife.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.dormitoryLife.service.DormitoryLifeService;
import com.ca.dormitory.student.dormitoryLife.service.StuDormitoryLifeService;
import com.ca.dormitory.vo.StaffVo;

@Controller
@RequestMapping("/staff/dormitoryLife/*")
public class DormitoryLifeController {
	
	@Autowired
	private DormitoryLifeService dormitoryLifeService;
	@Autowired
	private StuDormitoryLifeService stuDormitoryLifeService;
	
	/*외박~~~*/

	@RequestMapping("nightOutApprovalPage")//외박활동처리
	public String nightOutApprovalPage(Model model, HttpSession session) {
		StaffVo staffVo = (StaffVo) session.getAttribute("sessionStaffInfo");
		model.addAttribute("staffInfo", dormitoryLifeService.getStaffAndAdminInfoByID(staffVo.getStaff_id()));
		model.addAttribute("ActStndInfo", dormitoryLifeService.selectACTStandardList());//외박기준리스트
		model.addAttribute("bldgInfo", dormitoryLifeService.getBLDGList());//호관정보
		
		return "staff/dormitoryLife/nightOutApprovalPage";
	}
	
	@RequestMapping("penaltyPointsGivePage")//벌점부과관리
	public String penaltyPointsGivePage(Model model, HttpSession session) {
		StaffVo staffVo = (StaffVo) session.getAttribute("sessionStaffInfo");
		
		model.addAttribute("staffInfo", dormitoryLifeService.getStaffAndAdminInfoByID(staffVo.getStaff_id()));
		model.addAttribute("entInfoList", dormitoryLifeService.getEntInfoList());
		model.addAttribute("bldgInfo", dormitoryLifeService.getBLDGList());//호관정보
		return "staff/dormitoryLife/penaltyPointsGivePage";
	}
	
	@RequestMapping("popup")
	public String popup(Model model) {
		model.addAttribute("entInfoList", dormitoryLifeService.getEntInfoList());
		
		return "staff/dormitoryLife/popup";
	}
}
