package com.ca.dormitory.staff.notice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.staff.notice.mapper.NoticeSQLMapper;
import com.ca.dormitory.vo.AdminVo;
import com.ca.dormitory.vo.BoardVo;
import com.ca.dormitory.vo.NoticeVo;
import com.ca.dormitory.vo.StaffVo;

@Service
public class NoticeService {
	@Autowired
	private NoticeSQLMapper noticeSQLMapper;
	
	public void writeNotice(NoticeVo noticeVo) {
		noticeSQLMapper.insertNotice(noticeVo);
	}
	
	
	public ArrayList<HashMap<String, Object>> getNoticeDt(String searchType, String searchWord){
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<NoticeVo> noticeList = noticeSQLMapper.selectNoticeByNoticeAll(searchType, searchWord);
		for(NoticeVo noticeVo : noticeList) {
			int adminNo = noticeVo.getAdmin_no();
			StaffVo staffVo = noticeSQLMapper.selectNoticeByAdminNo(adminNo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("noticeVo", noticeVo);
			map.put("staffVo", staffVo);
			dataList.add(map);
			
		}
			return dataList;
		
	}
	
	public HashMap<String, Object> getNoticeDetail(int noticeNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		NoticeVo noticeVo = noticeSQLMapper.selectNoticeByNoticeNo(noticeNo);
		int adminNo = noticeVo.getAdmin_no();
		System.out.println(adminNo);
		StaffVo staffVo = noticeSQLMapper.selectNoticeByAdminNo(adminNo);
		
		map.put("noticeVo", noticeVo);
		map.put("staffVo", staffVo);
		
		return map;
	}
	
	//담당자 이름 가져오기
		public StaffVo getNoticeWriter(int admin_no) {
			return noticeSQLMapper.selectNoticeByAdminNo(admin_no);
		}
		
	//공자 조회수
		public void increaseReadCount(int noticeNo) {
			noticeSQLMapper.updateByreadCount(noticeNo);		
			
		}
			
		public AdminVo getAdminByStaffId(String staffId) {
			return noticeSQLMapper.selectAdminByStaffId(staffId);
		}
		
		public void deleteNotice(int noticeNo) {
			noticeSQLMapper.deleteByNoticeNo(noticeNo);
		}
		
}
