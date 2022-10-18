package com.ca.dormitory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVo {
	private int board_no; 
	private int ent_stud_no;
	private String room_code;
	private String board_title; 
	private String board_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date board_reg_dt;
	
	public BoardVo() {
		super();
	}
	public BoardVo(int board_no, int ent_stud_no, String room_code, String board_title, String board_content,
			Date board_reg_dt) {
		super();
		this.board_no = board_no;
		this.ent_stud_no = ent_stud_no;
		this.room_code = room_code;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_reg_dt = board_reg_dt;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getEnt_stud_no() {
		return ent_stud_no;
	}
	public void setEnt_stud_no(int ent_stud_no) {
		this.ent_stud_no = ent_stud_no;
	}
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_reg_dt() {
		return board_reg_dt;
	}
	public void setBoard_reg_dt(Date board_reg_dt) {
		this.board_reg_dt = board_reg_dt;
	}
	

	
	
}
