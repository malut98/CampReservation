package com.camp.campreservation.Controller;

import java.io.IOException;

import org.json.XML;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp.campreservation.campdb.CampDB;
import com.camp.campreservation.campdb.dto.CampDBDto;
import com.camp.campreservation.campdb.service.CampDBService;

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
		System.out.println(item.size());
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
}
