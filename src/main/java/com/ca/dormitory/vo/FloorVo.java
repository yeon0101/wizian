package com.ca.dormitory.vo;

//호관층
public class FloorVo {
	private String floor_code;
	private String bldg_code;
	private String floor_name;
	private String floor_div;
	private String floor_grade_div;
	
	public FloorVo() {
		super();
	}
	public FloorVo(String floor_code, String bldg_code, String floor_name, String floor_div, String floor_grade_div) {
		super();
		this.floor_code = floor_code;
		this.bldg_code = bldg_code;
		this.floor_name = floor_name;
		this.floor_div = floor_div;
		this.floor_grade_div = floor_grade_div;
	}
	public String getFloor_code() {
		return floor_code;
	}
	public void setFloor_code(String floor_code) {
		this.floor_code = floor_code;
	}
	public String getBldg_code() {
		return bldg_code;
	}
	public void setBldg_code(String bldg_code) {
		this.bldg_code = bldg_code;
	}
	public String getFloor_name() {
		return floor_name;
	}
	public void setFloor_name(String floor_name) {
		this.floor_name = floor_name;
	}
	public String getFloor_div() {
		return floor_div;
	}
	public void setFloor_div(String floor_div) {
		this.floor_div = floor_div;
	}
	public String getFloor_grade_div() {
		return floor_grade_div;
	}
	public void setFloor_grade_div(String floor_grade_div) {
		this.floor_grade_div = floor_grade_div;
	}
}
