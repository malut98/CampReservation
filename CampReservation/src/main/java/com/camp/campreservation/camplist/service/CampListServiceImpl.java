package com.camp.campreservation.camplist.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.mapper.CampListMapper;
import com.camp.campreservation.paging.Pagination;

@Service
public class CampListServiceImpl implements CampListService {
	
	@Autowired
	private CampListMapper campListMapper;

	@Override
	public List<CampDBDto> getCampList(Model model,String pagenum, String contentnum){
		Pagination pagemaker = new Pagination();
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		pagemaker.setTotalcount(campListMapper.selectCampCount()); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.
        
        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        
        model.addAttribute("page",pagemaker);
		return campListMapper.getCampList(pagemaker.getPagenum()*6,pagemaker.getContentnum());
		
	}
	
	@Override
	public List<CampDBDto> glamList() {
		return campListMapper.glamList();
	}

	@Override
	public List<CampDBDto> caravanList() {
		return campListMapper.caravanList();
	}

	@Override
	public int selectCampCount() {
		return campListMapper.selectCampCount();
	}

	@Override
	public CampDBDto campDetail(int camp_id) {
		return campListMapper.campDetail(camp_id);
	}

}
