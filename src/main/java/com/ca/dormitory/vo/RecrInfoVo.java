package com.ca.dormitory.vo;

import java.sql.Date;

public class RecrInfoVo {
	private int recr_no;
	private int ent_no;
	private String recr_name;
	private String recr_msg;
	private String recr_div;
	private Date recr_start_date;
	private Date recr_end_date;
	private Date qry_start_date;
	private Date qry_end_date;
	private Date rcv_start_date;
	private Date rcv_end_date;
	public RecrInfoVo() {
		super();
	}
	public RecrInfoVo(int recr_no, int ent_no, String recr_name, String recr_msg, String recr_div, Date recr_start_date,
			Date recr_end_date, Date qry_start_date, Date qry_end_date, Date rcv_start_date, Date rcv_end_date) {
		super();
		this.recr_no = recr_no;
		this.ent_no = ent_no;
		this.recr_name = recr_name;
		this.recr_msg = recr_msg;
		this.recr_div = recr_div;
		this.recr_start_date = recr_start_date;
		this.recr_end_date = recr_end_date;
		this.qry_start_date = qry_start_date;
		this.qry_end_date = qry_end_date;
		this.rcv_start_date = rcv_start_date;
		this.rcv_end_date = rcv_end_date;
	}
	public int getRecr_no() {
		return recr_no;
	}
	public void setRecr_no(int recr_no) {
		this.recr_no = recr_no;
	}
	public int getEnt_no() {
		return ent_no;
	}
	public void setEnt_no(int ent_no) {
		this.ent_no = ent_no;
	}
	public String getRecr_name() {
		return recr_name;
	}
	public void setRecr_name(String recr_name) {
		this.recr_name = recr_name;
	}
	public String getRecr_msg() {
		return recr_msg;
	}
	public void setRecr_msg(String recr_msg) {
		this.recr_msg = recr_msg;
	}
	public String getRecr_div() {
		return recr_div;
	}
	public void setRecr_div(String recr_div) {
		this.recr_div = recr_div;
	}
	public Date getRecr_start_date() {
		return recr_start_date;
	}
	public void setRecr_start_date(Date recr_start_date) {
		this.recr_start_date = recr_start_date;
	}
	public Date getRecr_end_date() {
		return recr_end_date;
	}
	public void setRecr_end_date(Date recr_end_date) {
		this.recr_end_date = recr_end_date;
	}
	public Date getQry_start_date() {
		return qry_start_date;
	}
	public void setQry_start_date(Date qry_start_date) {
		this.qry_start_date = qry_start_date;
	}
	public Date getQry_end_date() {
		return qry_end_date;
	}
	public void setQry_end_date(Date qry_end_date) {
		this.qry_end_date = qry_end_date;
	}
	public Date getRcv_start_date() {
		return rcv_start_date;
	}
	public void setRcv_start_date(Date rcv_start_date) {
		this.rcv_start_date = rcv_start_date;
	}
	public Date getRcv_end_date() {
		return rcv_end_date;
	}
	public void setRcv_end_date(Date rcv_end_date) {
		this.rcv_end_date = rcv_end_date;
	}
	
}
