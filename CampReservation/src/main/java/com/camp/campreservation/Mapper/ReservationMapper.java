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
	
	@Insert("INSERT INTO RESERVATION VALUES(NULL, #{info_name}, #{first_date}, #{last_date}, #{info_tel},#{info_need},#{number_p},#{member_id},#{camp_id},#{camp_name})")
	public int ReservationInsert(ReservationDto dto);
}
