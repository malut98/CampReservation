package com.camp.campreservation.campdb;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class CampImg {
	 public String CampIS(String id) throws IOException {
	        StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/imageList"); /*URL*/
	        //윤열 APIKEY = F7jvZ222xycQkv98HgTfpNk3ZQ6wTktKRgZnGVEmfdyCGOsHb0bEIWOK0fV1oHjnOIAJG4uIXePvlraq5AI%2BQg%3D%3D
	        //덕수 APIKEY = jXu7o64IItS1NTrAh4O13Beg5kVm0ceeDTTt8EqMz1US955CVhLKuHa6LvpSGP1GZAzAJaqxqGKYY4KzVarXBQ%3D%3D
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=jXu7o64IItS1NTrAh4O13Beg5kVm0ceeDTTt8EqMz1US955CVhLKuHa6LvpSGP1GZAzAJaqxqGKYY4KzVarXBQ%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS(아이폰), AND(안드로이드),WIN(윈도우폰), ETC*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
	        urlBuilder.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(id, "UTF-8")); /*콘텐츠 ID*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        return sb.toString();
	    }
}
