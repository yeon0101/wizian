package com.ca.dormitory.staff.dormitoryRoomAssignments.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.staff.dormitoryEnterApproval.service.DormitoryEnterApprovalService;
import com.ca.dormitory.staff.dormitoryRoomAssignments.service.DormitoryRoomAssignmentsService;

@RestController
@RequestMapping("/staff/dormitoryRoomAssignments/*")
public class DormitoryRoomAssignmentsRestController {
	
	@Autowired
	private DormitoryEnterApprovalService dormitoryEnterApprovalService;
	@Autowired
	private DormitoryRoomAssignmentsService dormitoryRoomAssignmentsService;
	
	@RequestMapping("getEntInfoList")
	public ArrayList<HashMap<String, Object>> getEntInfoList(){
		return dormitoryEnterApprovalService.getEntInfoList();
	}
	@RequestMapping("getBuildingCodeList")
	public ArrayList<HashMap<String, Object>> getBuildingCodeList(){
		return dormitoryRoomAssignmentsService.getBuildingList();
	}
	
	@RequestMapping("getApplList")
	public ArrayList<HashMap<String, Object>> getApplList(String ENT_NO){
		return dormitoryRoomAssignmentsService.getApplList(ENT_NO);
	}
	
	@RequestMapping("getRoomList")
	public ArrayList<HashMap<String, Object>> getRoomList(String ENT_NO){
		return dormitoryRoomAssignmentsService.getRoomList(ENT_NO);
	}
	
	@RequestMapping("getAssignedRoomList")
	public HashMap<String, Object> getAssignedRoomList(@RequestParam("ENT_NO") String ENT_NO, @RequestParam("ROOM_CODE") String ROOM_CODE){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("assignedRoomList", dormitoryRoomAssignmentsService.getAssignedRoomList(ENT_NO, ROOM_CODE));
		map.put("roomData", dormitoryRoomAssignmentsService.getRoomData(ROOM_CODE));
		return map;
	}
	
	@RequestMapping("getStudentInfo")
	public HashMap<String, Object> getStudentInfo(@RequestParam String STUD_ID,@RequestParam String ENT_NO){
		return dormitoryRoomAssignmentsService.getStudentInfo(STUD_ID, ENT_NO);
	}
	
	@RequestMapping("assignRoomProcess")
	public void assignRoomProcess(@RequestParam String ROOM_CODE,@RequestParam String APPL_NO) {
		dormitoryRoomAssignmentsService.assignRoomProcess(ROOM_CODE, APPL_NO);
	}
	
	@RequestMapping("moveOutProcess")
	public HashMap<String, Object> moveOutProcess(@RequestParam String ENT_NO, @RequestParam String STUD_ID) {
		return dormitoryRoomAssignmentsService.moveOutProcess(ENT_NO, STUD_ID);
	}
	
}
