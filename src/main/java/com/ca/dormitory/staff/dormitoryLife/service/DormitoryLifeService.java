package com.ca.dormitory.staff.dormitoryLife.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.staff.dormitoryLife.mapper.DormitoryLifeSQLMapper;
import com.ca.dormitory.vo.ActDtlVo;
import com.ca.dormitory.vo.ActStdVo;
import com.ca.dormitory.vo.BldgVo;
import com.ca.dormitory.vo.EntInfoVo;
import com.ca.dormitory.vo.EntStudVo;
import com.ca.dormitory.vo.PenDtlVo;
import com.ca.dormitory.vo.PenStdVo;
import com.ca.dormitory.vo.StudInfoVo;

@Service
public class DormitoryLifeService {

	@Autowired
	private DormitoryLifeSQLMapper dormitoryLifeSQLMapper;
	
	public HashMap<String, Object> getStaffAndAdminInfoByID(String staff_id){ //직원정보+생활관담당자 정보가져가오기
		return dormitoryLifeSQLMapper.selectStaffAndAdminByID(staff_id);
	}
	
	public ArrayList<ActStdVo> selectACTStandardList() {//외박활동기준 리스트
		return dormitoryLifeSQLMapper.selectACTStandardList();
	}
	
//	public ArrayList<HashMap<String,Object>>getACTListByStanAndReqDT(String act_cd, String actReqDate){// 신청한 외박리스트조회(외박코드, 신청날짜)
//		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
//		ArrayList<ActDtlVo> actList = dormitoryLifeSQLMapper.selectACTListByStanAndReqDT(act_cd, actReqDate); //조회...
//		
//		for(ActDtlVo actDtlVo : actList) {
//			int no = actDtlVo.getEnt_stud_no();
//			
//			HashMap<String, Object> map = new HashMap<String, Object>();
//			map.put("ConstructionInfo", dormitoryLifeSQLMapper.selectConstructionInfoBYNo(no));
//			map.put("StudInfo",dormitoryLifeSQLMapper.selectStudInfoByNo(no));
//			map.put("actDtlVo", actDtlVo);
//			dataList.add(map);
//		}	
//		return dataList;
//	}
	
	public ArrayList<HashMap<String, Object>> getActList( //신청한 외박리스트 : 검색조건 동적쿼리
		   String actReqDate,String act_cd,String stud_id,String stud_name, String bldg_code,String act_conf_yn){
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<ActDtlVo> actList = dormitoryLifeSQLMapper.selectACTList(actReqDate, act_cd, stud_id, stud_name, bldg_code, act_conf_yn);
		
		for(ActDtlVo actDtlVo : actList) {
			int no = actDtlVo.getEnt_stud_no();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("actDtlVo", actDtlVo);
			map.put("StudInfo", dormitoryLifeSQLMapper.selectStudInfoByNo(no));
			map.put("ConstructionInfo", dormitoryLifeSQLMapper.selectConstructionInfoBYNo(no));
			map.put("actStnVo", dormitoryLifeSQLMapper.selectActStandardByNo(actDtlVo.getAct_cd()));
			dataList.add(map);
			
		}
		return dataList;
	}
	
	public int CountselectedActList(String actReqDate,String act_cd,String stud_id,String stud_name, String bldg_code,String act_conf_yn) {
		return dormitoryLifeSQLMapper.CountselectedActList(actReqDate, act_cd, stud_id, stud_name, bldg_code, act_conf_yn);
	}
	
	public int getEntNoByStudInfo(String stud_id, String stud_name) { //사용X
		return dormitoryLifeSQLMapper.selectEntNoByStudInfo(stud_id, stud_name);
	}
	
	public ArrayList<BldgVo> getBLDGList(){ //호관정보
		return dormitoryLifeSQLMapper.selectBLDGList();
	}
	
	public HashMap<String, Object> getActDtlByNo(int act_no) { //외박신청상세보기
		HashMap<String, Object> map = new HashMap<String, Object>();
		ActDtlVo actDtlVo = dormitoryLifeSQLMapper.selectActDtlByNo(act_no);
		int no =actDtlVo.getEnt_stud_no();
		
		map.put("actDtlVo", actDtlVo);
		map.put("StudInfo", dormitoryLifeSQLMapper.selectStudInfoByNo(no));
		map.put("ConstructionInfo", dormitoryLifeSQLMapper.selectConstructionInfoBYNo(no));
		map.put("actStnVo", dormitoryLifeSQLMapper.selectActStandardByNo(actDtlVo.getAct_cd()));
		
		return map;
	}
	
	public void updateActConf(int act_no) { //외박승인
		dormitoryLifeSQLMapper.updateActConf(act_no);
	}
	//벌점관련!~~
	public ArrayList<EntInfoVo> getEntInfoList(){
		return dormitoryLifeSQLMapper.entInfoList();
	}
	
	public ArrayList<HashMap<String, Object>> getStudByEntNoAndBldg(int ent_no,String bldg_code){ //학생정보 by 입사단위정보+호관
		return dormitoryLifeSQLMapper.selectStudByEntNoAndBldg(ent_no, bldg_code);
	}
	 	//여기서부터 다시 합쳐야함
	public ArrayList<PenStdVo> getPenStdList(){ //벌점기준리스트
		return dormitoryLifeSQLMapper.penStdList();
	}
	
	public HashMap<String, Object> selectPenPTByCD(String pen_cd){ //벌점 가져오기
		return dormitoryLifeSQLMapper.selectPenPTByCD(pen_cd);
	}
	
	public ArrayList<HashMap<String, Object>> getPenList(
			int ent_no,String bldg_code ,String penDate, 
			String stud_id,String stud_name,String pen_conf_yn){
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<PenDtlVo> penList = dormitoryLifeSQLMapper.selectPenList(ent_no, bldg_code,penDate, stud_id, stud_name, pen_conf_yn);
		
		for(PenDtlVo penDtlVo: penList) {
			int no =penDtlVo.getEnt_stud_no();
			//System.out.println(no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("penDtlVo", penDtlVo);
			map.put("StudInfo", dormitoryLifeSQLMapper.selectStudInfoByNo(no));
			map.put("ConstructionInfo", dormitoryLifeSQLMapper.selectConstructionInfoBYNo(no));
			map.put("penStd", dormitoryLifeSQLMapper.selectPenPTByCD(penDtlVo.getPen_cd()));
			dataList.add(map);
		}
		return dataList;
	}
	//벌점내역 조회한 count 가져오기
	public int countSelectedPenList(int ent_no,String bldg_code ,String penDate, 
			String stud_id,String stud_name,String pen_conf_yn) {
		return dormitoryLifeSQLMapper.countSelectedPenList(ent_no, bldg_code, penDate, stud_id, stud_name, pen_conf_yn);
	}
	
	public HashMap<String, Object> getPenDtlByNo(int pen_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		PenDtlVo penDtlVo = dormitoryLifeSQLMapper.selectPenDtlByNo(pen_no);
		int no = penDtlVo.getEnt_stud_no();
		map.put("penDtlVo", penDtlVo);
		map.put("StudInfo", dormitoryLifeSQLMapper.selectStudInfoByNo(no));
		map.put("penStd", dormitoryLifeSQLMapper.selectPenPTByCD(penDtlVo.getPen_cd()));
		map.put("staffInfo", dormitoryLifeSQLMapper.selectStaffAndAdminByNo(penDtlVo.getAdmin_no()));
		
		return map;
	}
	
	public ArrayList<HashMap<String, Object>> searchStudInfo(int ent_no, String room_code, String stud_id, String stud_name){
			
		return dormitoryLifeSQLMapper.searchStudInfo(ent_no, room_code, stud_id, stud_name);
	}
	
	public void insertPenalty(PenDtlVo penDtlVo) { //벌점부여
		int no = dormitoryLifeSQLMapper.createPenPK();
		penDtlVo.setPen_no(no);
		dormitoryLifeSQLMapper.insertPenalty(penDtlVo);
	}

}
