package com.ca.dormitory.staff.dormitoryEnterApproval.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface DormitoryEnterApprovalSQLMapper {
	public ArrayList<HashMap<String, Object>> selectAllFrom$DMT_ENT_INFO();
	public ArrayList<HashMap<String, Object>> selectAllFrom$DMT_RECR_INFO(int selectedEntNO);
	public ArrayList<HashMap<String, Object>> selectAllJoinTable$CBH_STUD$DMT_APPL$DMT_RECR_INFO$DMT_STUD_SCORE(HashMap<String, Object> map);
	public HashMap<String, Object> selectOneJoinTableByAPPL_NO$CBH_STUD$DMT_APPL$DMT_RECR_INFO$DMT_STUD_SCORE(int APPL_NO);
	public void updateDMT_APPLByAPPL_NO(HashMap<String, Object> map);
	public Object selectRECR_DIVFromDMT_RECR_INFOByRECR_NO(Object RECR_NO);
	public Object selectCountPassedMaleFromJoinTableByRECR_NO$ENT_NO(@Param("RECR_NO") int RECR_NO,@Param("ENT_NO") int ENT_NO);
	public Object selectCountPassedFemaleFromJoinTableByRECR_NO$ENT_NO(@Param("RECR_NO") int RECR_NO,@Param("ENT_NO") int ENT_NO);
	public Object selectCountMaleFixedNumberFromJoinTableByRECR_NO$ENT_NO(@Param("RECR_DIV") String RECR_DIV);
	public Object selectCountFemaleFixedNumberFromJoinTableByRECR_NO$ENT_NO(@Param("RECR_DIV") String RECR_DIV);
	public void updateAPPL_YNToYbyAPPL_NO(@Param("APPL_NO") String APPL_NO,@Param("approvalYN") String approvalYN);
	public String selectSTUD_GENDERFromJoinTableByAPPL_NO(@Param("APPL_NO") String APPL_NO);
	
	public void updateAutoApprovalQuery1(@Param("RECR_NO") String RECR_NO, @Param("STUD_GENDER") String STUD_GENDER);
	public void updateAutoApprovalQuery2(@Param("RECR_NO") String RECR_NO, @Param("STUD_GENDER") String STUD_GENDER);
}
