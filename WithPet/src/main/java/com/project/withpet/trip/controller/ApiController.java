package com.project.withpet.trip.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ApiController {
public static final String SERVICEKEY = "AIzaSyCBaU0zaiVMD6_Y31125K8iQDxIoUEQxwU";

	@ResponseBody
	@RequestMapping(value="findXY", produces="application/json; charset=UTF-8")
	public String findXY(String location2) throws IOException {

		String url = "https://maps.googleapis.com/maps/api/geocode/json";
		url += "?address=" + URLEncoder.encode(location2, "UTF-8");
		url += "&key=" + SERVICEKEY;
	
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET"); // GET������� ��û�ϰڴ�
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		return responseText;
		
	}
}
