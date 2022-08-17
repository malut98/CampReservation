package com.camp.campreservation.Dto;

import java.util.Date;

public class ReviewDto {
	private int re_num;
	private int camp_id;
	private Date re_date;
	private String re_content;
	private String member_id;
	
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDto(int re_num, int camp_id, Date re_date, String re_content, String member_id) {
		super();
		this.re_num = re_num;
		this.camp_id = camp_id;
		this.re_date = re_date;
		this.re_content = re_content;
		this.member_id = member_id;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRenum(int re_num) {
		this.re_num = re_num;
	}
	public int getCamp_id() {
		return camp_id;
	}
	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ReviewDto [re_num=" + re_num + ", camp_id=" + camp_id + ", re_date=" + re_date + ", re_content=" + re_content
				+ ", member_id=" + member_id + "]";
	}
	
	
}
