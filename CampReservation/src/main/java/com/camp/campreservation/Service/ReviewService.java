package com.camp.campreservation.Service;

import java.util.List;

import com.camp.campreservation.Dto.ReviewDto;


public interface ReviewService {
	public List<String> getCampAllReview(int camp_id);
	public int insert(ReviewDto dto);
}
