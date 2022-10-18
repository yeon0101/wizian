package com.ca.dormitory.student.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ca.dormitory.student.board.service.BoardService;
import com.ca.dormitory.vo.BoardVo;
import com.ca.dormitory.vo.EntStudVo;
import com.ca.dormitory.vo.StudInfoVo;
@Controller
@RequestMapping("/student/board/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//학생 게시판
	@RequestMapping("boardListPage")
	public String boardListPage(Model model , HttpSession session) {
		
		StudInfoVo studInfoVo = (StudInfoVo)session.getAttribute("sessionStudentInfo");
		
		
		model.addAttribute("entStuInfo", boardService.getEntStudInfo(studInfoVo.getStud_id()));
		model.addAttribute("boardList", boardService.getBoardList());
		return "student/board/boardListPage";
	}
	
	//글쓰기 페이지
	@RequestMapping("writeBoardPage")
	public String writeBoardPage(HttpSession session, Model model) {
		
		StudInfoVo studInfoVo = (StudInfoVo)session.getAttribute("sessionStudentInfo");
		
		EntStudVo entStudVo = boardService.getEntStudByStuId(studInfoVo.getStud_id());
		
		model.addAttribute("studInfoVo", studInfoVo);
		model.addAttribute("entStudVo", entStudVo);
		return "student/board/writeBoardPage";
	}
	
	@RequestMapping("writeBoardProcess")
	public String writeBoardProcess(BoardVo boardVo) {
		
		boardService.WriteBoard(boardVo);
		
		return "redirect:./boardListPage";    
	}
	
	@RequestMapping("readBoardPage")
	public String readBoardPage(Model model, int board_no, HttpSession session) {
		
		//StudInfoVo studInfoVo = (StudInfoVo)session.getAttribute("sessionStudentInfo");
		
		HashMap<String, Object> data = boardService.getBoardData(board_no);
		
		BoardVo boardVo = (BoardVo)data.get("boardVo");
		String content = boardVo.getBoard_content(); 
		content = StringEscapeUtils.escapeHtml4(content);
		content = content.replaceAll(" ", "&nbsp;");
		content = content.replaceAll("\n", "<br>");
		boardVo.setBoard_content(content);
		
		model.addAttribute("data", data);
		//model.addAttribute("entStuInfo", boardService.getEntStudInfo(studInfoVo.getStud_id()));
		return "student/board/readBoardPage";
	}
	
	@RequestMapping("deleteBoardProcess")
	public String deleteBoardProcess(int board_no) {
		
		boardService.deleteBoardData(board_no);
		
		return "redirect:./boardListPage";
	}
	
	@RequestMapping("updateBoardProcess")
	public String updateBoardProcess(BoardVo boardVo) {
		
		boardService.updateBoardData(boardVo);
		
		return "redirect:./boardListPage";
	}
}
