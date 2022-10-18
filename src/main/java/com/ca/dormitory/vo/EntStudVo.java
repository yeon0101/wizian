package com.ca.dormitory.vo;

public class EntStudVo {
	private int ent_stud_no;
	private String room_code;
	private int ent_no;
	private int appl_no;
	
	public EntStudVo() {
		super();
	}

	public EntStudVo(int ent_stud_no, String room_code, int ent_no, int appl_no) {
		super();
		this.ent_stud_no = ent_stud_no;
		this.room_code = room_code;
		this.ent_no = ent_no;
		this.appl_no = appl_no;
	}

	public int getEnt_stud_no() {
		return ent_stud_no;
	}

	public void setEnt_stud_no(int ent_stud_no) {
		this.ent_stud_no = ent_stud_no;
	}

	public String getRoom_code() {
		return room_code;
	}

	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}

	public int getEnt_no() {
		return ent_no;
	}

	public void setEnt_no(int ent_no) {
		this.ent_no = ent_no;
	}

	public int getAppl_no() {
		return appl_no;
	}

	public void setAppl_no(int appl_no) {
		this.appl_no = appl_no;
	}
}
