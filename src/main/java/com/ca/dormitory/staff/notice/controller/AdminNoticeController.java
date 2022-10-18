package com.ca.dormitory.staff.notice.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.staff.notice.service.NoticeService;
import com.ca.dormitory.vo.NoticeVo;

@Controller
@RequestMapping("staff/adminNotice/*")
public class AdminNoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("adminNoticePage")
	public String adminNoticePage(Model model,String searchType , String searchWord) {
		
		model.addAttribute("dataList",noticeService.getNoticeDt(searchType,searchWord));
		
		return "staff/adminNotice/adminNoticePage";
	}
	
	//공지 작성
	@RequestMapping("adminWriteNoticePage")
	public String adminWriteNoticePage() {
		
		//StaffVo staffVo = noticeService.getNoticeWriter(admin_no);
		//model.addAttribute("staffVo", staffVo);
		return "staff/adminNotice/adminWriteNoticePage";
	}
	
	
	//공지프로세스
		@RequestMapping("writeNoticeProcess")
			public String writeNoticeProcess(NoticeVo noticeVo) {
			
			noticeService.writeNotice(noticeVo);
			
				return "redirect:./adminNoticePage";
			}
}