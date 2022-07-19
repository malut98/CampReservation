package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.campreservation.Dto.LoginDto;

@Mapper
public interface LoginMapper {
	
	@Select("SELECT * FROM MEMBER ORDER BY MEMBER_ID DESC")
	List<LoginDto> selectList();
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{memberid}")
	LoginDto selectOne(String memberid);
	
	@Insert("INSERT INTO MEMBER VALUE(#{memberid},#{memberpw},#{membername},#{memberphone},#{gender},#{pointer}")
	int insert(LoginDto dto);
	
	@Update("UPDATE MEMBER SET MEMBER_PHONE=#{memberphone}")
	int update(LoginDto dto);
	
	@Select("SELECT COUNT(MEMBER_ID) FROM MEMBER WHERE MEMBER_ID=#{ID}")
	int idCheck(String id);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{memberid} AND MEMBER_PW=#{memberpw}")
	LoginDto login(String memberid, String memberpw);
	
	@Update("UPDATE MEMBER SET MEMBER_NAME=#{membername},MEMBER_GENDER=#{gender}")
	int updateMP(LoginDto dto);
}
