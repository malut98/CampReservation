package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.Dto.CommunityDto;

@Mapper
public interface CommunityMapper {
	
	@Select("select *  from community order by com_num desc" )
	public List<CommunityDto>communitylist();
}
