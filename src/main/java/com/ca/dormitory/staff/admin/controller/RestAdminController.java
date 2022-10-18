package com.ca.dormitory.staff.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.staff.admin.mapper.AdminSQLMapper;
import com.ca.dormitory.staff.admin.mapper.FacultySQLMapper;
import com.ca.dormitory.staff.admin.service.AdminService;
import com.ca.dormitory.vo.AdminVo;

@RestController
@RequestMapping("/staff/admin/*")
public class RestAdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	
	@Autowired
	private FacultySQLMapper facultySQLMapper;
	
	@RequestMapping("adminList")
	public HashMap<String, Object> adminList(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		return map;
	}

	@RequestMapping("deleteByAdminNo")
	public HashMap<String, Object> deleteByAdminNo (String[] adminNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i<adminNo.length; i++) {
			System.out.println(i+"확인:"+adminNo[i]);
			int no = Integer.parseInt(adminNo[i]);
			adminService.deleteByAdminNo(no);
		}	
		
		map.put("result", "success");
		
		return map;
	}

	//저장
	@RequestMapping("adminSaveProcess")
	public HashMap<String, Object> adminSaveProcess(@RequestBody HashMap<String, Object> param) {
		adminSQLMapper.insertDmtAdmin(param);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "sucess");
		
		return map;
	}
	
	/*
	@RequestMapping("saveAdmin")
	public HashMap<String, Object> adminSave(AdminVo adminVo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		adminService.(adminVo);
		map.put("result", "sucess");
		
		return map;
	}
	*/
	
	//생활관직원정보입력
	@RequestMapping("insertAdmin")
	public HashMap<String, Object> insertDmtAdmin(AdminVo adminVo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		adminService.Insertadmin(adminVo);
		return map;
	}
	
	@RequestMapping("restGetStaffProcess")
	public ArrayList<HashMap<String, Object>> restGetStaffProcess(@RequestBody ArrayList<HashMap<String, Object>> paramList){
		ArrayList<HashMap<String, Object>> staffList = new ArrayList<HashMap<String,Object>>();
		for(HashMap<String, Object> param : paramList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("staffInfo" , facultySQLMapper.selectStaff(param));
			staffList.add(map);
		}
		System.out.println(staffList);
		return staffList;
	}
		
}
