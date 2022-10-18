package com.ca.dormitory.student.dormitoryLife.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.student.dormitoryLife.mapper.StuDormitoryLifeSQLMapper;
import com.ca.dormitory.student.dormitoryLife.service.StuDormitoryLifeService;
import com.ca.dormitory.vo.ActDtlVo;
import com.ca.dormitory.vo.EntStudVo;
import com.ca.dormitory.vo.StudInfoVo;

@RestController
@RequestMapping("/student/dormitoryLife/*")
public class StuDormitoryLifeRestController {
	
	@Autowired
	private StuDormitoryLifeService stuDormitoryLifeService;
	@Autowired
	private StuDormitoryLifeSQLMapper StuDormitoryLifeSQLMapper;
	
	@RequestMapping("insertAct")
	public HashMap<String, Object> insertAct(ActDtlVo param, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		StudInfoVo studInfoVo = (StudInfoVo) session.getAttribute("sessionStudentInfo");
		stuDormitoryLifeService.insertActDtl(param);

		map.put("result", "success");
		map.put("data", studInfoVo);
		return map;
	}
	
	@RequestMapping("myActListCheck")
	public HashMap<String, Object> myActListCheck(ActDtlVo param, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		StudInfoVo studInfoVo = (StudInfoVo) session.getAttribute("sessionStudentInfo");
		
		//stuDormitoryLifeService.getMyActDtlList(studInfoVo.getStud_id(), param.getEnt_no());
		map.put("result", "success");
		map.put("data", stuDormitoryLifeService.getMyActDtlList(studInfoVo.getStud_id(), param.getEnt_no()));
		
		return map;
	}
	@RequestMapping("deleteMyAct")
	public HashMap<String, Object> deleteMyAct(String[] act_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i = 0; i<act_no.length-1; i++) {
			int num = Integer.parseInt(act_no[i]);
			ActDtlVo actDtlVo = stuDormitoryLifeService.getMyActByNo(num);
			if(actDtlVo.getAct_conf_yn().equals("Y")) {
				map.put("result", "fail");
			}else {
				map.put("result", "success");
				stuDormitoryLifeService.cancelMyActByNo(num);
			}
		}
		return map;
	}
	
	@RequestMapping("getMyEntFeeInfo")
	public HashMap<String, Object> getEntFeeInfo(int applNo){
		return StuDormitoryLifeSQLMapper.selectMyEntFeeDetail(applNo);
	}
	
	
	@RequestMapping("saveEntFeeDetailInfo")
	public HashMap<String, Object> saveEntFeeDetailInfo(@RequestBody HashMap<String, Object> param) {

		StuDormitoryLifeSQLMapper.updateMyEntFeeDetail(param); //납부테이블 납부일자 업데이트
		StuDormitoryLifeSQLMapper.updateApplSlctYN(param); //입사신청서 테이블 select yn 업데이트
		StuDormitoryLifeSQLMapper.insertEntStud(param); //관생정보 테이블 인서트
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
		
	}

	//입사자종합: 윤설-----------------------------------------
	@RequestMapping("getEntNo")
	public HashMap<String, Object> getEntNo(HttpSession session){
		HashMap<String, Object> map =new HashMap<String, Object>();
		StudInfoVo studInfoVo = (StudInfoVo) session.getAttribute("sessionStudentInfo");
		EntStudVo entStudVo = stuDormitoryLifeService.selectENTStudentInfoByID(studInfoVo.getStud_id());
		
		if(entStudVo == null) {
			map.put("result", "fail");
		}else {
			map.put("data", entStudVo.getEnt_stud_no());
			map.put("result", "success");
		}
		return map;
 	}
	
	@RequestMapping("getMyPenList")
	public HashMap<String, Object> getMyPenList(HttpSession session,
			@RequestParam(value = "ent_stud_no", defaultValue= "0")int ent_stud_no,
			@RequestParam(value = "startDate", required = false)String startDate,
			@RequestParam(value = "endDate", required = false)String endDate){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		StudInfoVo studInfoVo = (StudInfoVo) session.getAttribute("sessionStudentInfo");
		System.out.println("pen:"+studInfoVo.getStud_id());
		
		map.put("result", "success");
		map.put("data", stuDormitoryLifeService.getMyPenList(studInfoVo.getStud_id(), ent_stud_no, startDate, endDate));
		
		return map;
	}
	@RequestMapping("getMyActList")
	public HashMap<String, Object> getMyActList(HttpSession session,
			@RequestParam(value = "ent_stud_no", defaultValue= "0")int ent_stud_no,
			@RequestParam(value = "actStrDate", required = false)String actStrDate,
			@RequestParam(value = "actEntDate", required = false)String actEntDate){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		StudInfoVo studInfoVo = (StudInfoVo) session.getAttribute("sessionStudentInfo");
		
		map.put("result", "success");
		map.put("data", stuDormitoryLifeService.getMyActList(studInfoVo.getStud_id(), ent_stud_no, actStrDate, actEntDate));
		return map;
		
	}
	
	
	
	
}
