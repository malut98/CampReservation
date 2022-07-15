package com.camp.campreservation.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Mapper.CommunityMapper;
import com.camp.campreservation.paging.Criteria;
import com.camp.campreservation.paging.PaginationInfo;


@Service
public class CommunityService {

	
	
	@Autowired
	private CommunityMapper cm;
	
	public List<CommunityDto> communitylist(){
		return  cm.communitylist();
	}
	
	
	public List<CommunityDto> getBoardList(CommunityDto params){
		List<CommunityDto> boardList = Collections.emptyList();
		
		int boardTotalCount = cm.selectBoardCount(params);
		PaginationInfo paginationInfo = new PaginationInfo(params);
		paginationInfo.setTotalRecordCount(boardTotalCount);
		params.setPaginationInfo(paginationInfo);
		if(boardTotalCount>0) {
			boardList = cm.selectBoardList(params);
		}
		
		return boardList;
	}
	
	
	
	
	
}
