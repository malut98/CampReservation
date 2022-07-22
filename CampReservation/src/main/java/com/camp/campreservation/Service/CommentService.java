package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.camp.campreservation.Dto.CommentDto;
import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Mapper.CommentMapper;
import com.camp.campreservation.paging.Pagination;

@Service
public class CommentService {

	@Autowired
	private CommentMapper cm;
	
	public int commentwrite(CommentDto comment) {
		
		return cm.commentwrite(comment);
	}
	
	public void commentList(Model model,CommunityDto dto,String pagenum, String contentnum ) {
		Pagination pagemaker = new Pagination();
		
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		List<CommentDto> cList = null;
		pagemaker.setTotalcount(cm.selectcommentCount(dto)); // mapper 전체 게시글 개수를 지정한다
        pagemaker.setPagenum(cpagenum-1);   // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
        pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
        pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
        pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

        pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다.
        pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
        pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock());
        //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
        
        	cList = cm.commentList(dto,pagemaker.getPagenum()*5,pagemaker.getContentnum());
       
        	model.addAttribute("cot",cList);
        	model.addAttribute("page",pagemaker);
	}
	
	public int commentdelete(CommunityDto dto) {
		
		return cm.commentdelete(dto);
	}
	public int onlycommentdelete(CommentDto dto) {
		return cm.onlycommentdelete(dto);
	}

	}

