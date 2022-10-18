package com.ca.dormitory.vo;

public class ActStdVo {
	private String act_cd;
	private int admin_no;
	private String act_nm;
	
	public ActStdVo() {
		super();
	}

	public ActStdVo(String act_cd, int admin_no, String act_nm) {
		super();
		this.act_cd = act_cd;
		this.admin_no = admin_no;
		this.act_nm = act_nm;
	}

	public String getAct_cd() {
		return act_cd;
	}

	public void setAct_cd(String act_cd) {
		this.act_cd = act_cd;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getAct_nm() {
		return act_nm;
	}

	public void setAct_nm(String act_nm) {
		this.act_nm = act_nm;
	}
}
