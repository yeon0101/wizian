package com.ca.dormitory.student.dormitoryEnterApplication.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.student.dormitoryEnterApplication.mapper.EntInfoSQLMapper;
import com.ca.dormitory.vo.ApplVo;
import com.ca.dormitory.vo.EntInfoVo;
import com.ca.dormitory.vo.RecrInfoVo;
import com.ca.dormitory.vo.StudInfoVo;


@Service
public class EntInfoService {
	
	@Autowired
	private EntInfoSQLMapper entInfoSQLMapper;
	
	public EntInfoVo getEntInfoDateList(){
		return entInfoSQLMapper.selectAllEntINfo();
	}
	public RecrInfoVo getRecrInfoDateList(){
		return entInfoSQLMapper.selectAllRECRINfo();
	}
	public void application(ApplVo applVo) {
		entInfoSQLMapper.insertAppl(applVo);
	}
	
	public EntInfoVo getEntInfoDate(int ent_no) {
		return entInfoSQLMapper.selectEntInfo(ent_no);
	}
	public RecrInfoVo getCheckRecrInfo(String stud_grade) {
		
		return entInfoSQLMapper.CheckRecrInfo(stud_grade);
	}
	public ApplVo getCherkApplInfo(String studId, int recrNo) {
		return entInfoSQLMapper.CherkApplInfo(studId, recrNo);
	}

}
