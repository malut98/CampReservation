package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Mapper.CommunityMapper;

@Service
public class CommunityService {

	@Autowired
	private CommunityMapper cm;
	
	public List<CommunityDto> communitylist(){
		return cm.communitylist();
	}
	
	
}
