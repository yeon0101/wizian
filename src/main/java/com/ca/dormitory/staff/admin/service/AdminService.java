package com.ca.dormitory.staff.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.staff.admin.mapper.AdminSQLMapper;
import com.ca.dormitory.staff.admin.mapper.FacultySQLMapper;
import com.ca.dormitory.vo.AdminVo;
import com.ca.dormitory.vo.StaffVo;

@Service
public class AdminService {
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	@Autowired
	private FacultySQLMapper facultySQLMapper;
	
	public void Insertadmin(AdminVo adminVo) {
		adminSQLMapper.insertDmtAdmin(adminVo);
		
	}

	public void deleteByAdminNo(int adminNo) {
		adminSQLMapper.deleteByAdminNo(adminNo);
	}

	public void adminValue() {
		adminSQLMapper.createAdminPk();
		
	}
	
	public ArrayList<HashMap<String, Object>> getAdminList(){
		return adminSQLMapper.selectAdminList();
	}

	public ArrayList<StaffVo> getfacultyList(){
		return facultySQLMapper.selectFacultyList();
	}
	
}	