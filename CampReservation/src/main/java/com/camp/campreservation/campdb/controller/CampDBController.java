package com.camp.campreservation.campdb.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp.campreservation.campdb.CampDB;

@Controller
@RequestMapping("/DB")
public class CampDBController {
	
	@GetMapping("/CampDb")
	public String CampDBSave(Model model) throws IOException {
		CampDB camp = new CampDB();
		String res = camp.CampDBSave();
		model.addAttribute("res",res);
		System.out.println(res);
		return "SavePage";
	}
}
