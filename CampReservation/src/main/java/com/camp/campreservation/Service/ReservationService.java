package com.camp.campreservation.Service;

import java.util.Date;
import java.util.List;

import com.camp.campreservation.Dto.ReservationDto;

public interface ReservationService {
	public List<ReservationDto> selectList();
	public int insert(ReservationDto dto);
	public int reservcnt(ReservationDto dto);
}
