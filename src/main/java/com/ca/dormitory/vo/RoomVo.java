package com.ca.dormitory.vo;

public class RoomVo {
	private String room_code;
	private String floor_code;
	private String room_name;
	private String grade_div;
	private int room_bed_count;
	private String room_div;
	private String room_use_yn;
	
	public RoomVo() {
		super();
	}

	public RoomVo(String room_code, String floor_code, String room_name, String grade_div, int room_bed_count,
			String room_div, String room_use_yn) {
		super();
		this.room_code = room_code;
		this.floor_code = floor_code;
		this.room_name = room_name;
		this.grade_div = grade_div;
		this.room_bed_count = room_bed_count;
		this.room_div = room_div;
		this.room_use_yn = room_use_yn;
	}

	public String getRoom_code() {
		return room_code;
	}

	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}

	public String getFloor_code() {
		return floor_code;
	}

	public void setFloor_code(String floor_code) {
		this.floor_code = floor_code;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getGrade_div() {
		return grade_div;
	}

	public void setGrade_div(String grade_div) {
		this.grade_div = grade_div;
	}

	public int getRoom_bed_count() {
		return room_bed_count;
	}

	public void setRoom_bed_count(int room_bed_count) {
		this.room_bed_count = room_bed_count;
	}

	public String getRoom_div() {
		return room_div;
	}

	public void setRoom_div(String room_div) {
		this.room_div = room_div;
	}

	public String getRoom_use_yn() {
		return room_use_yn;
	}

	public void setRoom_use_yn(String room_use_yn) {
		this.room_use_yn = room_use_yn;
	}
}
