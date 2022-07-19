package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.campreservation.Mapper.IndexMapper;
import com.camp.campreservation.campdb.dto.CampDBDto;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	private IndexMapper indexMapper;
	
	@Override
	public List<CampDBDto> selectList() {
		
		return indexMapper.campList();
	}

}
