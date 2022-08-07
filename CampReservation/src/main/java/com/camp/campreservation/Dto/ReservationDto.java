package com.camp.campreservation.Dto;

import java.util.Date;

public class ReservationDto {
	private String reserv_id; // 예약번호 ( 자동 생성 ) 
	private String info_name; // 예약자 명
	private String first_date; // 예약 시작일
	private String last_date; // 예약 종료일
	private String info_tel; // 예약자 전화번호
	private String info_need; //요청사항
	private int number_p; //예약 인원수
	private String member_id; // 로그인 한 유저의 아이디
	private int  camp_id; // 캠핑장 ID

	public ReservationDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationDto(String reserv_id, String info_name, String first_date, String last_date, String info_tel,
			String info_need, int number_p, String member_id, int camp_id) {
		super();
		this.reserv_id = reserv_id;
		this.info_name = info_name;
		this.first_date = first_date;
		this.last_date = last_date;
		this.info_tel = info_tel;
		this.info_need = info_need;
		this.number_p = number_p;
		this.member_id = member_id;
		this.camp_id = camp_id;
	}

	public String getReserv_id() {
		return reserv_id;
	}

	public void setReserv_id(String reserv_id) {
		this.reserv_id = reserv_id;
	}

	public String getInfo_name() {
		return info_name;
	}

	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}

	public String getFirst_date() {
		return first_date;
	}

	public void setFirst_date(String first_date) {
		this.first_date = first_date;
	}

	public String getLast_date() {
		return last_date;
	}

	public void setLast_date(String last_date) {
		this.last_date = last_date;
	}

	public String getInfo_tel() {
		return info_tel;
	}

	public void setInfo_tel(String info_tel) {
		this.info_tel = info_tel;
	}

	public String getInfo_need() {
		return info_need;
	}

	public void setInfo_need(String info_need) {
		this.info_need = info_need;
	}

	public int getNumber_p() {
		return number_p;
	}

	public void setNumber_p(int number_p) {
		this.number_p = number_p;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	@Override
	public String toString() {
		return "ReservationDto [reserv_id=" + reserv_id + ", info_name=" + info_name + ", first_date=" + first_date
				+ ", last_date=" + last_date + ", info_tel=" + info_tel + ", info_need=" + info_need + ", number_p="
				+ number_p + ", member_id=" + member_id + ", camp_id=" + camp_id + "]";
	}
	

	
	
}
