package com.ca.dormitory.staff.dormitoryEnterApproval.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.staff.dormitoryEnterApproval.mapper.DormitoryEnterApprovalSQLMapper;

@Service
public class DormitoryEnterApprovalService {
	@Autowired
	private DormitoryEnterApprovalSQLMapper dormitoryEnterApprovalSQLMapper;
	
	//입사단위정보 전체
	public ArrayList<HashMap<String, Object>> getEntInfoList() {
		return dormitoryEnterApprovalSQLMapper.selectAllFrom$DMT_ENT_INFO();
	}
	
	//입사단위번호에 해당하는 모집단위정보
	public ArrayList<HashMap<String, Object>> getRecrInfoList(int selectedEntNO){
		return dormitoryEnterApprovalSQLMapper.selectAllFrom$DMT_RECR_INFO(selectedEntNO);
	}
	
	//입사신청리스트 조회 결과
	public ArrayList<HashMap<String, Object>> getApplList(HashMap<String, Object> map){
		return dormitoryEnterApprovalSQLMapper.selectAllJoinTable$CBH_STUD$DMT_APPL$DMT_RECR_INFO$DMT_STUD_SCORE(map);
	}
	
	//tr클릭시 applNo에 해당되는 데이터 한줄
	public HashMap<String, Object> getApplData(int APPL_NO){
		return dormitoryEnterApprovalSQLMapper.selectOneJoinTableByAPPL_NO$CBH_STUD$DMT_APPL$DMT_RECR_INFO$DMT_STUD_SCORE(APPL_NO);
	}
	
	//수정버튼눌러서 수정하기
	public void updateDMT_APPLByAPPL_NO(HashMap<String, Object> map){
		dormitoryEnterApprovalSQLMapper.updateDMT_APPLByAPPL_NO(map);
	}
	
	public Object getRECR_DIVFromDMT_RECR_INFOByRECR_NO(Object RECR_NO) {
		Object obj = dormitoryEnterApprovalSQLMapper.selectRECR_DIVFromDMT_RECR_INFOByRECR_NO(RECR_NO);
		if(obj==null) obj="0";
		return obj;
	}
	
	public Object getMaleNowNumber(int RECR_NO,int ENT_NO) {
		return dormitoryEnterApprovalSQLMapper.selectCountPassedMaleFromJoinTableByRECR_NO$ENT_NO(RECR_NO,ENT_NO);
	}
	
	public Object getFemaleNowNumber(int RECR_NO,int ENT_NO) {
		return dormitoryEnterApprovalSQLMapper.selectCountPassedFemaleFromJoinTableByRECR_NO$ENT_NO(RECR_NO,ENT_NO);
	}
	
	public Object getMaleFixedNumber(String RECR_DIV) {
		return dormitoryEnterApprovalSQLMapper.selectCountMaleFixedNumberFromJoinTableByRECR_NO$ENT_NO(RECR_DIV); 
	}
	
	public Object getFemaleFixedNumber(String RECR_DIV) {
		return dormitoryEnterApprovalSQLMapper.selectCountFemaleFixedNumberFromJoinTableByRECR_NO$ENT_NO(RECR_DIV);
	}
	
	public void updateAPPL_YNToYbyAPPL_NO(String APPL_NO, String approvalYN) {
		dormitoryEnterApprovalSQLMapper.updateAPPL_YNToYbyAPPL_NO(APPL_NO,approvalYN);
	}
	
	public String getSTUD_GENDERFromFromJoinTableByAPPL_NO(String APPL_NO) {
		return dormitoryEnterApprovalSQLMapper.selectSTUD_GENDERFromJoinTableByAPPL_NO(APPL_NO);
	}
	
	public void updateAutoApprovalProcess(String RECR_NO) {
		dormitoryEnterApprovalSQLMapper.updateAutoApprovalQuery1(RECR_NO, "남자");
		dormitoryEnterApprovalSQLMapper.updateAutoApprovalQuery2(RECR_NO, "남자");
		dormitoryEnterApprovalSQLMapper.updateAutoApprovalQuery1(RECR_NO, "여자");
		dormitoryEnterApprovalSQLMapper.updateAutoApprovalQuery2(RECR_NO, "여자");
	}
}
