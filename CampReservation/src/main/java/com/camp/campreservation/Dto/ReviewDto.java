package com.camp.campreservation.Dto;

import java.util.Date;

public class ReviewDto {
	private int renum;
	private int campid;
	private Date redate;
	private String recontent;
	private String memberid;
	
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDto(int renum, int campid, Date redate, String recontent, String memberid) {
		super();
		this.renum = renum;
		this.campid = campid;
		this.redate = redate;
		this.recontent = recontent;
		this.memberid = memberid;
	}
	public int getRenum() {
		return renum;
	}
	public void setRenum(int renum) {
		this.renum = renum;
	}
	public int getCampid() {
		return campid;
	}
	public void setCampid(int campid) {
		this.campid = campid;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
}
