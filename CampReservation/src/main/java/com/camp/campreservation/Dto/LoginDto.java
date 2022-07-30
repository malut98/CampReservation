package com.camp.campreservation.Dto;

public class LoginDto {
	private String memberid;
	private String memberpw;
	private String membername;
	private String memberphone;
	private String gender;
	private String adress;
	private String Wtype;
	private int pointer;
	private String admin;
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginDto(String memberid, String memberpw, String membername, String memberphone, String gender,
			String adress, String wtype, int pointer, String admin) {
		super();
		this.memberid = memberid;
		this.memberpw = memberpw;
		this.membername = membername;
		this.memberphone = memberphone;
		this.gender = gender;
		this.adress = adress;
		Wtype = wtype;
		this.pointer = pointer;
		this.admin = admin;
	}
	
	public LoginDto(String memberid) {
		this.memberid=memberid;
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
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getWtype() {
		return Wtype;
	}
	public void setWtype(String wtype) {
		Wtype = wtype;
	}
	public int getPointer() {
		return pointer;
	}
	public void setPointer(int pointer) {
		this.pointer = pointer;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "LoginDto [memberid=" + memberid + ", memberpw=" + memberpw + ", membername=" + membername
				+ ", memberphone=" + memberphone + ", gender=" + gender + ", adress=" + adress + ", Wtype=" + Wtype
				+ ", pointer=" + pointer + ", admin=" + admin + "]";
	}
	
	
}