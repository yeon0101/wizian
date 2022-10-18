package com.ca.dormitory.staff.dormitoryEnterApproval.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.staff.dormitoryEnterApproval.service.DormitoryEnterApprovalService;

@RestController
@RequestMapping("/staff/dormitoryEnterApproval/*")
public class DormitoryEnterApprovalRestController {
	
	@Autowired
	private DormitoryEnterApprovalService dormitoryEnterApprovalService;
	
	@RequestMapping("getEntInfoList")
	public ArrayList<HashMap<String, Object>> getEntInfoList(){
		return dormitoryEnterApprovalService.getEntInfoList(); 
	}
	
	@RequestMapping("getRecrInfoList")
	public ArrayList<HashMap<String, Object>> getRecrInfoList(int selectedEntNO){
		return dormitoryEnterApprovalService.getRecrInfoList(selectedEntNO);
	}
	
	@RequestMapping("getApplListByFilter")
	public HashMap<String, Object> getApplList(@RequestBody HashMap<String, Object> getMap){
//		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		HashMap<String, Object> setMap = new HashMap<String, Object>(); 
		
//		System.out.println("입사학기ENT_NO:"+getMap.get("ENT_NO"));
//		System.out.println("모집차수RECR_NO:"+getMap.get("RECR_NO"));
//		System.out.println("신청승인여부APPL_YN:"+getMap.get("APPL_YN"));
//		System.out.println("성별STUD_GENDER:"+getMap.get("STUD_GENDER"));
//		System.out.println("성명STUD_NAME:"+getMap.get("STUD_NAME"));
//		System.out.println("호실배정방식allocationMethod:"+getMap.get("allocationMethod"));
		
		
		int RECR_NO = Integer.parseInt( (String)getMap.get("RECR_NO"));
		int ENT_NO = Integer.parseInt( (String)getMap.get("ENT_NO"));
//		String FLOOR_GRADE_DIV = (String)getMap.get("");
		Object RECR_DIV = dormitoryEnterApprovalService.getRECR_DIVFromDMT_RECR_INFOByRECR_NO(getMap.get("RECR_NO"));
		
		setMap.put("applList", dormitoryEnterApprovalService.getApplList(getMap));
		
		if(getMap.get("RECR_NO").equals("0")) {
			setMap.put("RECR_DIV", "0");
		}else {
			setMap.put("RECR_DIV", RECR_DIV);
		}
		
		
		setMap.put("maleNowNumber", dormitoryEnterApprovalService.getMaleNowNumber( RECR_NO,ENT_NO ));
		setMap.put("maleFixedNumber", dormitoryEnterApprovalService.getMaleFixedNumber((String)RECR_DIV));
		setMap.put("femaleNowNumber", dormitoryEnterApprovalService.getFemaleNowNumber( RECR_NO,ENT_NO ));
		setMap.put("femaleFixedNumber", dormitoryEnterApprovalService.getFemaleFixedNumber((String)RECR_DIV));
		
		
		return setMap;
	}
	
	@RequestMapping("getApplData")
	public HashMap<String, Object> getApplData(int APPL_NO){
		System.out.println("APPL_NO : "+APPL_NO);
		
		return dormitoryEnterApprovalService.getApplData(APPL_NO);
	}
	
	@RequestMapping("updateApplDataProcess")
	public void updateApplDataProcess(@RequestBody HashMap<String, Object> map){
		
		System.out.println(map.get("APPL_NO"));
		System.out.println(map.get("GRDN_NAME"));
		System.out.println(map.get("GRDN_PHONE"));
		System.out.println(map.get("GRDN_RELATION"));
		System.out.println(map.get("GRDN_ZIPCODE"));
		System.out.println(map.get("GRDN_ADDR1"));
		System.out.println(map.get("GRDN_ADDR2"));
		
		dormitoryEnterApprovalService.updateDMT_APPLByAPPL_NO(map);
	}
	
	@RequestMapping("approvalProcess")
	public void approvalProcess(@RequestBody HashMap<String, Object> map) {
//		map={
//		"checkedApplDataValues":checkedApplDataValues,
//		"approvalYN":approvalYN }
		ArrayList<String> checkedApplDataValues = (ArrayList<String>)map.get("checkedApplDataValues");
		String approvalYN = (String)map.get("approvalYN");
		
		for(String APPL_NO:checkedApplDataValues) {		
//			System.out.println(APPL_NO);
			dormitoryEnterApprovalService.updateAPPL_YNToYbyAPPL_NO(APPL_NO,approvalYN);
		}
		
	}
	
	@RequestMapping("autoApprovalProcess")
	public void autoApprovalProcess(@RequestParam("nowRECR_NO") String RECR_NO) {
		dormitoryEnterApprovalService.updateAutoApprovalProcess(RECR_NO);
	}
}
