package com.ca.dormitory.staff.dormitoryRoomAssignments.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface DormitoryRoomAssignmentsSQLMapper {
	public ArrayList<HashMap<String, Object>> selectAllDMT_BLDG();
	public ArrayList<HashMap<String, Object>> selectAll$DMT_RECR_INFO$DMT_APPL$CBH_STUD$DMT_STUD_SCORE(String ENT_NO);
	public ArrayList<HashMap<String, Object>> selectAll$DMT_BLDG$DMT_FLOOR$DMT_ROOM(String ENT_NO);
	public ArrayList<HashMap<String, Object>> selectCountAll$CBH_STUD$DMT_APPL$DMT_RECR_INFO$DMT_FLOOR$DMT_ROOM$ByENT_NO$ROOM_CODE(@Param("ENT_NO") String ENT_NO , @Param("ROOM_CODE") String ROOM_CODE);
	public ArrayList<HashMap<String, Object>> selectAllCBH_STUDFrom$CBH_STUD$DMT_APPL$DMT_RECR_INFO$DMT_FLOOR$DMT_ROOM$ByENT_NO$ROOM_CODE(@Param("ENT_NO") String ENT_NO , @Param("ROOM_CODE") String ROOM_CODE);
	public HashMap<String, Object> selectAllFromDMT_ROOMByROOM_CODE(String ROOM_CODE);
	public void updateROOM_CODEFromDMT_APPLByAPPL_NO(@Param("ROOM_CODE") String ROOM_CODE, @Param("APPL_NO") String APPL_NO);
	public void insertDMT_ENT_FEE_DTLByAPPL_NO(String APPL_NO);
	public HashMap<String, Object> selectCBH_STUDJoinTableBySTUD_ID$ENT_NO(@Param("STUD_ID") String STUD_ID, @Param("ENT_NO") String ENT_NO);
	public void updateROOM_CODEFromDMT_APPLByENT_NOandSTUD_ID(@Param("ENT_NO") String ENT_NO, @Param("STUD_ID") String STUD_ID);
	public void deleteDMT_ENT_FEE_DTLByENT_NOandSTUD_ID(@Param("ENT_NO") String ENT_NO, @Param("STUD_ID") String STUD_ID);
	public HashMap<String, Object> selectRownumAndApplDataByENT_NOAndSTUD_ID(@Param("ENT_NO") String ENT_NO,  @Param("STUD_ID") String STUD_ID);
}
