package com.ca.dormitory.staff.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.staff.login.mapper.StaffLoginSQLMapper;
import com.ca.dormitory.vo.StaffVo;

@Service
public class StaffLoginService {

	@Autowired
	private StaffLoginSQLMapper staffLoginSQLMapper;
	
	public StaffVo getStaffVo(StaffVo staffVo) {
		return staffLoginSQLMapper.selectAllFromCBH_STAFFByIDAndPW(staffVo);
	}
	
	
	
}

 