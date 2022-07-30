package com.camp.campreservation.like.service;

public interface HeartService {
	int heart(String memberid, int campid);
	int unheart(String memberid, int campid);
	int count(int campid);
	int check(String memberid, int campid);
}
