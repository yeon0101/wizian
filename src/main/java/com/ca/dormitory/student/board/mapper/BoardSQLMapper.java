package com.ca.dormitory.student.board.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ca.dormitory.vo.BoardVo;
import com.ca.dormitory.vo.CommentVo;
import com.ca.dormitory.vo.EntStudVo;

public interface BoardSQLMapper {

	//게시판
	public void insertBoard(BoardVo boardVo);
	//public EntStudVo selectEntStudByApplNo(int appl_no);	
	public EntStudVo selectStudentInfoByID(String studID);
	public ArrayList<BoardVo> selectBoardByBoardAll();
	public BoardVo selectBoardByBoardNo(int boardNo);
	public void deleteByBoardNo(int board_no);
	public void updateBoard(BoardVo boardVo);
	
	public void insertComment(CommentVo commentVo);
	public ArrayList<CommentVo> selectCommentList(int boardNo);
	public EntStudVo selectEntStudByNo(String stud_id);
	public HashMap<String, Object> selectEntStudByStudNo(int entStudNo);
	public void deleteComment(int cmmt_no);
}
