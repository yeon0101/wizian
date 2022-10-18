package com.ca.dormitory.vo;

public class AdminVo {

	private int admin_no;
	private int staff_id;	
	private String bldg_code;
	
	public AdminVo() {
		super();
	}

	public AdminVo(int admin_no, int staff_id, String bldg_cd) {
		super();
		this.admin_no = admin_no;
		this.staff_id = staff_id;
		this.bldg_code = bldg_cd;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public int getStaff_id() {
		return staff_id;
	}

	public void setStaff_id(int staff_id) {
		this.staff_id = staff_id;
	}

	public String getBldg_cd() {
		return bldg_code;
	}

	public void setBldg_cd(String bldg_cd) {
		this.bldg_code = bldg_cd;
	}

	
	
	
}
