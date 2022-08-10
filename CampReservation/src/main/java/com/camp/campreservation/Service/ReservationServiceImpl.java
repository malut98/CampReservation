package com.camp.campreservation.Service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.ReservationDto;
import com.camp.campreservation.Mapper.ReservationMapper;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationMapper reservationmapper;
	
	@Override
	public List<ReservationDto> selectList() {
		// TODO Auto-generated method stub
		return reservationmapper.ReservationList();
	}

	@Override
	public int insert(ReservationDto dto) {
		// TODO Auto-generated method stub
		return reservationmapper.ReservationInsert(dto);
	}

	@Override
	public int reservcnt(ReservationDto dto) {
		// TODO Auto-generated method stub
		return reservationmapper.Rservcnt(dto);
	}
}
