package com.camp.campreservation.campdb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campimg.dto.CampImgDto;

@Mapper
public interface CampDBMapper {
	@Select(" SELECT * FROM CAMP ORDER BY USERID DESC ")
	List<CampDBDto> selectList();
	
	@Select(" SELECT * FROM CAMP WHERE CAMP_ID=#{camp_id} ")
	CampDBDto selectOne(int camp_id);
	
	@Insert(" INSERT INTO CAMP VALUES(#{camp_id}, #{camp_name}, "
			+ "#{camp_one}, #{camp_info}, #{camp_open}, #{camp_open_de}, #{camp_open_pd}, #{camp_char}, #{camp_se}, "
			+ "#{camp_loc}, #{camp_addr}, #{camp_phone}, #{camp_web}, CAMP_AROUND=#{camp_around}, #{camp_img}, "
			+ "#{camp_price}, #{camp_lat}, #{camp_long}) ")
	int insert(CampDBDto dto);
	
	@Insert(" INSERT INTO CAMP_IMAGE VALUES(NULL, #{img}, #{camp_id}) ")
	int imginsert(CampImgDto dto);

	@Update(" UPDATE CAMP SET CAMP_OPEN_DE=#{camp_open_de}, CAMP_OPEN_PD=#{camp_open_pd}, CAMP_AROUND=#{camp_around} WHERE CAMP_ID=#{camp_id} ")
	int campAdd(CampDBDto dto);
	
}
