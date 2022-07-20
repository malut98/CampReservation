package com.camp.campreservation.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Mapper.CommentMapper;

@Service
public class CommentService {

	@Autowired
	private CommentMapper cm;
	
	public int commentwrite(CommentDto comment) {
		
		return cm.commentwrite(comment);
	}
}
