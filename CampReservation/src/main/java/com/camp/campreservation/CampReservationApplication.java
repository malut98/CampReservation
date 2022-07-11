package com.camp.campreservation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class CampReservationApplication {

	public static void main(String[] args) {
		SpringApplication.run(CampReservationApplication.class, args);
	}
	@RequestMapping("/")
	public String root() {
		return "index";
	}
}


