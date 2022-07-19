package com.camp.campreservation.campimg.dto;

import com.camp.campreservation.campdb.dto.CampDBDto;

public class CampImgDto extends CampDBDto {
	private int image_id;
	private String img;
	
	public CampImgDto() {
		super();
	}

	public CampImgDto(int image_id, String img, int camp_id) {
		super(camp_id);
		this.image_id = image_id;
		this.img = img;
		
	}

	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
}
