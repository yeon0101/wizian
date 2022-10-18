package com.ca.dormitory.vo;



import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ApplVo {

	private int appl_no;
	private int recr_no;
	private String stud_id;
	private String room_code;
	private String appl_choice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date appl_date;
	private String appl_yn;
	private String slct_yn;
	private String stud_zipcode;
	private String stud_addr1;
	private String stud_addr2;
	private String grdn_name;
	private String grdn_phone;
	private String grdn_relation;
	private String grdn_zipcode;
	private String grdn_addr1;
	private String grdn_addr2;
	public ApplVo() {
		super();
	}
	public ApplVo(int appl_no, int recr_no, String stud_id, String room_code, String appl_choice, Date appl_date,
			String appl_yn, String slct_yn, String stud_zipcode, String stud_addr1, String stud_addr2, String grdn_name,
			String grdn_phone, String grdn_relation, String grdn_zipcode, String grdn_addr1, String grdn_addr2) {
		super();
		this.appl_no = appl_no;
		this.recr_no = recr_no;
		this.stud_id = stud_id;
		this.room_code = room_code;
		this.appl_choice = appl_choice;
		this.appl_date = appl_date;
		this.appl_yn = appl_yn;
		this.slct_yn = slct_yn;
		this.stud_zipcode = stud_zipcode;
		this.stud_addr1 = stud_addr1;
		this.stud_addr2 = stud_addr2;
		this.grdn_name = grdn_name;
		this.grdn_phone = grdn_phone;
		this.grdn_relation = grdn_relation;
		this.grdn_zipcode = grdn_zipcode;
		this.grdn_addr1 = grdn_addr1;
		this.grdn_addr2 = grdn_addr2;
	}
	public int getAppl_no() {
		return appl_no;
	}
	public void setAppl_no(int appl_no) {
		this.appl_no = appl_no;
	}
	public int getRecr_no() {
		return recr_no;
	}
	public void setRecr_no(int recr_no) {
		this.recr_no = recr_no;
	}
	public String getStud_id() {
		return stud_id;
	}
	public void setStud_id(String stud_id) {
		this.stud_id = stud_id;
	}
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public String getAppl_choice() {
		return appl_choice;
	}
	public void setAppl_choice(String appl_choice) {
		this.appl_choice = appl_choice;
	}
	public Date getAppl_date() {
		return appl_date;
	}
	public void setAppl_date(Date appl_date) {
		this.appl_date = appl_date;
	}
	public String getAppl_yn() {
		return appl_yn;
	}
	public void setAppl_yn(String appl_yn) {
		this.appl_yn = appl_yn;
	}
	public String getSlct_yn() {
		return slct_yn;
	}
	public void setSlct_yn(String slct_yn) {
		this.slct_yn = slct_yn;
	}
	public String getStud_zipcode() {
		return stud_zipcode;
	}
	public void setStud_zipcode(String stud_zipcode) {
		this.stud_zipcode = stud_zipcode;
	}
	public String getStud_addr1() {
		return stud_addr1;
	}
	public void setStud_addr1(String stud_addr1) {
		this.stud_addr1 = stud_addr1;
	}
	public String getStud_addr2() {
		return stud_addr2;
	}
	public void setStud_addr2(String stud_addr2) {
		this.stud_addr2 = stud_addr2;
	}
	public String getGrdn_name() {
		return grdn_name;
	}
	public void setGrdn_name(String grdn_name) {
		this.grdn_name = grdn_name;
	}
	public String getGrdn_phone() {
		return grdn_phone;
	}
	public void setGrdn_phone(String grdn_phone) {
		this.grdn_phone = grdn_phone;
	}
	public String getGrdn_relation() {
		return grdn_relation;
	}
	public void setGrdn_relation(String grdn_relation) {
		this.grdn_relation = grdn_relation;
	}
	public String getGrdn_zipcode() {
		return grdn_zipcode;
	}
	public void setGrdn_zipcode(String grdn_zipcode) {
		this.grdn_zipcode = grdn_zipcode;
	}
	public String getGrdn_addr1() {
		return grdn_addr1;
	}
	public void setGrdn_addr1(String grdn_addr1) {
		this.grdn_addr1 = grdn_addr1;
	}
	public String getGrdn_addr2() {
		return grdn_addr2;
	}
	public void setGrdn_addr2(String grdn_addr2) {
		this.grdn_addr2 = grdn_addr2;
	}
	
}
