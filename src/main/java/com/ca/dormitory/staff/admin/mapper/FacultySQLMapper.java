package com.ca.dormitory.staff.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ca.dormitory.vo.StaffVo;

public interface FacultySQLMapper {

	public ArrayList<StaffVo> selectFacultyList(); 
	
	public HashMap<String, Object> selectStaff(HashMap<String, Object> map);
}
