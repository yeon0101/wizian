package com.ca.dormitory.staff.dormitoryRoomAssignments.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.staff.dormitoryRoomAssignments.mapper.DormitoryRoomAssignmentsSQLMapper;

@Service
public class DormitoryRoomAssignmentsService {
	
	@Autowired
	private DormitoryRoomAssignmentsSQLMapper dormitoryRoomAssignmentsSQLMapper;
	
	public ArrayList<HashMap<String, Object>> getBuildingList(){
		return dormitoryRoomAssignmentsSQLMapper.selectAllDMT_BLDG();
	}
	
	public ArrayList<HashMap<String, Object>> getApplList(String ENT_NO){	
		return dormitoryRoomAssignmentsSQLMapper.selectAll$DMT_RECR_INFO$DMT_APPL$CBH_STUD$DMT_STUD_SCORE(ENT_NO);
	}
	
	public ArrayList<HashMap<String, Object>> getRoomList(String ENT_NO){
		return dormitoryRoomAssignmentsSQLMapper.selectAll$DMT_BLDG$DMT_FLOOR$DMT_ROOM(ENT_NO);
	}
	
	public ArrayList<HashMap<String, Object>> getAssignedRoomList(String ENT_NO, String ROOM_CODE){
		return dormitoryRoomAssignmentsSQLMapper.selectAllCBH_STUDFrom$CBH_STUD$DMT_APPL$DMT_RECR_INFO$DMT_FLOOR$DMT_ROOM$ByENT_NO$ROOM_CODE(ENT_NO, ROOM_CODE);
	}
	
	public HashMap<String, Object> getRoomData(String ROOM_CODE){
		return dormitoryRoomAssignmentsSQLMapper.selectAllFromDMT_ROOMByROOM_CODE(ROOM_CODE);
	}
	
	public HashMap<String, Object> getStudentInfo(String STUD_ID, String ENT_NO) {
		return dormitoryRoomAssignmentsSQLMapper.selectCBH_STUDJoinTableBySTUD_ID$ENT_NO(STUD_ID,ENT_NO);
	}
	
	public void assignRoomProcess (String ROOM_CODE, String APPL_NO) {
		System.out.println(ROOM_CODE);
		System.out.println(APPL_NO);
		dormitoryRoomAssignmentsSQLMapper.updateROOM_CODEFromDMT_APPLByAPPL_NO(ROOM_CODE, APPL_NO);
		dormitoryRoomAssignmentsSQLMapper.insertDMT_ENT_FEE_DTLByAPPL_NO(APPL_NO);
		
	}
	
	public HashMap<String, Object> moveOutProcess(String ENT_NO, String STUD_ID) {
		dormitoryRoomAssignmentsSQLMapper.updateROOM_CODEFromDMT_APPLByENT_NOandSTUD_ID(ENT_NO, STUD_ID);
		dormitoryRoomAssignmentsSQLMapper.deleteDMT_ENT_FEE_DTLByENT_NOandSTUD_ID(ENT_NO, STUD_ID);
		return dormitoryRoomAssignmentsSQLMapper.selectRownumAndApplDataByENT_NOAndSTUD_ID(ENT_NO, STUD_ID);
	}
}
