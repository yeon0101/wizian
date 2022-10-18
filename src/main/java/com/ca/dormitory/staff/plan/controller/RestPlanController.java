package com.ca.dormitory.staff.plan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.staff.plan.mapper.PlanSQLMapper;

@RestController
@RequestMapping("/staff/plan/*")
public class RestPlanController {

	@Autowired
	private PlanSQLMapper planSQLMapper;
	
	
	//생활관 호실 정보 관리
	
	//register(void로 고치기)
	@RequestMapping("restBuildingRegisterProcess")
	public void registerBuildingProcess(@RequestParam HashMap<String, Object> param){
		planSQLMapper.insertBldg(param);
	}
	
	@RequestMapping("restFloorRegisterProcess")
	public void restFloorRegisterProcess(@RequestBody HashMap<String, Object> param){
		planSQLMapper.insertFloor(param);
	}
	
	@RequestMapping("restRoomRegisterProcess")
	public HashMap<String, Object> restRoomRegisterProcess(@RequestBody HashMap<String, Object> param){
		planSQLMapper.insertRoom(param);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	
	//get list
	@RequestMapping("restBuildingSummaryList")
	public ArrayList<HashMap<String, Object>> restBuildingSummaryList(){
		return planSQLMapper.selectBuildingSummaryList();
	}
	
	@RequestMapping("restFloorSummaryList")
	public ArrayList<HashMap<String, Object>> restFloorSummaryList(String bldgCode){
		System.out.println(bldgCode);
		return planSQLMapper.selectFloorSummaryList(bldgCode);
	}
	
	@RequestMapping("restBuldingInfo")
	public HashMap<String, Object> restBuldingInfo(String bldgCode){
		return planSQLMapper.selectBldg(bldgCode);
	}
	
	@RequestMapping("restRoomList")
	public ArrayList<HashMap<String, Object>> restRoomList(String floorCode){
		return planSQLMapper.selectRoomList(floorCode);
	} 
	
	@RequestMapping("restEntYearList")
	public ArrayList<HashMap<String, Object>> restEntYearList(){
		return planSQLMapper.selectEntYearList();
	} 
	
	@RequestMapping("restBldgSelectList")
	public ArrayList<HashMap<String, Object>> restBldgSelectList(){
		return planSQLMapper.selectBldgList();
	}
	
	
	
	//delete
	@RequestMapping("restDeleteProcess")
	public void restDeleteProcess(@RequestBody ArrayList<HashMap<String, Object>> paramList){

		for(HashMap<String, Object> param : paramList) {
			switch((String) param.get("target")){
			case "bldgListBody" : planSQLMapper.deleteBldg((String) param.get("bldg_code")); break;
			case "floorListBody" : planSQLMapper.deleteFloor((String) param.get("floor_code")); break;
			case "roomListBody" : planSQLMapper.deleteRoom((String) param.get("room_code")); break;
			case "entInfoListBody" : planSQLMapper.deleteEntInfo((String) param.get("ent_no")); break;
			case "recrInfoListBody" : planSQLMapper.deleteRecrInfo((String) param.get("recr_no")); break;
			}
		}
	}
	
	
	//입사계획관리
	@RequestMapping("restEnterInfoRegisterProcess")
	public HashMap<String, Object> restEnterInfoRegisterProcess(@RequestParam HashMap<String, Object> param){
		HashMap<String, Object> map = new HashMap<String, Object>();
		planSQLMapper.insertEntInfo(param);
		return map;
	}
	
	@RequestMapping("restRecruitmentInfoRegisterProcess")
	public HashMap<String, Object> restRecruitmentInfoRegisterProcess(@RequestParam HashMap<String, Object> param){
		HashMap<String, Object> map = new HashMap<String, Object>();
		planSQLMapper.insertRecrInfo(param);
		return map;
	}
	
	@RequestMapping("restEnterInfo")
	public HashMap<String, Object> restEnterInfo(int ent_no){
		return planSQLMapper.selectEntInfo(ent_no);
	}
	
	@RequestMapping("restRecruitmentInfo")
	public HashMap<String, Object> restRecruitmentInfo(int recr_no){
		return planSQLMapper.selectRecrInfo(recr_no);
	}

	@RequestMapping("restEnterInfoList")
	public ArrayList<HashMap<String, Object>> restEntInfoList(@RequestBody HashMap<String, Object> param){
		System.out.println(param.get("ent_year"));
		System.out.println(param.get("ent_term"));
		System.out.println(param.get("ent_term_div"));
		return planSQLMapper.selectEntInfoList(param);
	} 
	
	
	@RequestMapping("restRecruitmentInfoList")
	public ArrayList<HashMap<String, Object>> restRecrInfoList(int ent_no){
		return planSQLMapper.selectRecrInfoList(ent_no);
	} 
	
	@RequestMapping("restFloorRoomCountList")
	public ArrayList<HashMap<String, Object>> restFloorRoomCountList(@RequestBody HashMap<String, Object> param){
		
		return planSQLMapper.selectFloorRoomCountList(param);
	}
	
	@RequestMapping("restRoomSelectList")
	public ArrayList<HashMap<String, Object>> restRoomSelectList(String floor_code){
		return planSQLMapper.selectRoomList(floor_code);
	}
	
	@RequestMapping("restUpdateAvailableRoom")
	public void restUpdateAvailableRoom(@RequestBody ArrayList<HashMap<String, Object>> paramList) {
		for(HashMap<String, Object> param : paramList) {
			planSQLMapper.updateAvailableRoom(param);
		}
	}
	
	@RequestMapping("restEntAlloCntSummary")
	public ArrayList<HashMap<String, Object>> restEntAlloCntSummary() {
		return planSQLMapper.selectEntAlloCntSummary();
	}
}
