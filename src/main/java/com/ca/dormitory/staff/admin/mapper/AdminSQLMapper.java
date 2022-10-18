package com.ca.dormitory.staff.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ca.dormitory.vo.AdminVo;

public interface AdminSQLMapper {
	
	public int createAdminPk();
 	public AdminVo selectByAdminNo (AdminVo adminVo);
	public void insertDmtAdmin (AdminVo adminVo);
	public int selectCountByStaffId (String staffId);
	public void deleteByAdminNo(int adminNo);
	
	public void insertDmtAdmin (HashMap<String, Object> map);
	
	public ArrayList<HashMap<String, Object>> selectAdminList(); //생활관스태프리스트
}

