package com.camp.campreservation.campdb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.campdb.dto.CampDBDto;

@Mapper
public interface CampDBMapper {
	@Select(" SELECT * FROM CAMP ORDER BY USERID DESC ")
	List<CampDBDto> selectList();
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_ID=#{camp_id} ")
	CampDBDto selectOne(String camp_id);
	
	@Insert(" INSERT INTO CAMP VALUES(#{camp_id}, #{camp_name}, "
			+ "#{camp_one}, #{camp_info}, #{camp_open}, #{camp_char}, #{camp_se}, "
			+ "#{camp_loc}, #{camp_addr}, #{camp_phone}, #{camp_web}, #{camp_img}, "
			+ "#{camp_price}, #{camp_lat}, #{camp_long}) ")
	int insert(CampDBDto dto);
	
}
