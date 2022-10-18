package com.ca.dormitory.staff.notice.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ca.dormitory.vo.AdminVo;
import com.ca.dormitory.vo.BoardVo;
import com.ca.dormitory.vo.NoticeVo;
import com.ca.dormitory.vo.StaffVo;

public interface NoticeSQLMapper {
	//공지
		public void insertNotice(NoticeVo noticeVo);
		public ArrayList<NoticeVo> selectNoticeByNoticeAll(
				@Param("searchType") String searchType, 
				@Param("searchWord") String searchWord
				);
		public NoticeVo selectNoticeByNoticeNo(int noticeNo);
		public StaffVo selectNoticeByAdminNo(int adminNo);
		public AdminVo selectAdminByAdminNo(int adminNo);
		public void updateByreadCount(int noticeNo);
		public AdminVo selectAdminByStaffId(String staff_id);
		public void deleteByNoticeNo(int noticeNo);
}
