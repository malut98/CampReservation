package com.camp.login.dto;

public class LoginDto {
	private String MemberId;
	private String MemberPw;
	private String Membername;
	private String Memberphone;
	private String MemberGender;
	private String MemberWtype;
	private int MemberPoint;
	private String admin;
	public LoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LoginDto(String memberId, String memberPw, String membername, String memberphone, String memberGender,
			String memberWtype, int memberPoint, String admin) {
		super();
		MemberId = memberId;
		MemberPw = memberPw;
		Membername = membername;
		Memberphone = memberphone;
		MemberGender = memberGender;
		MemberWtype = memberWtype;
		MemberPoint = memberPoint;
		this.admin = admin;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public String getMemberPw() {
		return MemberPw;
	}
	public void setMemberPw(String memberPw) {
		MemberPw = memberPw;
	}
	public String getMembername() {
		return Membername;
	}
	public void setMembername(String membername) {
		Membername = membername;
	}
	public String getMemberphone() {
		return Memberphone;
	}
	public void setMemberphone(String memberphone) {
		Memberphone = memberphone;
	}
	public String getMemberGender() {
		return MemberGender;
	}
	public void setMemberGender(String memberGender) {
		MemberGender = memberGender;
	}
	public String getMemberWtype() {
		return MemberWtype;
	}
	public void setMemberWtype(String memberWtype) {
		MemberWtype = memberWtype;
	}
	public int getMemberPoint() {
		return MemberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		MemberPoint = memberPoint;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "LoginDto [MemberId=" + MemberId + ", MemberPw=" + MemberPw + ", Membername=" + Membername
				+ ", Memberphone=" + Memberphone + ", MemberGender=" + MemberGender + ", MemberWtype=" + MemberWtype
				+ ", MemberPoint=" + MemberPoint + ", admin=" + admin + "]";
	}
	
	
}
