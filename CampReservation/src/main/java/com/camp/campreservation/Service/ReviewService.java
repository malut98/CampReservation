package com.camp.campreservation.Service;

import java.util.List;

import com.camp.campreservation.Dto.ReviewDto;


public interface ReviewService {
	public List<ReviewDto> selectList(int camp_id);
}
