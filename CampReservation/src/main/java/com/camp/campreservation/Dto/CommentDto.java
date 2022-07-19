package com.camp.campreservation.Dto;

import java.util.Date;

public class CommentDto {
private int cot_num;
private Date cot_date;
private String cot_content;
private int com_num;
private String member_id;
public CommentDto() {
	super();
}
public CommentDto(int cot_num, Date cot_date, String cot_content, int com_num, String member_id) {
	super();
	this.cot_num = cot_num;
	this.cot_date = cot_date;
	this.cot_content = cot_content;
	this.com_num = com_num;
	this.member_id = member_id;
}
public int getCot_num() {
	return cot_num;
}
public void setCot_num(int cot_num) {
	this.cot_num = cot_num;
}
public Date getCot_date() {
	return cot_date;
}
public void setCot_date(Date cot_date) {
	this.cot_date = cot_date;
}
public String getCot_content() {
	return cot_content;
}
public void setCot_content(String cot_content) {
	this.cot_content = cot_content;
}
public int getCom_num() {
	return com_num;
}
public void setCom_num(int com_num) {
	this.com_num = com_num;
}
public String getMember_id() {
	return member_id;
}
public void setMember_id(String member_id) {
	this.member_id = member_id;
}

}
