package com.ca.dormitory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ActDtlVo {
	private int act_no;
	private String act_cd;
	private int ent_stud_no;
	private int ent_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date act_req_dt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date act_start_dt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date act_ent_dt;
	private int act_day_cnt;
	private String act_rsn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date act_cancl_dt;
	private String act_conf_yn;
	
	public ActDtlVo() {
		super();
	}

	public ActDtlVo(int act_no, String act_cd, int ent_stud_no, int ent_no, Date act_req_dt, Date act_start_dt,
			Date act_ent_dt, int act_day_cnt, String act_rsn, Date act_cancl_dt, String act_conf_yn) {
		super();
		this.act_no = act_no;
		this.act_cd = act_cd;
		this.ent_stud_no = ent_stud_no;
		this.ent_no = ent_no;
		this.act_req_dt = act_req_dt;
		this.act_start_dt = act_start_dt;
		this.act_ent_dt = act_ent_dt;
		this.act_day_cnt = act_day_cnt;
		this.act_rsn = act_rsn;
		this.act_cancl_dt = act_cancl_dt;
		this.act_conf_yn = act_conf_yn;
	}

	public int getAct_no() {
		return act_no;
	}

	public void setAct_no(int act_no) {
		this.act_no = act_no;
	}

	public String getAct_cd() {
		return act_cd;
	}

	public void setAct_cd(String act_cd) {
		this.act_cd = act_cd;
	}

	public int getEnt_stud_no() {
		return ent_stud_no;
	}

	public void setEnt_stud_no(int ent_stud_no) {
		this.ent_stud_no = ent_stud_no;
	}

	public int getEnt_no() {
		return ent_no;
	}

	public void setEnt_no(int ent_no) {
		this.ent_no = ent_no;
	}

	public Date getAct_req_dt() {
		return act_req_dt;
	}

	public void setAct_req_dt(Date act_req_dt) {
		this.act_req_dt = act_req_dt;
	}

	public Date getAct_start_dt() {
		return act_start_dt;
	}

	public void setAct_start_dt(Date act_start_dt) {
		this.act_start_dt = act_start_dt;
	}

	public Date getAct_ent_dt() {
		return act_ent_dt;
	}

	public void setAct_ent_dt(Date act_ent_dt) {
		this.act_ent_dt = act_ent_dt;
	}

	public int getAct_day_cnt() {
		return act_day_cnt;
	}

	public void setAct_day_cnt(int act_day_cnt) {
		this.act_day_cnt = act_day_cnt;
	}

	public String getAct_rsn() {
		return act_rsn;
	}

	public void setAct_rsn(String act_rsn) {
		this.act_rsn = act_rsn;
	}

	public Date getAct_cancl_dt() {
		return act_cancl_dt;
	}

	public void setAct_cancl_dt(Date act_cancl_dt) {
		this.act_cancl_dt = act_cancl_dt;
	}

	public String getAct_conf_yn() {
		return act_conf_yn;
	}

	public void setAct_conf_yn(String act_conf_yn) {
		this.act_conf_yn = act_conf_yn;
	}
}
