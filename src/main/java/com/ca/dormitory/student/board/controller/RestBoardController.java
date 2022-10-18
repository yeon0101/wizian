package com.ca.dormitory.student.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ca.dormitory.student.board.service.BoardService;
import com.ca.dormitory.vo.CommentVo;
import com.ca.dormitory.vo.StudInfoVo;

@RestController
@RequestMapping("/student/board/*")
public class RestBoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("writeComment")
	public HashMap<String, Object> writeComment(CommentVo commentVo , HttpSession session) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		StudInfoVo studInfoVo = (StudInfoVo)session.getAttribute("sessionStudentInfo");
		
		boardService.WriteComment(commentVo);
		
		map.put("result", "success");
		map.put("data", studInfoVo);
		
		return map;
	}
	
	@RequestMapping("getCommentList")
	public HashMap<String, Object> getCommentList(int board_no, HttpSession session){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("data", boardService.getCommentList(board_no));
		return map;
	}
	
	@RequestMapping("deleteCommentProcess")
	public HashMap<String, Object> deleteCommentProcess(int cmmt_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(cmmt_no);
		
		boardService.deleteCommentData(cmmt_no);
		
		map.put("result", "success");
		return map;
	}
}
