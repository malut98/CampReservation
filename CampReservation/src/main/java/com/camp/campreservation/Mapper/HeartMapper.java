package com.camp.campreservation.Mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	@Update(" UPDATE CAMP SET CAMP_HEART_COUNT=#{count} WHERE CAMP_ID=#{campid} ")
	int campDtoCount(int count, int campid);
}
