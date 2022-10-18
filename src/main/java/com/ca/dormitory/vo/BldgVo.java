package com.ca.dormitory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
//호관정보
public class BldgVo {
	private String bldg_code;
	private String bldg_name;
	private int bldg_floor_cnt;
	private String bldg_gender_div;
	private String bldg_plottage;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bldg_const_date;
	
	public BldgVo() {
		super();
	}

	public BldgVo(String bldg_code, String bldg_name, int bldg_floor_cnt, String bldg_gender_div, String bldg_plottage,
			Date bldg_const_date) {
		super();
		this.bldg_code = bldg_code;
		this.bldg_name = bldg_name;
		this.bldg_floor_cnt = bldg_floor_cnt;
		this.bldg_gender_div = bldg_gender_div;
		this.bldg_plottage = bldg_plottage;
		this.bldg_const_date = bldg_const_date;
	}

	public String getBldg_code() {
		return bldg_code;
	}

	public void setBldg_code(String bldg_code) {
		this.bldg_code = bldg_code;
	}

	public String getBldg_name() {
		return bldg_name;
	}

	public void setBldg_name(String bldg_name) {
		this.bldg_name = bldg_name;
	}

	public int getBldg_floor_cnt() {
		return bldg_floor_cnt;
	}

	public void setBldg_floor_cnt(int bldg_floor_cnt) {
		this.bldg_floor_cnt = bldg_floor_cnt;
	}

	public String getBldg_gender_div() {
		return bldg_gender_div;
	}

	public void setBldg_gender_div(String bldg_gender_div) {
		this.bldg_gender_div = bldg_gender_div;
	}

	public String getBldg_plottage() {
		return bldg_plottage;
	}

	public void setBldg_plottage(String bldg_plottage) {
		this.bldg_plottage = bldg_plottage;
	}

	public Date getBldg_const_date() {
		return bldg_const_date;
	}

	public void setBldg_const_date(Date bldg_const_date) {
		this.bldg_const_date = bldg_const_date;
	}
}
