package com.camp.campreservation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.camp.campreservation.Dto.CommunityDto;
import com.camp.campreservation.Dto.LoginDto;
import com.camp.campreservation.Dto.UsedtradeDto;
import com.camp.campreservation.Mapper.UsedtradeMapper;
import com.camp.campreservation.paging.Pagination;

@Service
public class UsedtradeService {

	@Autowired
	private UsedtradeMapper um;

	public List<UsedtradeDto> usedtradelist(Model model, String pagenum, String contentnum) {
		Pagination pagemaker = new Pagination();

		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		List<UsedtradeDto> uList = null;
		pagemaker.setTotalcount(um.CountUsedTradelist()); // mapper 전체 게시글 개수를 지정한다
		pagemaker.setPagenum(cpagenum - 1); // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
		pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
		pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
		pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

		pagemaker.prevnext(cpagenum);// 현재 페이지 번호로 화살표를 나타낼지 정한다.
		pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
		// 마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.

		uList = um.usedtradelist(pagemaker.getPagenum() * 10, pagemaker.getContentnum());
		model.addAttribute("uList", uList);
		model.addAttribute("page", pagemaker);
		return null;
	}

	public List<UsedtradeDto> usedtradeboardlist(UsedtradeDto dto, Model model, String pagenum, String contentnum) {
		Pagination pagemaker = new Pagination();
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		List<UsedtradeDto> uList = null;
		pagemaker.setTotalcount(um.CountUsedTradeboard(dto)); // mapper 전체 게시글 개수를 지정한다
		pagemaker.setPagenum(cpagenum - 1); // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
		pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
		pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
		pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

		pagemaker.prevnext(cpagenum);// 현재 페이지 번호로 화살표를 나타낼지 정한다.
		pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
		// 마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.

		uList = um.usedTradeboardlist(dto,pagemaker.getPagenum() * 10, pagemaker.getContentnum());
		model.addAttribute("uList", uList);
		model.addAttribute("page", pagemaker);
		return null;
	}

	public int usedtradewrite(UsedtradeDto dto) {

		return um.usedtradewrite(dto);
	}

	public UsedtradeDto usedtradeselectone(UsedtradeDto dto) {

		return um.usedtradeselectone(dto);
	}

	public List<UsedtradeDto> searchAll(Model model, String searchOption, String keyword, String pagenum,
			String contentnum) {
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		Pagination pagemaker = new Pagination();
		List<UsedtradeDto> uList = null;
		pagemaker.setTotalcount(um.countArticle(searchOption, keyword)); // mapper 전체 게시글 개수를 지정한다
		pagemaker.setPagenum(cpagenum - 1); // 현재 페이지를 페이지 객체에 지정한다 -1 을 해야 쿼리에서 사용할수 있다
		pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 지정한다.
		pagemaker.setCurrentblock(cpagenum); // 현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다.
		pagemaker.setLastblock(pagemaker.getTotalcount()); // 마지막 블록 번호를 전체 게시글 수를 통해서 정한다.

		pagemaker.prevnext(cpagenum);// 현재 페이지 번호로 화살표를 나타낼지 정한다.
		pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록번호로 정한다.
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
		// 마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
		// String searchOption, String keyword, int pagenum, int contentnum)

		uList = um.searchAll(searchOption, keyword, pagemaker.getPagenum() * 10, pagemaker.getContentnum());

		model.addAttribute("ulist", uList);
		model.addAttribute("page", pagemaker);
		return null;
	}

	public int usedtradedelete(UsedtradeDto dto) {

		return um.usedtradedelete(dto);
	}

	public void usedtradehit(UsedtradeDto dto) {
		um.usedtradehit(dto);
	}

	public int usedtradeupdate(UsedtradeDto dto) {

		return um.usedtradeupdate(dto);
	}

	public LoginDto usedtradelogin(String memberid) {
		System.out.println(memberid);
		System.out.println(um.usedtradelogin(memberid));
		return um.usedtradelogin(memberid);
	}
}
