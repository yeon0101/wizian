package com.ca.dormitory.staff.login.mapper;

import com.ca.dormitory.vo.StaffVo;

public interface StaffLoginSQLMapper {
	
	public StaffVo selectAllFromCBH_STAFFByIDAndPW(StaffVo staffVo);

}
