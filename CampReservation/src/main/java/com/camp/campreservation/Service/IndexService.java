package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.ui.Model;

import com.camp.campreservation.campdb.dto.CampDBDto;

public interface IndexService {
	public List<CampDBDto> selectList();

	public List<CampDBDto> serchList(Model model, String keword, String pagenum, String contentnum);

	public int countArticle(String keyword);
}
