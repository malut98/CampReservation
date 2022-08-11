package com.camp.campreservation.Service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Mapper.CommunityMapper;
import com.camp.campreservation.paging.Pagination;



@Service
public class CommunityService {

	
	
	@Autowired
	private CommunityMapper cm;
	
	public List<CommunityDto> communitylist(Model model,String pagenum, String contentnum){
		Pagination pagemaker = new Pagination();
		
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		List<CommunityDto> cList = null;
		pagemaker.setTotalcount(cm.selectBoardCount()); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        
        if(ccontentnum == 5){//선택 게시글 수
        	cList = cm.testlist(pagemaker.getPagenum()*5,pagemaker.getContentnum());
        }else if(ccontentnum == 10){
        	cList = cm.testlist(pagemaker.getPagenum()*10,pagemaker.getContentnum());
        }else if(ccontentnum ==20){
        	cList = cm.testlist(pagemaker.getPagenum()*20,pagemaker.getContentnum());
        }
        
        model.addAttribute("clist",cList);
        model.addAttribute("page",pagemaker);
		return  null;
	}
	
	public List<CommunityDto> boardlist(Model model, String pagenum, String contentnum, CommunityDto dto){
		Pagination pagemaker = new Pagination();
		
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		List<CommunityDto> cList = null;
		pagemaker.setTotalcount(cm.selectmenuCount(dto)); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        
        if(ccontentnum == 5){//선택 게시글 수
        	cList = cm.communitylist(dto,pagemaker.getPagenum()*5,pagemaker.getContentnum());
        }else if(ccontentnum == 10){
        	cList = cm.communitylist(dto,pagemaker.getPagenum()*10,pagemaker.getContentnum());
        }else if(ccontentnum ==20){
        	cList = cm.communitylist(dto,pagemaker.getPagenum()*20,pagemaker.getContentnum());
        }
        System.out.println(dto.getCom_cate());
       System.out.println(pagemaker.getTotalcount());
        model.addAttribute("clist",cList);
        model.addAttribute("page",pagemaker);
		return null;
	}
	
	
	public int communitywrite(CommunityDto dto) {
		
		return cm.communitywrite(dto);
		
	}
	
	public CommunityDto communitydetail(CommunityDto dto) {
		
		return cm.communitydetail(dto);
	}
	
	public List<CommentDto> commentList(CommunityDto dto){
		return cm.commentList(dto);
	}
	public void communityhit(CommunityDto dto) {
		cm.communityhit(dto);
	}
	
	public List<CommunityDto> listAll(Model model,String searchOption, String keyword,String pagenum, String contentnum){
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		Pagination pagemaker = new Pagination();
		List<CommunityDto> cList = null;
		pagemaker.setTotalcount(cm.countArticle(searchOption, keyword)); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        //String searchOption, String keyword, int pagenum, int contentnum)
        if(ccontentnum == 5){//선택 게시글 수
        	cList = cm.listAll(searchOption,keyword,pagemaker.getPagenum()*5,pagemaker.getContentnum());
        }else if(ccontentnum == 10){
        	cList = cm.listAll(searchOption,keyword,pagemaker.getPagenum()*10,pagemaker.getContentnum());
        }else if(ccontentnum ==20){
        	cList = cm.listAll(searchOption,keyword,pagemaker.getPagenum()*20,pagemaker.getContentnum());
        }
        
        model.addAttribute("clist",cList);
        model.addAttribute("page",pagemaker);
		return null;
	}
	
	public int countArticle(String searchOption, String keyword) {
		return cm.countArticle(searchOption, keyword);
	}
	
	public int communitydelete(CommunityDto dto) {
		return cm.communitydelete(dto);
	}
	public int communityupdate(CommunityDto dto) {
		return cm.communityupdate(dto);
	}
}
