package com.ca.dormitory.student.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.student.login.mapper.StudentLoginSQLMapper;
import com.ca.dormitory.vo.StudInfoVo;

@Service
public class StudentLoginService {

	@Autowired
	private StudentLoginSQLMapper studentLoginSQLMapper;
	
	public StudInfoVo getStudInfoVo(StudInfoVo studVo){
		return studentLoginSQLMapper.selectAllFromCBH_STUD_INFOByIDAndPW(studVo);
	}
	
	
	
}

 