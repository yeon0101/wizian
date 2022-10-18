package com.ca.dormitory.student.dormitoryLife.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.staff.dormitoryLife.mapper.DormitoryLifeSQLMapper;
import com.ca.dormitory.student.dormitoryLife.mapper.StuDormitoryLifeSQLMapper;
import com.ca.dormitory.vo.ActDtlVo;
import com.ca.dormitory.vo.EntStudVo;
import com.ca.dormitory.vo.PenDtlVo;

@Service
public class StuDormitoryLifeService {

	@Autowired
	private StuDormitoryLifeSQLMapper stuDomitoryLifeSQLMapper;
	@Autowired
	private DormitoryLifeSQLMapper dormitoryLifeSQLMapper;
	
	public HashMap<String, Object> selectStudentInfoByID(String stud_id){
		return stuDomitoryLifeSQLMapper.selectStudentInfoByID(stud_id);
	}
	
	public List<HashMap<String, Object>> selectENTInfoByID(String stud_id){
		return stuDomitoryLifeSQLMapper.selectENTInfoByID(stud_id);
	}
	
	public HashMap<String, Object> selectDMTInfoByRoom(String room_code){
		return stuDomitoryLifeSQLMapper.selectDMTInfoByRoom(room_code);
	}
	
	public EntStudVo selectENTStudentInfoByID(String stud_id){
		return stuDomitoryLifeSQLMapper.selectENTStudentInfoByID(stud_id);
	}
	
	public void insertActDtl(ActDtlVo actDtlVo) { //외박신청
		int actNo = stuDomitoryLifeSQLMapper.createActDtlPK();
		actDtlVo.setAct_no(actNo);
		
		stuDomitoryLifeSQLMapper.insertActDtl(actDtlVo);
		stuDomitoryLifeSQLMapper.updateStartEndDate(actDtlVo);
	}
	
	public ArrayList<ActDtlVo> getMyActDtlList(String studID, int entNo){
		return stuDomitoryLifeSQLMapper.myActDtlList(studID, entNo);
	}
	
	public void cancelMyActByNo(int act_no) {
		stuDomitoryLifeSQLMapper.cancelMyActByNo(act_no);
	}
	
	public ActDtlVo getMyActByNo(int act_no) {
		return stuDomitoryLifeSQLMapper.selectMyActByNo(act_no);	}
	
	public ArrayList<HashMap<String, Object>> ApplList(String stud_id){
        return stuDomitoryLifeSQLMapper.ApplList(stud_id);
   }
	//윤설:입사자종합
	public ArrayList<HashMap<String, Object>> getMyPenList(
			String stud_id, int ent_stud_no, String startDate, String endDate){ //입사자종합: 내벌점리스트
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<PenDtlVo> penList = stuDomitoryLifeSQLMapper.selectMyPenList(stud_id,ent_stud_no, startDate, endDate);
		
		for(PenDtlVo penDtlVo : penList) {
			String cd= penDtlVo.getPen_cd();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("penStd",dormitoryLifeSQLMapper.selectPenPTByCD(cd));
			map.put("penDtlVo", penDtlVo);
			dataList.add(map);
		}
		return dataList;
	}
	
	public ArrayList<HashMap<String, Object>> getMyActList(
			String stud_id, int ent_stud_no, String actStrDate, String actEntDate){

		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();	
		ArrayList<ActDtlVo> actList = stuDomitoryLifeSQLMapper.selectMyActList(stud_id, ent_stud_no, actStrDate, actEntDate);

		for(ActDtlVo actDtlVo : actList) {
			String cd = actDtlVo.getAct_cd();
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("actStd", dormitoryLifeSQLMapper.selectActStandardByNo(cd));
			map.put("actDtlVo", actDtlVo);
			dataList.add(map);
		}
		return dataList;
	}
	
	
	
	
	
	
	
}
