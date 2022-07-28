package com.camp.campreservation.Controller;

import java.io.IOException;

import org.json.XML;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp.campreservation.campdb.CampDB;
import com.camp.campreservation.campdb.CampImg;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campdb.service.CampDBService;
import com.camp.campreservation.campimg.dto.CampImgDto;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Controller
@RequestMapping("/DB")
public class CampDBController {
	
	@Autowired
	private CampDBService campDBService;
	
	@GetMapping("/CampDb")
	public String CampDBSave(Model model) throws IOException, ParseException{
		CampDB camp = new CampDB();
		String res = camp.CampDBSave();
		org.json.JSONObject change = XML.toJSONObject(res);
		String result = change.toString();
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject)parser.parse(result);
		JSONObject Response = (JSONObject) jsonObject.get("response");
		JSONObject Body = (JSONObject) Response.get("body");
		JSONObject items = (JSONObject) Body.get("items");
		JSONArray item = (JSONArray) items.get("item");
		for(int i=0; i<item.size(); i++) {
			JSONObject json=(JSONObject)item.get(i);
			CampDBDto dtos=new CampDBDto();
			dtos.setCamp_id(Integer.parseInt(String.valueOf(json.get("contentId"))));
			dtos.setCamp_name((String) json.get("facltNm"));
			dtos.setCamp_one((String) json.get("lineIntro"));
			dtos.setCamp_info((String) json.get("intro"));
			dtos.setCamp_open((String) json.get("manageSttus"));
			dtos.setCamp_char((String) json.get("featureNm"));
			dtos.setCamp_se((String) json.get("induty"));
			dtos.setCamp_loc((String) json.get("lctCl"));
			dtos.setCamp_addr((String) json.get("addr1"));
			dtos.setCamp_phone((String) json.get("tel"));
			dtos.setCamp_web((String) json.get("homepage"));
			dtos.setCamp_img((String) json.get("firstImageUrl"));
			dtos.setCamp_price(20000);
			dtos.setCamp_lat(Float.parseFloat(String.valueOf(json.get("mapX"))));
			dtos.setCamp_long(Float.parseFloat(String.valueOf(json.get("mapY"))));
			campDBService.insert(dtos);
		}

		model.addAttribute("res",jsonObject);
		return "SavePage";
	}
	
	@PostMapping("/save")
	public String saveRes(CampDBDto dto) {
		if(campDBService.insert(dto)>0) {
			return "redirect:/";
		}else {
			return "as";
		}
	}
	@GetMapping("/CampImg")
	public String CampImgSave(Model model) throws IOException, ParseException{
		CampImg campimg = new CampImg();
		for(int i=0; i<=8217; i++) { //i = 0부터 8217, 끝나고 100000~100459
			if(campDBService.selectOne(i)==null) {
				continue;
			}else{
				String id = String.valueOf(campDBService.selectOne(i).getCamp_id());
				String res = campimg.CampIS(id);
				org.json.JSONObject change = XML.toJSONObject(res);
				String result = change.toString();
				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject)parser.parse(result);
				JSONObject Response = (JSONObject)jsonObject.get("response");
				JSONObject Body = (JSONObject)Response.get("body");
				if(String.valueOf(Body.get("totalCount")).equals("0")) {
					continue;
				}else if(String.valueOf(Body.get("totalCount")).equals("1")){
					JSONObject Items = (JSONObject)Body.get("items");
					JSONObject item = (JSONObject)Items.get("item");
					CampImgDto dtos = new CampImgDto();
					dtos.setImg((String) (item.get("imageUrl")));
					dtos.setCamp_id(Integer.parseInt(String.valueOf(item.get("contentId"))));
					campDBService.imginsert(dtos);
				}else{		
					JSONObject Items = (JSONObject)Body.get("items");
					JSONArray item = (JSONArray)Items.get("item");
					for(int j=0; j<item.size(); j++) {
						JSONObject json=(JSONObject)item.get(j);
						CampImgDto dtos = new CampImgDto();
						dtos.setImg((String) (json.get("imageUrl")));
						dtos.setCamp_id(Integer.parseInt(String.valueOf(json.get("contentId"))));
						campDBService.imginsert(dtos);
					}
					model.addAttribute("res",jsonObject);
				}
			}
		}
		return "imgpage";
	}
}
