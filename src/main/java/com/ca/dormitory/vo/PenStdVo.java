package com.ca.dormitory.vo;

public class PenStdVo {
 	private String pen_cd;
 	private String pen_nm;
 	private int pen_pt;
	private String dmt_resign;
	private String pet_crt;
	
	public PenStdVo() {
		super();
	}

	public PenStdVo(String pen_cd, String pen_nm, int pen_pt, String dmt_resign, String pet_crt) {
		super();
		this.pen_cd = pen_cd;
		this.pen_nm = pen_nm;
		this.pen_pt = pen_pt;
		this.dmt_resign = dmt_resign;
		this.pet_crt = pet_crt;
	}

	public String getPen_cd() {
		return pen_cd;
	}

	public void setPen_cd(String pen_cd) {
		this.pen_cd = pen_cd;
	}

	public String getPen_nm() {
		return pen_nm;
	}

	public void setPen_nm(String pen_nm) {
		this.pen_nm = pen_nm;
	}

	public int getPen_pt() {
		return pen_pt;
	}

	public void setPen_pt(int pen_pt) {
		this.pen_pt = pen_pt;
	}

	public String getDmt_resign() {
		return dmt_resign;
	}

	public void setDmt_resign(String dmt_resign) {
		this.dmt_resign = dmt_resign;
	}

	public String getPet_crt() {
		return pet_crt;
	}

	public void setPet_crt(String pet_crt) {
		this.pet_crt = pet_crt;
	}
}
