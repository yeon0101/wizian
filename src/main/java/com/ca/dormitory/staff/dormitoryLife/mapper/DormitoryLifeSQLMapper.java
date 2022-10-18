package com.ca.dormitory.staff.dormitoryLife.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.ca.dormitory.vo.ActDtlVo;
import com.ca.dormitory.vo.ActStdVo;
import com.ca.dormitory.vo.BldgVo;
import com.ca.dormitory.vo.EntInfoVo;
import com.ca.dormitory.vo.EntStudVo;
import com.ca.dormitory.vo.PenDtlVo;
import com.ca.dormitory.vo.PenStdVo;
import com.ca.dormitory.vo.StudInfoVo;

public interface DormitoryLifeSQLMapper {
	
	public HashMap<String, Object> selectStaffAndAdminByID(String staffID); //직원정보+생활관담당자 정보 가져오기
	
	public HashMap<String, Object> selectStaffAndAdminByNo(int no);
	
	public ArrayList<ActStdVo> selectACTStandardList(); //외박활동코드 리스트
	
	public ActStdVo selectActStandardByNo(String no); //외박활동코드 이름가져오기
	
//	public ArrayList<ActDtlVo> selectACTListByStanAndReqDT(@Param("act_cd")String act_cd, 
//			@Param("actReqDate")String actReqDate); // 날짜랑 외박활동코드로 외박 신청리스트 가져오기
	
	public ArrayList<ActDtlVo> selectACTList(
			@Param("actReqDate")String actReqDate,@Param("act_cd")String act_cd,
			@Param("stud_id")String stud_id, @Param("stud_name")String stud_name,
			@Param("bldg_code")String bldg_code,@Param("act_conf_yn")String act_conf_yn);
	
	public int selectEntNoByStudInfo( //사용X
			@Param("stud_id")String stud_id,
			@Param("stud_name")String stud_name
			);
	public int CountselectedActList(
			@Param("actReqDate")String actReqDate,@Param("act_cd")String act_cd,
			@Param("stud_id")String stud_id, @Param("stud_name")String stud_name,
			@Param("bldg_code")String bldg_code,@Param("act_conf_yn")String act_conf_yn
			);
	
	public ArrayList<BldgVo> selectBLDGList();//호관정보
	
	public HashMap<String, Object> selectConstructionInfoBYNo(int no); //관생NO로 조회: 호관+호관층+호실
	
	public HashMap<String, Object> selectStudInfoByNo(int no); //관생NO로 조회: 학생정보
	
	public ActDtlVo selectActDtlByNo(int no);//act_no로 외박신청상세보기
	
	public void updateActConf(int no); //외박승인
	
	//벌점 관련
	public ArrayList<EntInfoVo> entInfoList();
	
	public ArrayList<HashMap<String, Object>> selectStudByEntNoAndBldg( 
			@Param("ent_no")int ent_no,@Param("bldg_code")String bldg_code); //학생정보가져오기 by호관및 입사정보
	
		//여기서부터 다시합쳐야함
	public ArrayList<PenStdVo> penStdList(); //벌점기준리스트
	
	public HashMap<String, Object> selectPenPTByCD(String CD); //벌점 가져오기
	
	public ArrayList<PenDtlVo> selectPenList(
			@Param("ent_no")int ent_no, @Param("bldg_code")String bldg_code,
			@Param("penDate")String penDate,@Param("stud_id")String stud_id,
			@Param("stud_name")String stud_name,@Param("pen_conf_yn")String pen_conf_yn) ;
	
	public int countSelectedPenList(
			@Param("ent_no")int ent_no, @Param("bldg_code")String bldg_code,
			@Param("penDate")String penDate,@Param("stud_id")String stud_id,
			@Param("stud_name")String stud_name,@Param("pen_conf_yn")String pen_conf_yn);
	
			
	public PenDtlVo selectPenDtlByNo(int no);
	
	public ArrayList<HashMap<String, Object>> searchStudInfo(
			@Param("ent_no")int ent_no, @Param("room_code")String room_code,
			@Param("stud_id")String stud_id, @Param("stud_name")String stud_name);
	
	public int createPenPK(); //벌점PK a만들기
	public void insertPenalty(PenDtlVo penDtlVo);
}
