package com.ca.dormitory.student.notice.controller;

import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.notice.service.NoticeService;
import com.ca.dormitory.vo.BoardVo;
import com.ca.dormitory.vo.NoticeVo;
import com.ca.dormitory.vo.StaffVo;

@Controller
@RequestMapping("/student/notice/*")
public class StudentNoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	//탭안에 공지사항 리스트
		@RequestMapping("noticePage")
		public String noticePage(Model model, String searchType , String searchWord) {
			
			model.addAttribute("dataList", noticeService.getNoticeDt(searchType, searchWord));
			
			return "student/notice/noticePage";
		}
		
		//공지 상세
		@RequestMapping("readNoticePage")
		public String readNoticePage(int notice_no, Model model) {		
		 
		noticeService.increaseReadCount(notice_no);	
			
		HashMap<String, Object> dataList = noticeService.getNoticeDetail(notice_no);
		
		//HTML escape .. 특수문자 처리<br> &npsp;
				NoticeVo noticeVo = (NoticeVo)dataList.get("noticeVo");
				String content = noticeVo.getNotice_content(); 
				content = StringEscapeUtils.escapeHtml4(content);
				content = content.replaceAll(" ", "&nbsp;");
				content = content.replaceAll("\n", "<br>");
				noticeVo.setNotice_content(content);	

		model.addAttribute("dataList", dataList);
			return "student/notice/readNoticePage"; 	 	
		}
		
	
		
		
}
