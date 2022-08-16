package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.campdb.dto.CampDBDto;

@Mapper
public interface LoginMapper {
	
	
	@Insert("INSERT INTO MEMBER VALUES(#{memberid},#{memberpw},#{membername},#{memberphone},#{gender},#{adress},NULL,DEFAULT,DEFAULT)")
	int insert(LoginDto dto);
	
	@Select("SELECT COUNT(MEMBER_ID) FROM MEMBER WHERE MEMBER_ID=#{ID}")
	int idCheck(String id);
	
	@Select("SELECT * FROM MEMBER WHERE MEMBER_ID=#{memberid} AND MEMBER_PW=#{memberpw}")
	String logincheck(String memberid,String memberpw);
	
	@Insert("INSERT INTO MEMBER VALUES(#{memberid},#{memberpw},#{membername},#{memberphone},NULL,DEFAULT,DEFAULT)")
	void signup(LoginDto dto);
	
	
	@Select(" SELECT CAMP_ID FROM HEART WHERE MEMBER_ID = #{memberid}")
	List<CampDBDto> camplist(String memberid);
	
	@Select("SELECT CAMP_NAME,CAMP_ADDR FROM CAMP WHERE CAMP_ID = any(SELECT CAMP_ID FROM HEART WHERE MEMBER_ID=#{memberid}) ORDER BY CAMP_ID")
	CampDBDto camplike(String memberid);
	
	@Select(" SELECT COUNT(*) FROM HEART WHERE MEMBER_ID=#{memberid} ")
	int count(String memberid);
	
	@Select("SELECT CAMP_NAME FROM CAMP WHERE CAMP_ID = any(SELECT CAMP_ID FROM RESERVATION WHERE MEMBER_ID=#{memberid}) ORDER BY CAMP_ID")
	CampDBDto campres(String memberid);
	
	@Select("SELECT MEMBER_ID AS MEMBERID, MEMBER_NAME AS MEMBERNAME, MEMBER_PHONE AS MEMBERPHONE ,MEMBER_WTYPE AS WTYPE,MEMBER_POINT AS POINTER FROM MEMBER WHERE MEMBER_ID=#{memberid}")
	LoginDto mypage(String memberid);
}
