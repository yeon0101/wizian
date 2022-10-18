package com.ca.dormitory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeVo {

	private int notice_no;
	private int admin_no;
	private String notice_title;
	private String notice_content;
	private int notice_readcount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date notice_reg_dt;
	private int notice_pin;
	
	public NoticeVo() {
		super();
	}
	public NoticeVo(int notice_no, int admin_no, String notice_title, String notice_content, int notice_readcount,
			Date notice_reg_dt, int notice_pin) {
		super();
		this.notice_no = notice_no;
		this.admin_no = admin_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_readcount = notice_readcount;
		this.notice_reg_dt = notice_reg_dt;
		this.notice_pin = notice_pin;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public Date getNotice_reg_dt() {
		return notice_reg_dt;
	}
	public void setNotice_reg_dt(Date notice_reg_dt) {
		this.notice_reg_dt = notice_reg_dt;
	}
	public int getNotice_pin() {
		return notice_pin;
	}
	public void setNotice_pin(int notice_pin) {
		this.notice_pin = notice_pin;
	}
	
	
	
	
}
