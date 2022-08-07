package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.ReviewDto;

@Service
public class ReviewserviceImpl implements ReviewService {

	@Autowired
	
	
	@Override
	public List<ReviewDto> selectList(int camp_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
