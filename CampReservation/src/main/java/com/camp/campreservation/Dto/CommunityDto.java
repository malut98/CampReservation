package com.camp.campreservation.Dto;

import java.util.Date;

public class CommunityDto  {

	private int com_num;
	private String com_cate;
	private String com_title;
	private Date com_date;
	private String com_content;
	private int com_hit;
	private String member_id;
	private String com_image;
	public CommunityDto() {
		super();
	}
	public CommunityDto(int com_num, String com_cate, String com_title, Date com_date, String com_content, int com_hit,
			String member_id, String com_image) {
		super();
		this.com_num = com_num;
		this.com_cate = com_cate;
		this.com_title = com_title;
		this.com_date = com_date;
		this.com_content = com_content;
		this.com_hit = com_hit;
		this.member_id = member_id;
		this.com_image = com_image;
	}
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getCom_cate() {
		return com_cate;
	}
	public void setCom_cate(String com_cate) {
		this.com_cate = com_cate;
	}
	public String getCom_title() {
		return com_title;
	}
	public void setCom_title(String com_title) {
		this.com_title = com_title;
	}
	public Date getCom_date() {
		return com_date;
	}
	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public int getCom_hit() {
		return com_hit;
	}
	public void setCom_hit(int com_hit) {
		this.com_hit = com_hit;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCom_image() {
		return com_image;
	}
	public void setCom_image(String com_image) {
		this.com_image = com_image;
	}
	

	
}
