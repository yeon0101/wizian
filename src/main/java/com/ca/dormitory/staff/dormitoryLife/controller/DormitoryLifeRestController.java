package com.ca.dormitory.staff.dormitoryLife.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.staff.dormitoryLife.service.DormitoryLifeService;
import com.ca.dormitory.student.dormitoryLife.service.StuDormitoryLifeService;
import com.ca.dormitory.vo.ActDtlVo;
import com.ca.dormitory.vo.PenDtlVo;
import com.ca.dormitory.vo.StaffVo;

@RestController
@RequestMapping("/staff/dormitoryLife/*")
public class DormitoryLifeRestController {

	@Autowired
	private DormitoryLifeService dormitoryLifeService;
	
	@Autowired
	private StuDormitoryLifeService stuDormitoryLifeService;
	
	/*벌점관련~~~~*/
	@RequestMapping("getStuInfoList")
	public HashMap<String, Object> getStuInfoList(int ent_no, String bldg_code){ //컨트롤러에서 해보기, 되면 삭제!
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", dormitoryLifeService.getStudByEntNoAndBldg(ent_no,bldg_code));
		return map;
	}
	
	/*외박관련~~~~*/
//	@RequestMapping("getListByNoAndReqDT")
//	public HashMap<String, Object> getListByNoAndReqDT(HttpSession session, String act_cd, String actReqDate) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		StaffVo staffVo = (StaffVo) session.getAttribute("sessionStaffInfo");
//		
//		map.put("result", "success");
//		map.put("data", dormitoryLifeService.getACTListByStanAndReqDT(act_cd, actReqDate));
//		return map;
// 	}
	
	@RequestMapping("getACTList")
	public HashMap<String, Object> getACTList(String actReqDate,
			@RequestParam(value = "act_cd", required = false)String act_cd,
			@RequestParam(value="stud_id", required = false)String stud_id, 
			@RequestParam(value="stud_name", required = false)String stud_name, 
			@RequestParam(value = "bldg_code", required = false)String bldg_code,
			@RequestParam(value = "act_conf_yn", required = false)String act_conf_yn){
		
		//System.out.println("CODE : " + bldg_code);
		//System.out.println("act_conf_yn : " + act_conf_yn);

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", dormitoryLifeService.getActList(actReqDate, act_cd, stud_id, stud_name, bldg_code, act_conf_yn));
		map.put("count", dormitoryLifeService.CountselectedActList(actReqDate, act_cd, stud_id, stud_name, bldg_code, act_conf_yn));
		return map;
	}
//	@RequestMapping("getEntNo") //파라미터로 ent_stud_no 가져오기
//	public HashMap<String, Object> getEntNo(
//			@RequestParam(value = "stud_id",required = false)String stud_id,
//			@RequestParam(value ="stud_name",required = false)String stud_name){
//			
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		System.out.println(stud_id);
//		System.out.println("name: "+stud_name);
//		System.out.println("data:"+dormitoryLifeService.getEntNoByStudInfo(stud_id, stud_name));
//		
//		map.put("result", "success");
//		map.put("data", dormitoryLifeService.getEntNoByStudInfo(stud_id, stud_name));
//		return map;
//	}
	@RequestMapping("getActDtl")
	public HashMap<String, Object> getActDtl(int act_no ){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "seccess");
		map.put("data", dormitoryLifeService.getActDtlByNo(act_no));
		return map;		
		}
	
	@RequestMapping("updateActConf")
	public HashMap<String, Object> updateActConf(String[]act_no){
		HashMap<String, Object> map = new HashMap<String, Object>();

		for(int i = 0; i<act_no.length-1; i++) {
			int number = Integer.parseInt(act_no[i]);
			ActDtlVo actDtlVo = stuDormitoryLifeService.getMyActByNo(number);
			if(actDtlVo.getAct_conf_yn().equals("Y")) {
				map.put("result", "fail");
			}else {
				map.put("result", "success");
				dormitoryLifeService.updateActConf(number);
			}
		}
		return map;
	}
	
	@RequestMapping("penDtlList")
	public HashMap<String, Object> penDtlList(int ent_no, String bldg_code,			
			@RequestParam(value = "penDate", required = false)String penDate,
			@RequestParam(value="stud_id", required = false)String stud_id, 
			@RequestParam(value="stud_name", required = false)String stud_name, 
			@RequestParam(value = "pen_conf_yn", required = false)String pen_conf_yn){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", dormitoryLifeService.getPenList(ent_no, bldg_code,penDate, stud_id, stud_name,pen_conf_yn));
		map.put("count", dormitoryLifeService.countSelectedPenList(ent_no, bldg_code, penDate, stud_id, stud_name, pen_conf_yn));
		map.put("result", "sccess");
		return map;
	}
	
	@RequestMapping("getPenDtl")
	public HashMap<String, Object> getPenDtl(int pen_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "sccess");
		map.put("data", dormitoryLifeService.getPenDtlByNo(pen_no));
		return map;
	}

	@RequestMapping("searchStud")
	public HashMap<String, Object> searchStud(int ent_no,
			@RequestParam(value = "room_code", required = false)String room_code,
			@RequestParam(value = "stud_id", required = false)String stud_id,
			@RequestParam(value = "stud_name", required = false)String stud_name){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", "success");
		map.put("data", dormitoryLifeService.searchStudInfo(ent_no, room_code, stud_id, stud_name));
		return map;
	}
	@RequestMapping("givePenalty")
	public HashMap<String, Object> givePenalty(String stud_id, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		StaffVo staffVo = (StaffVo) session.getAttribute("sessionStaffInfo");
		
		map.put("result", "success");
		map.put("data",stuDormitoryLifeService.selectStudentInfoByID(stud_id));
		map.put("staffData", dormitoryLifeService.getStaffAndAdminInfoByID(staffVo.getStaff_id()));
		map.put("penList", dormitoryLifeService.getPenStdList());
		return map;
	}
	@RequestMapping("givePenaltyFinal")
	public HashMap<String, Object> givePenaltyFinal(PenDtlVo penDtlVo,HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		StaffVo staffVo = (StaffVo) session.getAttribute("sessionStaffInfo");

		dormitoryLifeService.insertPenalty(penDtlVo);
		
		map.put("result","success");
		return map;
	}

}
