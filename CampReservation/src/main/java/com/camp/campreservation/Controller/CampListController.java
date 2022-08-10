package com.camp.campreservation.Controller;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camp.campreservation.Dto.ReservationDto;
import com.camp.campreservation.Dto.ReviewDto;
import com.camp.campreservation.Service.ReviewService;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campimg.dto.CampImgDto;
import com.camp.campreservation.camplist.service.CampListService;
import com.camp.campreservation.like.service.HeartService;
import com.kennycason.kumo.CollisionMode;
import com.kennycason.kumo.WordCloud;
import com.kennycason.kumo.WordFrequency;
import com.kennycason.kumo.bg.CircleBackground;
import com.kennycason.kumo.bg.RectangleBackground;
import com.kennycason.kumo.font.KumoFont;
import com.kennycason.kumo.font.scale.LinearFontScalar;
import com.kennycason.kumo.font.scale.SqrtFontScalar;
import com.kennycason.kumo.nlp.FrequencyAnalyzer;
import com.kennycason.kumo.palette.ColorPalette;

@Controller
@RequestMapping("/clist")
public class CampListController {

	@Autowired
	private CampListService campListService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private HeartService heartService;

	@GetMapping("/ca")
	public String campAll(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getAllList(model, pagenum, contentnum);
		model.addAttribute("camp", campDto);
		model.addAttribute("tag", "전체");
		return "CampMoa/camplist";
	}

	@GetMapping("/best")
	public String campBest(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getBestList(model, pagenum, contentnum);
		model.addAttribute("camp", campDto);
		model.addAttribute("tag", "베스트");
		return "CampMoa/camplist";
	}

	@GetMapping("/cpl")
	public String campList(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getCampList(model, pagenum, contentnum);
		model.addAttribute("camp", campDto);
		model.addAttribute("tag", "캠핑장");
		return "CampMoa/camplist";
	}

	@GetMapping("/gl")
	public String glamList(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getGlamList(model, pagenum, contentnum);
		model.addAttribute("camp", campDto);
		model.addAttribute("tag", "글램핑");
		return "CampMoa/camplist";
	}

	@GetMapping("/cvl")
	public String caravanList(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getCaravanList(model, pagenum, contentnum);
		model.addAttribute("camp", campDto);
		model.addAttribute("tag", "카라반");
		return "CampMoa/camplist";
	}

	@GetMapping("/pet")
	public String campPet(Model model, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum) {
		List<CampDBDto> campDto = campListService.getPetList(model, pagenum, contentnum);
		model.addAttribute("camp", campDto);
		model.addAttribute("tag", "반려동물");
		return "CampMoa/camplist";
	}

	@GetMapping("/cdetail")
	public String campDetail(Model model, int camp_id, String camp_se, String memberid) {
		CampDBDto campDto = campListService.campDetail(camp_id);
		model.addAttribute("camp", campDto);
		List<CampDBDto> campReco = campListService.campRecommen(camp_id, camp_se);
		model.addAttribute("CR", campReco);
		List<CampImgDto> campImg = campListService.campImg(camp_id);
		model.addAttribute("ci", campImg);

		int count = heartService.count(camp_id);
		model.addAttribute("count", count);
		int check = heartService.check(memberid, camp_id);
		model.addAttribute("check", check);

		return "CampMoa/campdetail";
	}

	@PostMapping("/pagin")
	public String getList(Model model, @RequestParam("pagenum") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam("name") String name) {
		if (name.equals("전체")) {
			List<CampDBDto> campDto = campListService.getAllList(model, pagenum, contentnum);
			model.addAttribute("camp", campDto);

		} else if (name.equals("베스트")) {
			List<CampDBDto> campDto = campListService.getBestList(model, pagenum, contentnum);
			model.addAttribute("camp", campDto);

		} else if (name.equals("캠핑장")) {
			List<CampDBDto> campDto = campListService.getCampList(model, pagenum, contentnum);
			model.addAttribute("camp", campDto);

		} else if (name.equals("글램핑")) {
			List<CampDBDto> campDto = campListService.getGlamList(model, pagenum, contentnum);
			model.addAttribute("camp", campDto);

		} else if (name.equals("카라반")) {
			List<CampDBDto> campDto = campListService.getCaravanList(model, pagenum, contentnum);
			model.addAttribute("camp", campDto);
		} else if (name.equals("반려동물")) {
			List<CampDBDto> campDto = campListService.getPetList(model, pagenum, contentnum);
			model.addAttribute("camp", campDto);
		}
		return "CampMoa/paging_con";
	}

	@PostMapping("/Campsearch")
	public String search(Model model, @RequestParam("key") String key, @RequestParam(defaultValue = "1") String pagenum,
			@RequestParam(defaultValue = "6") String contentnum, @RequestParam("name") String name) {
		if (name.equals("전체")) {
			List<CampDBDto> campDto = campListService.searchAll(model, key, pagenum, contentnum);
			model.addAttribute("camp", campDto);

		} else {
			List<CampDBDto> campDto = campListService.searchCamp(model, key, pagenum, contentnum, name);
			model.addAttribute("camp", campDto);
		}
		return "CampMoa/paging_con";
	}

	@GetMapping("/compare")
	public String Compare(Model model, Model model2, int camp_id, int camp_id2, String memberid) {

		CampDBDto campDto = campListService.campDetail(camp_id);
		model.addAttribute("camp", campDto);

		CampDBDto campDto2 = campListService.campDetail(camp_id2);
		model2.addAttribute("camp_2", campDto2);

		List<CampImgDto> campImg = campListService.campImg(camp_id);

		model.addAttribute("ci", campImg);

		List<CampImgDto> campImg2 = campListService.campImg(camp_id2);
		model2.addAttribute("ci_2", campImg2);
		
		int check1 = heartService.check(memberid, camp_id);
		model.addAttribute("check1", check1);
		int check2 = heartService.check(memberid, camp_id2);
		model2.addAttribute("check2", check2);

		try {
			System.out.println("워드 클라우드 실행");
			List<String> reviewlist = reviewService.getCampAllReview(camp_id);
			List<String> reviewlist2 = reviewService.getCampAllReview(camp_id2);

			// 파일 입출력
			String fileName = "wordtext_id=" + camp_id + ".txt";
			String fileName2 = "wordtext_id=" + camp_id2 + ".txt";
			File myFile = new File(fileName);
			File myFile2 = new File(fileName2);
			FileOutputStream fos = new FileOutputStream(myFile);
			FileOutputStream fos2 = new FileOutputStream(myFile2);
			OutputStreamWriter osw = new OutputStreamWriter(fos);
			OutputStreamWriter osw2 = new OutputStreamWriter(fos2);
			Writer writer = new BufferedWriter(osw);
			Writer writer2 = new BufferedWriter(osw2);

			if (reviewlist.size() > 0) {
				for (String s : reviewlist) {
					writer.write(s + "\n");
				}
				writer.close();
			} else {
				writer.write("등록된리뷰가없습니다.");
				writer.close();
			}
			if (reviewlist2.size() > 0) {
				for (String s : reviewlist2) {
					writer2.write(s + "\n");
				}
				writer2.close();
			} else {
				writer2.write("등록된리뷰가없습니다.");
				writer2.close();
			}

			final FrequencyAnalyzer frequencyAnalyzer = new FrequencyAnalyzer();
			java.awt.Font font = new java.awt.Font("Dialog", Font.BOLD, 35); // 워드클라우드 폰트지정
			final List<WordFrequency> wordFrequencies = frequencyAnalyzer.load("wordtext_id=" + camp_id + ".txt");
			final List<WordFrequency> wordFrequencies2 = frequencyAnalyzer.load("wordtext_id=" + camp_id2 + ".txt");
			final Dimension dimension = new Dimension(600, 600);
			final WordCloud wordCloud = new WordCloud(dimension, CollisionMode.PIXEL_PERFECT);
			final WordCloud wordCloud2 = new WordCloud(dimension, CollisionMode.PIXEL_PERFECT);

			wordCloud.setKumoFont(new KumoFont(font));
			wordCloud.setPadding(5);
			wordCloud.setBackground(new CircleBackground(300));
			wordCloud.setBackgroundColor(Color.WHITE);
			wordCloud.setColorPalette(new ColorPalette(new Color(0x4055F1), new Color(0x408DF1), new Color(0x40AAF1),
					new Color(0x40C5F1), new Color(0x40D3F1), new Color(0xFFFFFF)));
			wordCloud.setFontScalar(new SqrtFontScalar(10, 40));
			wordCloud.build(wordFrequencies);
			wordCloud.writeToFile("src/main/resources/static/Img/wordcloud/" + "wordcloud_id-" + camp_id + ".png");

			wordCloud2.setKumoFont(new KumoFont(font));
			wordCloud2.setPadding(5);
			wordCloud2.setBackground(new CircleBackground(300));
			wordCloud2.setBackgroundColor(Color.WHITE);
			wordCloud2.setColorPalette(new ColorPalette(new Color(0x4055F1), new Color(0x408DF1), new Color(0x40AAF1),
					new Color(0x40C5F1), new Color(0x40D3F1), new Color(0xFFFFFF)));
			wordCloud2.setFontScalar(new SqrtFontScalar(10, 40));
			wordCloud2.build(wordFrequencies2);
			wordCloud2.writeToFile("src/main/resources/static/Img/wordcloud/" + "wordcloud_id-" + camp_id2 + ".png");
			return "CampMoa/comparepage";
		}catch(Exception e)
		{
			return "CampMoa/comparepage";
		}
	}

	@GetMapping("/campreservation")
	public String Campreservation(HttpSession session, RedirectAttributes redirect, Model model, int camp_id) {
		if (session.getAttribute("memberid") == null) {
			redirect.addFlashAttribute("mesage", "로그인을 해주세요");

			return "redirect:/index";
		} else {
			CampDBDto campDto = campListService.campDetail(camp_id);
			model.addAttribute("camp", campDto);
			List<CampImgDto> campImg = campListService.campImg(camp_id);
			model.addAttribute("ci", campImg);
			ReservationDto reservdto = new ReservationDto();
			String memberid = (String) session.getAttribute("memberid");
			model.addAttribute("reservdto", reservdto);
			return "CampMoa/campreservation";
		}
	}
}
