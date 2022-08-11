package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Mapper.IndexMapper;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.camplist.mapper.CampListMapper;
import com.camp.campreservation.paging.Pagination;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	private IndexMapper indexMapper;
	
	@Autowired
	private CampListMapper campListMapper;

	@Override
	public List<CampDBDto> selectList() {
		
		return indexMapper.campList();
	}

	
	  @Override
	  public List<CampDBDto> serchList(Model model,String keyword,String
	  pagenum,String contentnum) { int cpagenum = Integer.parseInt(pagenum); int
	  ccontentnum = Integer.parseInt(contentnum); Pagination pagemaker = new
	  Pagination(); List<CampDBDto> cList = null;
	  pagemaker.setTotalcount(indexMapper.countArticle(keyword)); // mapper 전체 게시글개수를 지정한다 
	  pagemaker.setPagenum(cpagenum-1); // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야쿼리에서 사용할수 있다 
	  pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지지정한다. 
	  pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서지정한다. 
	  pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글수를 통해서 정한다.
	  
	  pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
	  pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로정한다.
	  pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
	  
	  model.addAttribute("list", cList); model.addAttribute("page", pagemaker);
	  
	  return indexMapper.serchList(keyword, cpagenum, ccontentnum); }
	 
	@Override
	public int countArticle(String keyword) {
		return indexMapper.countArticle(keyword);
	}

	
}
