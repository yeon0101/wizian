package com.ca.dormitory.student.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ca.dormitory.student.board.mapper.BoardSQLMapper;
import com.ca.dormitory.vo.BoardVo;
import com.ca.dormitory.vo.CommentVo;
import com.ca.dormitory.vo.EntStudVo;

@Service
public class BoardService {
	
	@Autowired
	private BoardSQLMapper boardSQLMapper;
	
	//게시판 insert
	public void WriteBoard(BoardVo boaradVo) {
		boardSQLMapper.insertBoard(boaradVo); 
	}
	
	public EntStudVo getEntStudByStuId(String studID) {
		return boardSQLMapper.selectStudentInfoByID(studID);
	}
	
	
	//boardData리스트 가져오기
	public ArrayList<HashMap<String, Object>> getBoardList() {
		
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String, Object>>(); 
		ArrayList<BoardVo> boardList = boardSQLMapper.selectBoardByBoardAll();
		
		for(BoardVo boardVo : boardList) {
			int entStudNo = boardVo.getEnt_stud_no();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("boardVo", boardVo);
			map.put("entStudVo", boardSQLMapper.selectEntStudByStudNo(entStudNo));
			
			dataList.add(map);
		}
		return dataList;
	}
	
	//게시판 상세보기 
	public HashMap<String, Object> getBoardData(int boardNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		BoardVo	boardVo = boardSQLMapper.selectBoardByBoardNo(boardNo);
		int entStudNo = boardVo.getEnt_stud_no();
		
		map.put("boardVo", boardVo);
		map.put("entStudVo", boardSQLMapper.selectEntStudByStudNo(entStudNo));
		return map; 
	}
	
	
	public EntStudVo getEntStudInfo(String stud_id) {
		return boardSQLMapper.selectEntStudByNo(stud_id);
	}
	
	//삭제
		public void deleteBoardData(int board_no) {
			boardSQLMapper.deleteByBoardNo(board_no);
		}
		
		//수정
		public void updateBoardData(BoardVo boardVo) {
			boardSQLMapper.updateBoard(boardVo);
		}
	
	//댓글
	public void WriteComment(CommentVo commentVo) {
		boardSQLMapper.insertComment(commentVo);
	}
	
	public ArrayList<HashMap<String, Object>>getCommentList(int boardNo){
		ArrayList<HashMap<String, Object>> datas = new ArrayList<HashMap<String,Object>>();
		ArrayList<CommentVo> commentList  = boardSQLMapper.selectCommentList(boardNo);
		
		for(CommentVo commentVo : commentList) {
			int entStudNo = commentVo.getEnt_stud_no();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("commentVo", commentVo);
			map.put("entStudVo", boardSQLMapper.selectEntStudByStudNo(entStudNo));
			
			datas.add(map);
		}
		
		return datas;
		
	}
	
	public void deleteCommentData(int board_no) {
		boardSQLMapper.deleteComment(board_no);
	}
}
