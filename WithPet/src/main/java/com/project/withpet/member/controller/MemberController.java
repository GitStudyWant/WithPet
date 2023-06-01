package com.project.withpet.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.project.withpet.member.model.service.MemberService;
import com.project.withpet.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value="idCheck.me", produces="application/json; charset=UTF-8")
	public void idCheck(String checkId, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("idCheck 진입");
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(memberService.idCheck(checkId));
	}
	
	@RequestMapping(value="nickCheck.me", produces="application/json; charset=UTF-8")
	public void nickCheck(String checkNick, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("nickCheck 진입");
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(memberService.nickCheck(checkNick));
	}
	
	@RequestMapping("insert.me")
	public ModelAndView insertUser(Member member, ModelAndView mv) throws ServletException, IOException{
		
		System.out.println("insertUser 진입");
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemPwd());

		member.setMemPwd(encPwd);
		
		if(memberService.insertMember(member) > 0) {
			mv.setViewName("common/main");
		} else { 
			mv.addObject("errorMsg", "에러 발생").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("kakaoGetCodeUrl")
	public void kakaoGetCodeUrl(HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("kakaoGetCodeUrl 진입");
		
		String getCodeUrl = "https://kauth.kakao.com/oauth/authorize"
				        + "?client_id=" + "261f64346cb2da405692b542c232a7d3&"
				        + "&redirect_uri=" + "http://localhost:8787/withpet/kakaoLoginJump"
				        + "&response_type=code";
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(getCodeUrl);
	}
	
	@RequestMapping("/kakaoLoginJump")
	public String kakaoLoginJump() throws ServletException, IOException {
		return "member/kakaoLogin";
	}
	
	@RequestMapping("kakaoGetTokenUser")
	public void kakaoGetTokenUser(String code, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		System.out.println("kakaoGetTokenUser 진입");
		
		String accessToken = getAccessToken(code);
		HashMap<String, Object> userInfo = getUserInfo(accessToken);
		
		HttpSession session = request.getSession();
		session.setAttribute("accessToken", userInfo.get("accessToken"));
		session.setAttribute("id", userInfo.get("id"));
		
		System.out.println(userInfo.get("id"));
        
        response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("http://localhost:8787/withpet");
		
	}
	
	public String getAccessToken(String code) throws ServletException, IOException, ParseException {
		
		System.out.println("getAccessToken 진입");
		
		String GetTokenUrl = "https://kauth.kakao.com/oauth/token?grant_type=authorization_code"
				   + "&client_id=" + "261f64346cb2da405692b542c232a7d3&"
		           + "&redirect_uri=" + "http://localhost:8787/withpet/kakaoLoginJump"
		           + "&code=" + code;
		
		URL requestUrl = new URL(GetTokenUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String access_Token = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		if(!responseText.equals("")) {
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject)parser.parse(responseText);
			
			access_Token = (String)jsonObject.get("access_token");
		}
		
		br.close();
		urlConnection.disconnect();
		
		return access_Token;
	}
	
	public HashMap<String, Object> getUserInfo(String accessToken) throws ServletException, IOException, ParseException {
	
		System.out.println("getUserInfo 진입");
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String getUserURL = "https://kapi.kakao.com/v2/user/me";
		
		URL requestUrl = new URL(getUserURL);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		if(!responseText.equals("")) {
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(responseText);
			String id = element.getAsJsonObject().get("id").getAsString();
            
            userInfo.put("accessToken", accessToken);
            userInfo.put("id", id);
         
		}
		
		return userInfo;
	}
	
	@RequestMapping("kakaoLogout")
	public void kakaoLogout(String accessToken, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		System.out.println("kakaoLogout 진입");
		
		String logoutUrl = "https://kapi.kakao.com/v1/user/logout";
		
		URL requestUrl = new URL(logoutUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);		
		
		HttpSession session = request.getSession();
		session.removeAttribute("accessToken");
		session.removeAttribute("id");
        
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("http://localhost:8787/withpet");
		
	}
		
}
