package com.camp.campreservation.campdb.dto;

public class CampDBDto {
	private int camp_id;
	private String camp_name;
	private String camp_one;	//캠핑장 한줄소개
	private String camp_info;	//캠핑장 소개
	private String camp_open;	//영업시간
	private String camp_char;	//특징
	private String camp_se;		//업종
	private String camp_loc;	//입지
	private String camp_addr;
	private String camp_phone;
	private String camp_web;
	private String camp_img;
	private int camp_price;
	private float camp_lat;		//경도
	private float camp_long;	//위도
	
	public CampDBDto() {
		super();
	}

	public CampDBDto(int camp_id, String camp_name, String camp_one, String camp_info, String camp_open,
			String camp_char, String camp_se, String camp_loc, String camp_addr, String camp_phone, String camp_web,
			String camp_img, int camp_price, float camp_lat, float camp_long) {
		super();
		this.camp_id = camp_id;
		this.camp_name = camp_name;
		this.camp_one = camp_one;
		this.camp_info = camp_info;
		this.camp_open = camp_open;
		this.camp_char = camp_char;
		this.camp_se = camp_se;
		this.camp_loc = camp_loc;
		this.camp_addr = camp_addr;
		this.camp_phone = camp_phone;
		this.camp_web = camp_web;
		this.camp_img = camp_img;
		this.camp_price = camp_price;
		this.camp_lat = camp_lat;
		this.camp_long = camp_long;
	}

	public int getCamp_id() {
		return camp_id;
	}

	public void setCamp_id(int camp_id) {
		this.camp_id = camp_id;
	}

	public String getCamp_name() {
		return camp_name;
	}

	public void setCamp_name(String camp_name) {
		this.camp_name = camp_name;
	}

	public String getCamp_one() {
		return camp_one;
	}

	public void setCamp_one(String camp_one) {
		this.camp_one = camp_one;
	}

	public String getCamp_info() {
		return camp_info;
	}

	public void setCamp_info(String camp_info) {
		this.camp_info = camp_info;
	}

	public String getCamp_open() {
		return camp_open;
	}

	public void setCamp_open(String camp_open) {
		this.camp_open = camp_open;
	}

	public String getCamp_char() {
		return camp_char;
	}

	public void setCamp_char(String camp_char) {
		this.camp_char = camp_char;
	}

	public String getCamp_se() {
		return camp_se;
	}

	public void setCamp_se(String camp_se) {
		this.camp_se = camp_se;
	}

	public String getCamp_loc() {
		return camp_loc;
	}

	public void setCamp_loc(String camp_loc) {
		this.camp_loc = camp_loc;
	}

	public String getCamp_addr() {
		return camp_addr;
	}

	public void setCamp_addr(String camp_addr) {
		this.camp_addr = camp_addr;
	}

	public String getCamp_phone() {
		return camp_phone;
	}

	public void setCamp_phone(String camp_phone) {
		this.camp_phone = camp_phone;
	}

	public String getCamp_web() {
		return camp_web;
	}

	public void setCamp_web(String camp_web) {
		this.camp_web = camp_web;
	}

	public String getCamp_img() {
		return camp_img;
	}

	public void setCamp_img(String camp_img) {
		this.camp_img = camp_img;
	}

	public int getCamp_price() {
		return camp_price;
	}

	public void setCamp_price(int camp_price) {
		this.camp_price = camp_price;
	}

	public float getCamp_lat() {
		return camp_lat;
	}

	public void setCamp_lat(float camp_lat) {
		this.camp_lat = camp_lat;
	}

	public float getCamp_long() {
		return camp_long;
	}

	public void setCamp_long(float camp_long) {
		this.camp_long = camp_long;
	}
	
	
	
}
