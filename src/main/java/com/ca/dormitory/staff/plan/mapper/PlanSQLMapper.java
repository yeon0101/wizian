package com.ca.dormitory.staff.plan.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface PlanSQLMapper {

	//생활관호실정보관리
	public void insertBldg(HashMap<String,Object> map);
	public void insertFloor(HashMap<String,Object> map);
	public void insertRoom(HashMap<String,Object> map);
	
	public void deleteBldg(String bldg_code);
	public void deleteFloor(String floor_code);
	public void deleteRoom(String room_code);
	
	public HashMap<String, Object> selectBldg(String bldgCode);
	public ArrayList<HashMap<String, Object>> selectBuildingSummaryList();
	public ArrayList<HashMap<String, Object>> selectFloorSummaryList(String bldgCode);
	public ArrayList<HashMap<String, Object>> selectRoomList(String floorCode);
	public ArrayList<HashMap<String, Object>> selectBldgList();

	
	
	//입사계획관리
	public void insertEntInfo(HashMap<String,Object> map);
	public void insertRecrInfo(HashMap<String,Object> map);

	public void deleteEntInfo(String ent_no);
	public void deleteRecrInfo(String recr_no);
	public void updateAvailableRoom(HashMap<String, Object> map);
	public HashMap<String, Object> selectEntInfo(int ent_no);
	public HashMap<String, Object> selectRecrInfo(int recr_no);
	
	public ArrayList<HashMap<String, Object>> selectEntInfoList(HashMap<String, Object> map);
	public ArrayList<HashMap<String, Object>> selectRecrInfoList(int ent_no);
	
	public ArrayList<HashMap<String, Object>> selectFloorRoomCountList(HashMap<String, Object> map);
	
	public ArrayList<HashMap<String, Object>> selectRoomSelectList(String floorCode);
	public ArrayList<HashMap<String, Object>> selectEntYearList();
	public ArrayList<HashMap<String, Object>> selectEntAlloCntSummary();

	
}
