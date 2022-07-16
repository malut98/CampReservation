package com.camp.campreservation.Dto;

public class LoginDto {
	private String memberid;
	private String memberpw;
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginDto(String memberid, String memberpw) {
		super();
		this.memberid = memberid;
		this.memberpw = memberpw;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMemberpw() {
		return memberpw;
	}
	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}
	@Override
	public String toString() {
		return "LoginDto [memberid=" + memberid + ", memberpw=" + memberpw + "]";
	}
	
	
}
