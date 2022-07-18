package com.camp.campreservation.Service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Mapper.CommunityMapper;
import com.camp.campreservation.paging.PaginationInfo;


@Service
public class CommunityService {

	
	
	@Autowired
	private CommunityMapper cm;
	
	public List<CommunityDto> communitylist(){
		return  cm.communitylist();
	}
	
	// 보여줄 데이터 가져오기
	public List<CommunityDto> getBoardList(CommunityDto params){
		//데이터 담을 리스트
		List<CommunityDto> boardList = Collections.emptyList();
		
		//전체 데이터 수
		int boardTotalCount = cm.selectBoardCount(params);
		PaginationInfo paginationInfo = new PaginationInfo(params);
		//전체 데이터 수 저장
		paginationInfo.setTotalRecordCount(boardTotalCount);
		params.setPaginationInfo(paginationInfo);
		
		//전체 데이터 수 가 0보다 많을시 리스트에 데이터 저장
		if(boardTotalCount>0) {
			boardList = cm.selectBoardList(params);
		}
		
		return boardList;
	}
	
	public int communitywrite(CommunityDto dto) {
		
		return cm.communitywrite(dto);
		
	}
	
	public CommunityDto communitydetail(CommunityDto dto) {
		
		return cm.communitydetail(dto);
	}
	
	public List<CommentDto> commentList(CommunityDto dto){
		return cm.commentList(dto);
	}
	public void communityhit(CommunityDto dto) {
		cm.communityhit(dto);
	}
}
