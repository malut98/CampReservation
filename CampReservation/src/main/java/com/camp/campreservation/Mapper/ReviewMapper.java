package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.camp.campreservation.Dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	
	@Select("SELECT RE_CONTENT FROM REVIEW WHERE CAMP_ID = #{camp_id}")
	List<String> Reviewlist(int camp_id);
	
	@Insert(" INSERT INTO REVIEW VALUES(NULL, #{camp_id}, DEFAULT, #{re_content}, #{member_id}) ")
	int insert(ReviewDto dto);
}
