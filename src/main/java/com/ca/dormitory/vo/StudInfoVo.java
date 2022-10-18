package com.ca.dormitory.vo;

import java.util.Date;

public class StudInfoVo {
	private String stud_id;
	private String stud_pw;
	private String stud_name;
	private String stud_phone;
	private String stud_email;
	private String stud_gender;
	private Date stud_birth;
	private String stud_grade;
	private String stud_dept;
	private String stud_photo_link;
	private int stud_vlntr_time;
	private Date stud_reg_dt;
	private String stud_state;

	public StudInfoVo() {
		// TODO Auto-generated constructor stub
	}

	public StudInfoVo(String stud_id, String stud_pw, String stud_name, String stud_phone, String stud_email,
			String stud_gender, Date stud_birth, String stud_grade, String stud_dept, String stud_photo_link,
			int stud_vlntr_time, Date stud_reg_dt, String stud_state) {
		super();
		this.stud_id = stud_id;
		this.stud_pw = stud_pw;
		this.stud_name = stud_name;
		this.stud_phone = stud_phone;
		this.stud_email = stud_email;
		this.stud_gender = stud_gender;
		this.stud_birth = stud_birth;
		this.stud_grade = stud_grade;
		this.stud_dept = stud_dept;
		this.stud_photo_link = stud_photo_link;
		this.stud_vlntr_time = stud_vlntr_time;
		this.stud_reg_dt = stud_reg_dt;
		this.stud_state = stud_state;
	}

	public String getStud_id() {
		return stud_id;
	}

	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}

	public String getStud_pw() {
		return stud_pw;
	}

	public void setStud_pw(String stud_pw) {
		this.stud_pw = stud_pw;
	}

	public String getStud_name() {
		return stud_name;
	}

	public void setStud_name(String stud_name) {
		this.stud_name = stud_name;
	}

	public String getStud_phone() {
		return stud_phone;
	}

	public void setStud_phone(String stud_phone) {
		this.stud_phone = stud_phone;
	}

	public String getStud_email() {
		return stud_email;
	}

	public void setStud_email(String stud_email) {
		this.stud_email = stud_email;
	}

	public String getStud_gender() {
		return stud_gender;
	}

	public void setStud_gender(String stud_gender) {
		this.stud_gender = stud_gender;
	}

	public Date getStud_birth() {
		return stud_birth;
	}

	public void setStud_birth(Date stud_birth) {
		this.stud_birth = stud_birth;
	}

	public String getStud_grade() {
		return stud_grade;
	}

	public void setStud_grade(String stud_grade) {
		this.stud_grade = stud_grade;
	}

	public String getStud_dept() {
		return stud_dept;
	}

	public void setStud_dept(String stud_dept) {
		this.stud_dept = stud_dept;
	}

	public String getStud_photo_link() {
		return stud_photo_link;
	}

	public void setStud_photo_link(String stud_photo_link) {
		this.stud_photo_link = stud_photo_link;
	}

	public int getStud_vlntr_time() {
		return stud_vlntr_time;
	}

	public void setStud_vlntr_time(int stud_vlntr_time) {
		this.stud_vlntr_time = stud_vlntr_time;
	}

	public Date getStud_reg_dt() {
		return stud_reg_dt;
	}

	public void setStud_reg_dt(Date stud_reg_dt) {
		this.stud_reg_dt = stud_reg_dt;
	}

	public String getStud_state() {
		return stud_state;
	}

	public void setStud_state(String stud_state) {
		this.stud_state = stud_state;
	}
	
	
}
