package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.camp.campreservation.Dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	@Select("SELECT * FROM REVIEW r WHERE CAMP_ID = {}")
	public List<ReviewDto> Reviewlist();
	
}
