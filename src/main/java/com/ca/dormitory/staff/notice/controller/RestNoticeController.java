package com.ca.dormitory.staff.notice.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.staff.notice.service.NoticeService;
import com.ca.dormitory.vo.AdminVo;
import com.ca.dormitory.vo.NoticeVo;
import com.ca.dormitory.vo.StaffVo;

@RestController
@RequestMapping("/staff/adminNotice/*")
public class RestNoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("callWriteNoticeProcess")
	public HashMap<String, Object> writeNoticeProcess(HttpSession session) {
    
		HashMap<String, Object> map = new HashMap<String, Object>();
		StaffVo staffVo =(StaffVo)session.getAttribute("sessionStaffInfo");
		AdminVo adminVo = noticeService.getAdminByStaffId(staffVo.getStaff_id());
				
		map.put("result", "success");
		map.put("staffVo", staffVo);
		map.put("adminVo", adminVo);
		return map;
	}
	
	@RequestMapping("readNoticeProcess")
	public HashMap<String, Object> readNoticeProcess(HttpSession session, int notice_no) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		HashMap<String, Object> dataList = noticeService.getNoticeDetail(notice_no);
		
		//HTML escape .. 특수문자 처리<br> &npsp;
//				NoticeVo noticeVo = (NoticeVo)dataList.get("noticeVo");
//				String content = noticeVo.getNotice_content(); 
//				content = StringEscapeUtils.escapeHtml4(content);
//				content = content.replaceAll(" ", "&nbsp;");
//				content = content.replaceAll("\n", "<br>");
//				noticeVo.setNotice_content(content);
				
		map.put("result", "success");
		map.put("dataList", dataList);
		return map;
		
	}
	
	@RequestMapping("deleteNoticeProcess")
	public HashMap<String, Object> deleteNoticeProcess(String[] notice_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i<notice_no.length-1; i++) {
			int no = Integer.parseInt(notice_no[i]);
			
			//System.out.println(i+"확인:"+notice_no[i]);
			//System.out.println(i+"확인:"+no);
			noticeService.deleteNotice(no);
		}
		
		
		
		map.put("result", "success");
	
		return map;
		
	}
	
}
