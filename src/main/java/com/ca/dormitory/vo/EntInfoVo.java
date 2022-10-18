package com.ca.dormitory.vo;

import java.sql.Date;

public class EntInfoVo {
	private int ent_no;
	private String ent_name;
	private String ent_year;
	private String ent_term;
	private String ent_term_div;
	private Date open_date;
	private Date close_date;
	private Date ent_reg_date;
	private String ent_agree_msg;
	private String ent_oath_msg;
	public EntInfoVo() {
		super();
	}
	public EntInfoVo(int ent_no, String ent_name, String ent_year, String ent_term, String ent_term_div,
			Date open_date, Date close_date, Date ent_reg_date, String ent_agree_msg, String ent_oath_msg) {
		super();
		this.ent_no = ent_no;
		this.ent_name = ent_name;
		this.ent_year = ent_year;
		this.ent_term = ent_term;
		this.ent_term_div = ent_term_div;
		this.open_date = open_date;
		this.close_date = close_date;
		this.ent_reg_date = ent_reg_date;
		this.ent_agree_msg = ent_agree_msg;
		this.ent_oath_msg = ent_oath_msg;
	}
	public int getEnt_no() {
		return ent_no;
	}
	public void setEnt_no(int ent_no) {
		this.ent_no = ent_no;
	}
	public String getEnt_name() {
		return ent_name;
	}
	public void setEnt_name(String ent_name) {
		this.ent_name = ent_name;
	}
	public String getEnt_year() {
		return ent_year;
	}
	public void setEnt_year(String ent_year) {
		this.ent_year = ent_year;
	}
	public String getEnt_term() {
		return ent_term;
	}
	public void setEnt_term(String ent_term) {
		this.ent_term = ent_term;
	}
	public String getEnt_term_div() {
		return ent_term_div;
	}
	public void setEnt_term_div(String ent_term_div) {
		this.ent_term_div = ent_term_div;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public Date getClose_date() {
		return close_date;
	}
	public void setClose_date(Date close_date) {
		this.close_date = close_date;
	}
	public Date getEnt_reg_date() {
		return ent_reg_date;
	}
	public void setEnt_reg_date(Date ent_reg_date) {
		this.ent_reg_date = ent_reg_date;
	}
	public String getEnt_agree_msg() {
		return ent_agree_msg;
	}
	public void setEnt_agree_msg(String ent_agree_msg) {
		this.ent_agree_msg = ent_agree_msg;
	}
	public String getEnt_oath_msg() {
		return ent_oath_msg;
	}
	public void setEnt_oath_msg(String ent_oath_msg) {
		this.ent_oath_msg = ent_oath_msg;
	}
	
}
