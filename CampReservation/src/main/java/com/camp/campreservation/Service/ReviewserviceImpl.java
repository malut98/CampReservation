package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.ReviewDto;
import com.camp.campreservation.Mapper.ReviewMapper;

@Service
public class ReviewserviceImpl implements ReviewService {
	
	@Autowired
	ReviewMapper reviewMapper;

	@Override
	public List<String> getCampAllReview(int camp_id) {
		return reviewMapper.Reviewlist(camp_id);
	}

	@Override
	public int insert(ReviewDto dto) {
		return reviewMapper.insert(dto);
	}

	@Override
	public ReviewDto check(int camp_id, String member_id) {
		return reviewMapper.check(camp_id, member_id);
	}

	@Override
	public List<ReviewDto> getMemberReview(String member_id) {
		return reviewMapper.getMemberReview(member_id);
	}

	@Override
	public int update(int camp_id, String re_content, String member_id) {
		return reviewMapper.update(camp_id,re_content,member_id);
	}


}
