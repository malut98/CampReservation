package com.camp.campreservation.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface HeartMapper {
	
	@Insert(" INSERT INTO HEART VALUES (#{memberid}, #{campid}) ")
	int unheart(String memberid, int campid);
	
	@Delete(" DELETE FROM HEART WHERE MEMBER_ID=#{memberid} AND CAMP_ID=#{campid} ")
	int heart(String memberid, int campid);
	
	@Select(" SELECT COUNT(*) FROM HEART WHERE CAMP_ID=#{campid} ")
	int count(int campid);
	
	@Select(" SELECT COUNT(*) FROM HEART WHERE CAMP_ID=#{campid} AND MEMBER_ID=#{memberid} ")
	int check(String memberid, int campid);
}
