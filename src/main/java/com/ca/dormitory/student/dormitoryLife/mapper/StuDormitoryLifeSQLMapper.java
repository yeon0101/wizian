package com.ca.dormitory.student.dormitoryLife.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ca.dormitory.vo.ActDtlVo;
import com.ca.dormitory.vo.EntStudVo;
import com.ca.dormitory.vo.PenDtlVo;

public interface StuDormitoryLifeSQLMapper {

	public HashMap<String, Object> selectStudentInfoByID(String studID);//관생+입사신청서+학생정보
	
	public List<HashMap<String, Object>> selectENTInfoByID(String studID); //내가 그동안 신청한 입사단위정보+관생+입사신청서
	
	public HashMap<String, Object> selectDMTInfoByRoom(String roomCode); //동,층,호실정보
	
	public EntStudVo selectENTStudentInfoByID(String studID); //관생정보만 가져오기
	
	public int createActDtlPK(); //외박신청PK
	
	public void insertActDtl(ActDtlVo actDtlVo); //외박신청
	
	public void updateStartEndDate(ActDtlVo actDtlVo);
	
	public ArrayList<ActDtlVo> myActDtlList(
			@Param("stud_id")String stud_id, @Param("ent_no")int ent_no);// 내가 신청한 외박내역
	
	public void cancelMyActByNo(int no); //외박신청 취소하기
	
	//추가필요
	public ActDtlVo selectMyActByNo(int no);
	
	public ArrayList<HashMap<String, Object>> ApplList(String stud_id);
	
	//생활관비
	public HashMap<String, Object> selectMyEntFeeDetail(int applNo);
	public void updateMyEntFeeDetail(HashMap<String, Object> map);
	public void updateApplSlctYN(HashMap<String, Object> map);
	public void insertEntStud(HashMap<String, Object> map);
		
	//입사자종합:윤설
	public ArrayList<PenDtlVo>selectMyPenList(
			@Param("stud_id")String stud_id, @Param("ent_stud_no")int ent_stud_no,
			@Param("startDate")String startDate, @Param("endDate")String endDate);
	
	public ArrayList<ActDtlVo> selectMyActList(
			@Param("stud_id")String stud_id, @Param("ent_stud_no")int ent_stud_no,
			@Param("actStrDate")String actStrDate, @Param("actEntDate")String actEntDate);
	
}
