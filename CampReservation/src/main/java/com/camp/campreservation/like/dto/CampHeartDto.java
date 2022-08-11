package com.camp.campreservation.like.dto;

import com.camp.campreservation.campdb.dto.CampDBDto;

public class CampHeartDto extends CampDBDto{
	public CampHeartDto(){}
	
	public CampHeartDto(String memberid, int camp_id) {
		super(memberid, camp_id);

	}
	
}
