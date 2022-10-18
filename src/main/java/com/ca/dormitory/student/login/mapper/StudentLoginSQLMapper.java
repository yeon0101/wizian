package com.ca.dormitory.student.login.mapper;

import com.ca.dormitory.vo.StudInfoVo;

public interface StudentLoginSQLMapper {
	
	public StudInfoVo selectAllFromCBH_STUD_INFOByIDAndPW(StudInfoVo studVo);

}
