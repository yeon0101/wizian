package com.ca.dormitory.student.main.controller;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.notice.service.NoticeService;
import com.ca.dormitory.vo.NoticeVo;
import com.ca.dormitory.vo.StaffVo;

@Controller
@RequestMapping("/student/main/*")
public class StudentMainController {
	@Autowired
	private NoticeService noticeService;
	
	//메인페이지 공지(제목, 날짜) ,, 자유게싶, 건의게시판..
	@RequestMapping("studentMainPage")
	public String studentMainPage(Model model , String searchType , String searchWord) {
		
		model.addAttribute("dataList", noticeService.getNoticeDt(searchType,searchWord ));
		
		return "student/main/studentMainPage";
	}
	
	
	
	
}