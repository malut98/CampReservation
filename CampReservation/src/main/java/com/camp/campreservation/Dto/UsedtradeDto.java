package com.camp.campreservation.Dto;

import java.util.Date;

public class UsedtradeDto {

	private int mar_num;
	private String mar_title;
	private String mar_name;
	private Date mar_date;
	private String mar_content;
	private int mar_price;
	private int mar_hit;
	private String mar_image;
	private String mar_cate;
	private String member_id;
	public UsedtradeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UsedtradeDto(int mar_num, String mar_title, String mar_name, Date mar_date, String mar_content,
			int mar_price, int mar_hit, String mar_image, String member_id, String mar_cate) {
		super();
		this.mar_num = mar_num;
		this.mar_title = mar_title;
		this.mar_name = mar_name;
		this.mar_date = mar_date;
		this.mar_content = mar_content;
		this.mar_price = mar_price;
		this.mar_hit = mar_hit;
		this.mar_image = mar_image;
		this.member_id = member_id;
		this.mar_cate = mar_cate;
	}
	public int getMar_num() {
		return mar_num;
	}
	public void setMar_num(int mar_num) {
		this.mar_num = mar_num;
	}
	public String getMar_title() {
		return mar_title;
	}
	public void setMar_title(String mar_title) {
		this.mar_title = mar_title;
	}
	public String getMar_name() {
		return mar_name;
	}
	public void setMar_name(String mar_name) {
		this.mar_name = mar_name;
	}
	public Date getMar_date() {
		return mar_date;
	}
	public void setMar_date(Date mar_date) {
		this.mar_date = mar_date;
	}
	public String getMar_content() {
		return mar_content;
	}
	public void setMar_content(String mar_content) {
		this.mar_content = mar_content;
	}
	public int getMar_price() {
		return mar_price;
	}
	public void setMar_price(int mar_price) {
		this.mar_price = mar_price;
	}
	public int getMar_hit() {
		return mar_hit;
	}
	public void setMar_hit(int mar_hit) {
		this.mar_hit = mar_hit;
	}
	public String getMar_image() {
		return mar_image;
	}
	public void setMar_image(String mar_image) {
		this.mar_image = mar_image;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMar_cate() {
		return mar_cate;
	}
	public void setMar_cate(String mar_cate) {
		this.mar_cate = mar_cate;
	}
	
	
}
