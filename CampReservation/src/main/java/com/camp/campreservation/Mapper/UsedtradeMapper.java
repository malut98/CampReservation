package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Dto.UsedtradeDto;

@Mapper
public interface UsedtradeMapper {

	@Select("SELECT * FROM MARKET ORDER BY MAR_NUM DESC LIMIT #{pagenum}, #{contentnum}")
	public List<UsedtradeDto>usedtradelist(int pagenum, int contentnum);
	
	@Select("SELECT COUNT(*) FROM MARKET")
	public int CountUsedTradelist();

	@Insert("INSERT INTO MARKET VALUES(NULL, #{mar_title}, #{mar_name}, NOW(),#{mar_content},#{mar_price}, DEFAULT,#{mar_image},#{member_id})")
	public int usedtradewrite(UsedtradeDto dto);
	
	@Select("SELECT * FROM MARKET WHERE MAR_NUM = #{mar_num}")
	public UsedtradeDto usedtradeselectone(UsedtradeDto dto);
	
	@Select("SELECT COUNT(*) FROM MARKET WHERE ${searchOption} LIKE CONCAT('%',#{keyword},'%') ")
	public int countArticle(String searchOption, String keyword);
	
	@Select("SELECT * FROM MARKET WHERE ${searchOption} LIKE CONCAT('%',#{keyword},'%') LIMIT #{pagenum}, #{contentnum}")
	public List<UsedtradeDto> searchAll(String searchOption, String keyword, int pagenum, int contentnum);
	
	@Delete("DELETE FROM MARKET WHERE MAR_NUM=#{mar_num}")
	public int usedtradedelete(UsedtradeDto dto);
	
	@Update("UPDATE MARKET SET MAR_HIT=MAR_HIT+1 WHERE MAR_NUM = #{mar_num}")
	public void usedtradehit(UsedtradeDto dto);
	
	@Update("UPDATE MARKET SET MAR_TITLE=#{mar_title}, MAR_NAME = #{mar_name}, MAR_CONTENT = #{mar_content}, MAR_IMAGE= #{mar_image}, MAR_PRICE=#{mar_price}, MAR_DATE=NOW() WHERE MAR_NUM=#{mar_num}")
	public int usedtradeupdate(UsedtradeDto dto);
	
	@Select("SELECT MEMBER_ID AS MEMBERID, MEMBER_PHONE AS MEMBERPHONE FROM MEMBER WHERE MEMBER_ID  = #{memberid}")
	public LoginDto usedtradelogin(String memberid);
}
