package com.ca.dormitory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PenDtlVo {
	private int pen_no;
	private String pen_cd;
	private int ent_stud_no;
	private int admin_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pen_dt;
	private String pen_rsm;
	private String pen_conf_yn;
	
	public PenDtlVo() {
		super();
	}

	public PenDtlVo(int pen_no, String pen_cd, int ent_stud_no, int admin_no, Date pen_dt, String pen_rsm,
			String pen_conf_yn) {
		super();
		this.pen_no = pen_no;
		this.pen_cd = pen_cd;
		this.ent_stud_no = ent_stud_no;
		this.admin_no = admin_no;
		this.pen_dt = pen_dt;
		this.pen_rsm = pen_rsm;
		this.pen_conf_yn = pen_conf_yn;
	}

	public int getPen_no() {
		return pen_no;
	}

	public void setPen_no(int pen_no) {
		this.pen_no = pen_no;
	}

	public String getPen_cd() {
		return pen_cd;
	}

	public void setPen_cd(String pen_cd) {
		this.pen_cd = pen_cd;
	}

	public int getEnt_stud_no() {
		return ent_stud_no;
	}

	public void setEnt_stud_no(int ent_stud_no) {
		this.ent_stud_no = ent_stud_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public Date getPen_dt() {
		return pen_dt;
	}

	public void setPen_dt(Date pen_dt) {
		this.pen_dt = pen_dt;
	}

	public String getPen_rsm() {
		return pen_rsm;
	}

	public void setPen_rsm(String pen_rsm) {
		this.pen_rsm = pen_rsm;
	}

	public String getPen_conf_yn() {
		return pen_conf_yn;
	}

	public void setPen_conf_yn(String pen_conf_yn) {
		this.pen_conf_yn = pen_conf_yn;
	}
}
