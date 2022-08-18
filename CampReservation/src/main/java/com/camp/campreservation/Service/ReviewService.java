package com.camp.campreservation.Service;

import java.util.List;

import com.camp.campreservation.Dto.ReviewDto;


public interface ReviewService {
	public List<String> getCampAllReview(int camp_id);
	public int insert(ReviewDto dto);
	public int update(int camp_id, String re_content, String member_id);
	public ReviewDto check(int camp_id, String member_id);
	public List<ReviewDto> getMemberReview(String member_id);
}
