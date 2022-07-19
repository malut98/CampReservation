package com.camp.campreservation.Dto;

public class LoginDto {
	private String memberid;
	private String memberpw;
	private String membername;
	private String memberphone;
	private String gender;
	private String pointer;
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginDto(String memberid, String memberpw, String membername, String memberphone, String gender,
			String pointer) {
		super();
		this.memberid = memberid;
		this.memberpw = memberpw;
		this.membername = membername;
		this.memberphone = memberphone;
		this.gender = gender;
		this.pointer = pointer;
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
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getMemberphone() {
		return memberphone;
	}
	public void setMemberphone(String memberphone) {
		this.memberphone = memberphone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPointer() {
		return pointer;
	}
	public void setPointer(String pointer) {
		this.pointer = pointer;
	}
	@Override
	public String toString() {
		return "LoginDto [memberid=" + memberid + ", memberpw=" + memberpw + ", membername=" + membername
				+ ", memberphone=" + memberphone + ", gender=" + gender + ", pointer=" + pointer + "]";
	}
	
	
}