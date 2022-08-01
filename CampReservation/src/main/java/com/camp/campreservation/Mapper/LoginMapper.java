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
	
	@Insert("INSERT INTO MEMBER VALUES(#{memberid},#{memberpw},#{membername},#{memberphone},#{gender},#{adress},NULL,DEFAULT,DEFAULT)")
	int insert(LoginDto dto);
	
	@Update("UPDATE MEMBER SET MEMBER_PHONE=#{memberphone}")
	int update(LoginDto dto);
	
	@Select("SELECT COUNT(MEMBER_ID) FROM MEMBER WHERE MEMBER_ID=#{ID}")
	int idCheck(String id);
	
	/*
	 * @Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{memberid} AND MEMBER_PW=#{memberpw}"
	 * ) LoginDto login(LoginDto dto);
	 */
	
	@Update("UPDATE MEMBER SET MEMBER_NAME=#{membername},MEMBER_GENDER=#{gender}")
	int updateMP(LoginDto dto);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{memberid} AND MEMBER_PW=#{memberpw}")
	String logincheck(LoginDto dto);
	
	@Insert("INSERT INTO MEMBER VALUES(#{memberid},#{memberpw},#{membername},#{memberphone},#{gender},#{adress},NULL,DEFAULT,DEFAULT)")
	void signup(LoginDto dto);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{memberid}")
	LoginDto mypage(String id);
}
