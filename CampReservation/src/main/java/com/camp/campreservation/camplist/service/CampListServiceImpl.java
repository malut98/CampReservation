package com.camp.campreservation.camplist.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.mapper.CampListMapper;
import com.camp.campreservation.paging.Criteria;
import com.camp.campreservation.paging.PaginationInfo;

@Service
public class CampListServiceImpl implements CampListService {
	
	@Autowired
	private CampListMapper campListMapper;

	@Override
	public List<CampDBDto> getCampList(CampDBDto params){
		List<CampDBDto> campList = Collections.emptyList();
		
		int campTotalCount = campListMapper.selectCampCount(params);
		PaginationInfo paginationInfo = new PaginationInfo(params);
		paginationInfo.setTotalRecordCount(campTotalCount);
		params.setPaginationInfo(paginationInfo);
		if(campTotalCount>0) {
			campList = campListMapper.selectCampList(params);
		}
		
		return campList;
	}
	
	@Override
	public List<CampDBDto> glamList() {
		return campListMapper.glamList();
	}

	@Override
	public List<CampDBDto> caravanList() {
		return campListMapper.caravanList();
	}

	@Override
	public int selectCampCount(CampDBDto param) {
		return campListMapper.selectCampCount(param);
	}

}
