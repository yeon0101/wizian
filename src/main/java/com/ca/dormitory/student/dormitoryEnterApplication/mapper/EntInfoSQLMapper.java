package com.ca.dormitory.student.dormitoryEnterApplication.mapper;


import org.apache.ibatis.annotations.Param;

import com.ca.dormitory.vo.ApplVo;
import com.ca.dormitory.vo.EntInfoVo;
import com.ca.dormitory.vo.RecrInfoVo;
import com.ca.dormitory.vo.StudInfoVo;

public interface EntInfoSQLMapper {

	public EntInfoVo selectEntInfo(int ent_no);
	public EntInfoVo selectAllEntINfo();
	public RecrInfoVo selectAllRECRINfo();
	public void insertAppl(ApplVo applVo);
	public RecrInfoVo CheckRecrInfo(String stud_grade);
	public ApplVo CherkApplInfo(@Param("studId")String studId,@Param("recrNo") int recrNo);
	
	
}
