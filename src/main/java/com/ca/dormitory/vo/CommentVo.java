package com.ca.dormitory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CommentVo {
	private int cmmt_no;
	private int board_no;
	private int ent_stud_no;
	private String cmmt_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmmt_reg_dt;
	public CommentVo() {
		super();
	}
	public CommentVo(int cmmt_no, int board_no, int ent_stud_no, String cmmt_content, Date cmmt_reg_dt) {
		super();
		this.cmmt_no = cmmt_no;
		this.board_no = board_no;
		this.ent_stud_no = ent_stud_no;
		this.cmmt_content = cmmt_content;
		this.cmmt_reg_dt = cmmt_reg_dt;
	}
	public int getCmmt_no() {
		return cmmt_no;
	}
	public void setCmmt_no(int cmmt_no) {
		this.cmmt_no = cmmt_no;
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
	public String getCmmt_content() {
		return cmmt_content;
	}
	public void setCmmt_content(String cmmt_content) {
		this.cmmt_content = cmmt_content;
	}
	public Date getCmmt_reg_dt() {
		return cmmt_reg_dt;
	}
	public void setCmmt_reg_dt(Date cmmt_reg_dt) {
		this.cmmt_reg_dt = cmmt_reg_dt;
	}
	
	
}
