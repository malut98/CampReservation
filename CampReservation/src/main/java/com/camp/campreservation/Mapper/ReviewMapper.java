package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.campreservation.Dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	
	@Select("SELECT RE_CONTENT FROM REVIEW WHERE CAMP_ID = #{camp_id}")
	List<String> Reviewlist(int camp_id);
	
	@Insert(" INSERT INTO REVIEW VALUES(NULL, #{camp_id}, DEFAULT, #{re_content}, #{member_id}) ")
	int insert(ReviewDto dto);
	
	@Update(" UPDATE REVIEW SET RE_CONTENT=#{re_content} WHERE CAMP_ID=#{camp_id} AND MEMBER_ID=#{member_id} ")
	int update(int camp_id, String re_content, String member_id);

	@Select(" SELECT * FROM REVIEW WHERE CAMP_ID=#{camp_id} AND MEMBER_ID=#{member_id} ")
	ReviewDto check(int camp_id, String member_id);

	@Select(" SELECT * FROM REVIEW WHERE MEMBER_ID=#{member_id} ")
	List<ReviewDto> getMemberReview(String member_id);
}
