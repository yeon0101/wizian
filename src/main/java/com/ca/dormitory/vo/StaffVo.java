package com.ca.dormitory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class StaffVo {
	private String staff_id;
	private int pstn_div_no;
	private String staff_name;
	private String staff_pw;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date staff_join_date;
	private String staff_phone;
	private String staff_email;
	private String staff_state;
	
	public StaffVo() {
		super();
	}

	public StaffVo(String staff_id, int pstn_div_no, String staff_name, String staff_pw, Date staff_join_date,
			String staff_phone, String staff_email, String staff_state) {
		super();
		this.staff_id = staff_id;
		this.pstn_div_no = pstn_div_no;
		this.staff_name = staff_name;
		this.staff_pw = staff_pw;
		this.staff_join_date = staff_join_date;
		this.staff_phone = staff_phone;
		this.staff_email = staff_email;
		this.staff_state = staff_state;
	}

	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public int getPstn_div_no() {
		return pstn_div_no;
	}
	public void setPstn_div_no(int pstn_div_no) {
		this.pstn_div_no = pstn_div_no;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	public String getStaff_pw() {
		return staff_pw;
	}
	public void setStaff_pw(String staff_pw) {
		this.staff_pw = staff_pw;
	}
	public Date getStaff_join_date() {
		return staff_join_date;
	}
	public void setStaff_join_date(Date staff_join_date) {
		this.staff_join_date = staff_join_date;
	}
	public String getStaff_phone() {
		return staff_phone;
	}
	public void setStaff_phone(String staff_phone) {
		this.staff_phone = staff_phone;
	}
	public String getStaff_email() {
		return staff_email;
	}
	public void setStaff_email(String staff_email) {
		this.staff_email = staff_email;
	}
	public String getStaff_state() {
		return staff_state;
	}
	public void setStaff_state(String staff_state) {
		this.staff_state = staff_state;
	}
	
}
