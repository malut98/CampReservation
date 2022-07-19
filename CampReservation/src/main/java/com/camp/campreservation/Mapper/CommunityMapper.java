package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.paging.Criteria;




@Mapper
public interface CommunityMapper {
	
	@Select("select *  from community order by com_num desc " )
	public List<CommunityDto> communitylist();
	
	
	@Select("select * from community order by com_num desc limit #{paginationInfo.firstRecordIndex}, #{recordsPerPage}")
	public List<CommunityDto> selectBoardList(CommunityDto param);
	
	@Select("select count(*) from community")
	public int selectBoardCount(CommunityDto param);
	
	@Insert("insert into community values(null, #{com_title}, now(), #{com_content}, default, #{member_id})")
	public int communitywrite(CommunityDto dto);
}