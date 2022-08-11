package com.camp.campreservation.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.camp.campreservation.Dto.ReservationDto;


@Mapper
public interface ReservationMapper {
	@Select("SELECT * FROM RESERVATION")
	public List<ReservationDto>ReservationList();
	
	@Select("SELECT COUNT(*) FROM RESERVATION "
			+ "WHERE RESER_LAST_DATE > #{first_date} "
			+ "AND RESER_FRIST_DATE = #{first_date} "
			+ "AND RESER_FRIST_DATE < #{last_date} "
			+ "AND MEMBER_ID = #{member_id}")
	public int Rservcnt(ReservationDto dto);
	
	@Insert("INSERT INTO RESERVATION VALUES(NULL, #{last_date},#{first_date},#{info_name},#{info_tel},#{info_need},#{number_p},#{member_id},#{camp_id})")
	public int ReservationInsert(ReservationDto dto);
}