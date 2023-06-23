package com.project.withpet.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.common.template.Pagination;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.member.model.service.MemberService;
import com.project.withpet.member.model.vo.AllChatting;
import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Friend;
import com.project.withpet.member.model.vo.Inquiry;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Memo;
import com.project.withpet.member.model.vo.OneChatting;
import com.project.withpet.member.model.vo.Passward;
import com.project.withpet.member.model.vo.Schedule;
import com.project.withpet.trip.model.vo.CarReservation;
import com.project.withpet.trip.model.vo.MyPlace;
import com.project.withpet.trip.model.vo.Place;
import com.project.withpet.trip.model.vo.TaxiReservation;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("sendBack.me")
	public void sendBack(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("http://localhost:8787/withpet");
	}
	
	@RequestMapping("updateloginMemberMemo")
	public void updateloginMemberMemo(int memMemoSend, HttpSession session, HttpServletResponse response) throws IOException {
		session.setAttribute("loginMemo", memMemoSend);

		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("");
	}
	
	@RequestMapping(value="idCheck.me", produces="application/json; charset=UTF-8")
	public void idCheck(String checkId, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(memberService.idCheck(checkId));
	}
	
	@RequestMapping(value="nickCheck.me", produces="application/json; charset=UTF-8")
	public void nickCheck(String checkNick, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(memberService.nickCheck(checkNick));
	}
	
	@RequestMapping(value="phoneCheck.me", produces="application/json; charset=UTF-8")
	public void phoneCheck(String checkPhone, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(memberService.phoneCheck(checkPhone));
	}
	
	@RequestMapping(value="emailCheck.me", produces="application/json; charset=UTF-8")
	public void emailCheck(String checkEmail, HttpServletResponse response) throws ServletException, IOException {
		
		String email = checkEmail.substring(0, checkEmail.lastIndexOf("@")) + checkEmail.substring(checkEmail.lastIndexOf("@")).toLowerCase();
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(memberService.emailCheck(email));
	}
	
	@RequestMapping("insert.me")
	public ModelAndView insertUser(Member member, ModelAndView mv, HttpServletRequest request) throws ServletException, IOException{
		
		String encPwd = bcryptPasswordEncoder.encode(member.getMemPwd());
		member.setMemPwd(encPwd);
		
		String email = member.getMemEmail().substring(0, member.getMemEmail().lastIndexOf("@")) + member.getMemEmail().substring(member.getMemEmail().lastIndexOf("@")).toLowerCase();
		member.setMemEmail(email);
		
		HttpSession session = request.getSession();
		session.removeAttribute("kakaoId");
		session.removeAttribute("naverId");
		
		if(memberService.insertMember(member) > 0) {
			mv.setViewName("common/main");
		} else { 
			mv.addObject("errorMsg", "에러 발생").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("login.me")
	public ModelAndView selectMember(Member member, ModelAndView mv, HttpSession session) throws ServletException, IOException{

		Member loginMember = memberService.selectMember(member);

		int loginMemo = memberService.selectReceiveMemoCountCheck(member.getMemId());

		if(loginMember != null && (member.getMemPwd().equals(loginMember.getMemPwd())) /* && bcryptPasswordEncoder.matches(member.getMemPwd(), loginMember.getMemPwd())*/) {
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("loginMemo", loginMemo);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "응 안돼~");
			mv.setViewName("common/main");
		}
		
		return mv;
		
	}
	
	@RequestMapping("logout.me")
	public ModelAndView deleteMember(String memId, ModelAndView mv, HttpSession session) throws ServletException, IOException{
				
		session.removeAttribute("loginMember");
		session.removeAttribute("loginMemo");
		
		mv.setViewName("redirect:/");
		
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
	
	@RequestMapping("naverGetCodeUrl")
	public void naverGetCodeUrl(HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("naverGetCodeUrl 진입");
		
		String getCodeUrl = "https://nid.naver.com/oauth2.0/authorize"
						+ "?response_type=code"
				        + "&client_id=" + "6aIbyMx1S1A_QDaS6w46"
				        + "&state=" + "STATE_STRING"
				        + "&redirect_uri=" + "http://localhost:8787/withpet/naverLoginJump";
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(getCodeUrl);
	}
	
	@RequestMapping("/kakaoLoginJump")
	public String kakaoLoginJump() {
		System.out.println("kakaoLoginJump 진입");
		return "member/kakaoLogin";
	}
	
	@RequestMapping("/naverLoginJump")
	public String naverLoginJump() {
		System.out.println("naverLoginJump 진입");
		return "member/naverLogin";
	}
	
	@RequestMapping("kakaoGetTokenUser")
	public void kakaoGetTokenUser(String code, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		System.out.println("kakaoGetTokenUser 진입");
		
		String accessToken = getKakaoAccessToken(code);
		HashMap<String, Object> userInfo = getKakaoUserInfo(accessToken);
		
		HttpSession session = request.getSession();
		session.setAttribute("kakaoId", userInfo.get("id"));
		
        response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("http://localhost:8787/withpet");

	}
	
	@RequestMapping("naverGetTokenUser")
	public void naverGetTokenUser(String code, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		System.out.println("naverGetTokenUser 진입");
		
		String accessToken = getNaverAccessToken(code);
		HashMap<String, Object> userInfo = getNaverUserInfo(accessToken);
		
		HttpSession session = request.getSession();
		session.setAttribute("accessToken", userInfo.get("accessToken"));
		session.setAttribute("naverId", userInfo.get("id"));
		
        response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("http://localhost:8787/withpet");
		
	}
	
	public String getKakaoAccessToken(String code) throws ServletException, IOException, ParseException {
		
		System.out.println("getKakaoAccessToken 진입");
		
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
	
	public String getNaverAccessToken(String code) throws ServletException, IOException, ParseException {
		
		System.out.println("getNaverAccessToken 진입");
		
		String GetTokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
				   + "&client_id=" + "6aIbyMx1S1A_QDaS6w46"
				   + "&client_secret=" + "FVWHvKicAJ"
		           + "&redirect_uri=" + "http://localhost:8787/withpet/naverLoginJump"
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
	
	public HashMap<String, Object> getKakaoUserInfo(String accessToken) throws ServletException, IOException, ParseException {
	
		System.out.println("getKakaoUserInfo 진입");
		
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
	
	public HashMap<String, Object> getNaverUserInfo(String accessToken) throws ServletException, IOException, ParseException {
		
		System.out.println("getNaverUserInfo 진입");

		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String getUserURL = "https://openapi.naver.com/v1/nid/me";

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
			String id = element.getAsJsonObject().get("response").getAsJsonObject().get("id").getAsString();
			
            userInfo.put("accessToken", accessToken);
            userInfo.put("id", id);
         
		}
		
		return userInfo;
	}
	
	@RequestMapping("kakaoLogin.me")
	public void kakaoLogin(String kakaoId, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		
		System.out.println("kakaoLogin 진입");
		
		Member TempMember = memberService.selectKakaoMember(kakaoId);
		
		if(TempMember != null) {
			session.setAttribute("loginMember", TempMember);
			session.setAttribute("loginMemo", memberService.selectReceiveMemoCountCheck(TempMember.getMemId()));
			session.removeAttribute("kakaoId");			
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("1");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("0");
		}
	}
	
	@RequestMapping("naverLogin.me")
	public void naverLogin(String naverId, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		
		System.out.println("naverLogin 진입");
		
		Member TempMember = memberService.selectNaverMember(naverId);
	
		if(TempMember != null) {
			session.setAttribute("loginMember", TempMember);
			session.setAttribute("loginMemo", memberService.selectReceiveMemoCountCheck(TempMember.getMemId()));
			session.removeAttribute("naverId");			
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("1");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("0");
		}
	}
	
	@RequestMapping("deleteSocialId")
	public String deleteSocialId(HttpServletRequest request) {
		
		System.out.println("deleteSocialId 진입");
		
		HttpSession session = request.getSession();
		session.removeAttribute("kakaoId");
		session.removeAttribute("naverId");
		
		return "common/main";
	}
	
	@RequestMapping("updateMember")
	public String updateMember(Member member, MultipartFile profileImgData, HttpSession session) {
		
		if(!profileImgData.getOriginalFilename().equals("")){
			if(member.getMemPhoto() != null) {
				new File(session.getServletContext().getRealPath(member.getMemPath())).delete();				
			}
			
			String changeName = saveFile(profileImgData, session);
			
			member.setMemPhoto(profileImgData.getOriginalFilename());
			member.setMemPath("resources/profile_upfiles/" + changeName);
		}
		
		String TempPwd = memberService.selectMember(member).getMemPwd();
		if(member.getMemPwd().equals("")) {
			member.setMemPwd(TempPwd);
		}
			
		int result = memberService.updateMember(member);
		session.setAttribute("loginMember", memberService.selectMember(member));
		
		return "member/modify/memberModify";
	}
	
	public String saveFile(MultipartFile profileImgData, HttpSession session) {
		
		String origin = profileImgData.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000) + 10000;
		String ext = origin.substring(origin.lastIndexOf("."));
		String changeName = currentTime + "_" + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/profile_upfiles/");
		try {
			profileImgData.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	@RequestMapping("memberDiaryMain")
	public ModelAndView memberDiaryMain(Schedule schedule, ModelAndView mv){
		
		mv.setViewName("member/diary/memberDiary");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="selectSchedules", produces="application/json; charset=UTF-8")
	public String selectSchedules(Schedule schedule, ModelAndView mv){

		ArrayList<Schedule> schedules = memberService.selectSchedules(schedule); 
		
		return new Gson().toJson(schedules);
	}
	
	@RequestMapping("insertSchedule")
	public String insertSchedule(Schedule schedule){
		
		int schedulecount = memberService.insertSchedule(schedule);

		return "redirect:/memberDiaryMain";
	}
	
	@RequestMapping("updateSchedule")
	public String updateSchedule(Schedule schedule){
		
		int schedulecount = memberService.updateSchedule(schedule);

		return "redirect:/memberDiaryMain";
	}
	
	@RequestMapping("deleteSchedule")
	public String deleteSchedule(int scheduleNo){
		
		int schedulecount = memberService.deleteSchedule(scheduleNo);

		return "redirect:/memberDiaryMain";
	}
	
	
	@RequestMapping("receiveMemo")
	public String receiveMemo(@RequestParam(value="cPage", defaultValue="1") int currentPage, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		
		if((Member)session.getAttribute("loginMember") != null) {
			
			String memId = (String)((Member)session.getAttribute("loginMember")).getMemId();
							
			int listCount = memberService.selectReceiveMemoCount(memId);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6, 10);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", memberService.selectMemoGet(memId, pi));
		}
		
		return "member/memo/receiveMemo";
	}
	
	@RequestMapping("sendMemo")
	public String sendMemo(@RequestParam(value="cPage", defaultValue="1") int currentPage, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		if((Member)session.getAttribute("loginMember") != null) {
			
			String memId = (String)((Member)session.getAttribute("loginMember")).getMemId();
							
			int listCount = memberService.selectSendMemoCount(memId);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6, 10);
		
			model.addAttribute("pi", pi);
			model.addAttribute("list", memberService.selectMemoSend(memId, pi));
		}
		
		return "member/memo/sendMemo";
	}
	
	@RequestMapping("newMemo")
	public String newMemo(HttpSession session) {
		
		String memId = (String)((Member)session.getAttribute("loginMember")).getMemId();
		
		Member member = new Member();
		member.setMemId(memId);
		session.setAttribute("loginMember", memberService.selectMember(member));
		
		return "member/memo/newMemo";
	}
	
	@RequestMapping("updateMemoCheck")
	public void updateMemoCheck(int memoNo, HttpServletResponse response) throws IOException {
		
		if (memberService.updateMemoCheck(memoNo) == 1) {
			memberService.updateMemoCheckDate(memoNo);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("");
	}
	
	@RequestMapping("selectMemoDetail")
	public void selectMemoDetail(int memoNo, HttpServletResponse response) throws IOException {
		
		Memo memo = memberService.selectMemoDetail(memoNo);
		
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(new Gson().toJson(memo));
	}
	
	@RequestMapping("deleteReceiveMemo")
	public void deleteReceiveMemo(int deleteMemoNo, HttpServletResponse response) {
		
		memberService.deleteReceiveMemo(deleteMemoNo);
		
		return;
	}
	
	@RequestMapping("deleteSendMemo")
	public void deleteSendMemo(int deleteMemoNo, HttpServletResponse response) {
		
		memberService.deleteSendMemo(deleteMemoNo);
		
		return;
	}
	
	@RequestMapping("rollbackSendMemo")
	public void rollbackSendMemo(int deleteMemoNo, HttpServletResponse response) {
		
		memberService.rollbackSendMemo(deleteMemoNo);
		
		return;
	}
	
	@RequestMapping("replyMemo")
	public ModelAndView replyMemo(HttpServletResponse response, String memoDetailSender, ModelAndView mv) {
		
		mv.addObject("Receiver", memoDetailSender);
		mv.setViewName("member/memo/newMemo");
		
		return mv;
	}
	
	@RequestMapping("insertMemo")
	public ModelAndView insertMemo(Memo memo, HttpSession session, ModelAndView mv){
		Member member = new Member();
		member.setMemId(memo.getMemoReceiver());
		
		if(memberService.selectMember(member) != null) {
		
			String memId = (String)((Member)session.getAttribute("loginMember")).getMemId();
			int discountMemo = memberService.discountMemoCount(memId);
			
			if(discountMemo > 0) {
				member.setMemId(memId);
				session.setAttribute("loginMember", memberService.selectMember(member));
				
				memberService.insertMemo(memo);
				
				mv.setViewName("redirect:/newMemo");
			}
		} else {
			mv.addObject("errorMsg", "수신자가 존재하지 않습니다");
			mv.setViewName("member/memo/newMemo");
		}
		
		return mv;
	}
	
	@RequestMapping("insertChatMemo")
	public ModelAndView insertChatMemo(Memo memo, HttpSession session, ModelAndView mv){
						
		int count = memberService.insertChatMemo(memo);
		
		if(count > 0) {
			mv.setViewName("redirect:/newMemo");
		} else {
			mv.addObject("errorMsg", "채팅창 오픈 메세지 전송에 실패했습니다.");
			mv.setViewName("redirect:/newMemo");
		}
		
		return mv;
	}
	
	@RequestMapping("memberModifyFrontMove")
	public String memberModifyFrontMove(){		
		return "member/modify/memberModifyFront";
	}
	
	@RequestMapping("memberPwdCompare")
	public String memberPwdCompare(Member member, HttpSession session) throws IOException {
		
		Member loginMember = memberService.selectMember(member);
		
		if(loginMember != null && (member.getMemPwd().equals(loginMember.getMemPwd()))) {
			return "member/modify/memberModify";
		} else {
			session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다");
			return "redirect:/memberModifyFrontMove";
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 마이페이지 trip관련 조회 메뉴 추가 
	
	@RequestMapping("myReservation")
	public String myReservation(Model m, HttpSession session) {
		
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertMsg","로그인 후 이용해주세요~");
			return "common/main";
		} else {
		
		String memId = ((Member)session.getAttribute("loginMember")).getMemId();
			ArrayList<TaxiReservation> tList = memberService.selectMyTaxiRes(memId);
			ArrayList<CarReservation> cList = memberService.selectMyCarRes(memId);
			ArrayList<CafeRes> cpList = memberService.selectMyCafeRes(memId);
			
			//System.out.println(tList);
			//System.out.println(cList);
			m.addAttribute("tList", tList);
			m.addAttribute("cList", cList);
			m.addAttribute("cpList", cpList);
			
			System.out.println(cpList);
			
		return "member/reservation/myReservation";
		}
	}
	
	@RequestMapping("myCourse")
	public String myCourse(Model m, HttpSession session) {
		
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertMsg","로그인 후 이용해주세요~");
			return "common/main";
		} else {
			
		String memId = ((Member)session.getAttribute("loginMember")).getMemId();
		ArrayList<Place> myCourse = memberService.myCourse(memId);
		//System.out.println(myCourse);
		m.addAttribute("myCourse", myCourse);
		return "member/course/myCourse";
		
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteCourse")
	public String deleteCourse(MyPlace m) {
		//System.out.println(m);
		if(memberService.deleteCourse(m) > 0) {
			return "Y";
		} else {
			return "N";
		}
	}
	
	@ResponseBody
	@RequestMapping("deleteTRes")
	public String deleteTRes(int resNo, String trType) {
		//System.out.println(resNo+trType);
		if(trType.equals("T")) {
			if(memberService.deleteTRes(resNo) > 0) {
				return "Y";
			}else {
				return "N";
			}
		} else {
			if(memberService.deleteCRes(resNo) > 0) {
				return "Y";
			} else {
				return "N";
			}
		}
		
	}
	
	@ResponseBody
	@RequestMapping("deleteCafeRes")
	public String deleteCafeRes(int cafeResNo) {
		if(memberService.deleteCafeRes(cafeResNo) > 0) {
			return "Y";
		} else {
			return "N";
		}
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 박민성
	
		// 작성글 보기
		
		
		// 메일 보내기
	@Autowired
	private JavaMailSenderImpl sender;
	
	@ResponseBody
	@PostMapping("sendMail.bo")
	public int sendMail(String email, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		String secret = generateSecret();
		
		CertVO certvo = CertVO.builder()
				  .who(ip)
				  .secret(secret)
				  .build();
		
		int result = memberService.sendMail(certvo);
		
		helper.setTo(email);
		helper.setSubject("인증번호 보내드립니다");
		helper.setText("인증번호 : " + secret);
		
		sender.send(message);
		
		return result;
		
	}
	
	public String generateSecret() {
	Random r = new Random();
	int i = r.nextInt(100000);
	Format f= new DecimalFormat("000000");
	String secret = f.format(i);
	
	return secret;
	}

	
	@ResponseBody
	@PostMapping("check")
	public int checkCode(String code, HttpServletRequest request) {
		CertVO certVo = CertVO.builder().who(request.getRemoteAddr()).secret(code).build();
		return memberService.validata(certVo);
	}
	
	@ResponseBody
	@PostMapping(value="idFind", produces="application/json; charset=UTF-8")
	public String idFind(String email, HttpServletRequest request) {
		return new Gson().toJson(memberService.idFind(email));
	}
	
	@ResponseBody
	@PostMapping("pwdMail.bo")
	public int pwdMail(String email, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		String ip = request.getRemoteAddr();
		String secret = generateSecret();
		
		CertVO certvo = CertVO.builder()
				  .who(ip)
				  .secret(secret)
				  .build();
		
		int result = memberService.sendMail(certvo);
		
		helper.setTo(email);
		helper.setSubject("인증번호 보내드립니다");
		helper.setText("인증번호 : " + secret);
		
		sender.send(message);
		
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("pwdCheck")
	public int pwdCheck(String code, HttpServletRequest request) {
		CertVO certVo = CertVO.builder().who(request.getRemoteAddr()).secret(code).build();
		return memberService.validata(certVo);
	}

	@ResponseBody
	@PostMapping("pwdFind")
	public ModelAndView pwdFind(Passward p, HttpServletRequest request, ModelAndView mv) {
		if(memberService.pwdFind(p) > 0) {
			mv.addObject("alertMsg", "비밀번호가 변경되었습니다!");
			mv.setViewName("common/main");
		}else {
			mv.addObject("errorMsg", "비밀번호변경에 실패하였습니다!");
			mv.setViewName("common/main");
		}
		return mv;
	}
	
	@RequestMapping("myPage")
	public String myPage(@RequestParam(value="mPage", defaultValue="1") int currentPage, HttpServletRequest request, Model m) {
		String memberId = ((Member)request.getSession().getAttribute("loginMember")).getMemId();
		PageInfo pi = Pagination.getPageInfo(memberService.boardCount(memberId), currentPage, 10, 10);
		pi.setMemberId(memberId);
		ArrayList<Board> list = memberService.myPage(pi);
		if(list.isEmpty()) {
			m.addAttribute("boardList", list);
			return "member/myPageMain";

		}else {
			m.addAttribute("number", 1);
			m.addAttribute("pi", pi);
			m.addAttribute("boardList", list);
			return "member/myPageMain";
		}
	}
	
	@PostMapping("myPageReply")
	public String myPageReply(@RequestParam(value="mPage", defaultValue="1") int currentPage, String memberId, HttpServletRequest request, Model m) {
		
		PageInfo pi = Pagination.getPageInfo(memberService.replyCount(memberId), currentPage, 10, 10);
		pi.setMemberId(memberId);
		ArrayList<Comments> list = memberService.myPageReply(pi);
		if(list.isEmpty()) {
			m.addAttribute("boardList", list);
			return "member/myPageMain";

		}else {
			m.addAttribute("number", 2);
			m.addAttribute("pi", pi);
			m.addAttribute("ReplyList", list);
			return "member/myPageMain";
		}
	}
	@PostMapping("myPageLike")
	public String myPageLike(@RequestParam(value="mPage", defaultValue="1") int currentPage, String memberId, HttpServletRequest request, Model m) {
		
		PageInfo pi = Pagination.getPageInfo(memberService.likeCount(memberId), currentPage, 10, 10);
		pi.setMemberId(memberId);
		ArrayList<Board> list = memberService.myPageLike(pi);
		if(list.isEmpty()) {
			m.addAttribute("boardList", list);
			return "member/myPageMain";

		}else {
			m.addAttribute("number", 3);
			m.addAttribute("pi", pi);
			m.addAttribute("boardList", list);
			return "member/myPageMain";
		}
	}
	
	
	@PostMapping("myPageDelete")
	public String myPageDelete(@RequestParam(value="mPage", defaultValue="1") int currentPage, String memberId, HttpServletRequest request, Model m) {
		
		PageInfo pi = Pagination.getPageInfo(memberService.deleteCount(memberId), currentPage, 10, 10);
		pi.setMemberId(memberId);
		ArrayList<Board> list = memberService.myPageDelete(pi);
		if(list.isEmpty()) {
			m.addAttribute("boardList", list);
			return "member/myPageMain";

		}else {
			m.addAttribute("number", 5);
			m.addAttribute("pi", pi);
			m.addAttribute("boardList", list);
			return "member/myPageMain";
		}
		
	}
	
	@RequestMapping("myPageFriend.me")
	public String myPageFriend(@RequestParam(value="mPage", defaultValue="1") int currentPage, HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String memberId = (String)((Member)session.getAttribute("loginMember")).getMemId();
		PageInfo pi = Pagination.getPageInfo(memberService.friendCount(memberId), currentPage, 6, 10);
		pi.setMemberId(memberId);
		
		ArrayList<Member> list = memberService.myPageFriend(pi);
		if(list.isEmpty()) {
			m.addAttribute("friendList", list);
			return "member/friend/myPageFriend";

		}else {
			m.addAttribute("pi", pi);
			m.addAttribute("friendList", list);
			return "member/friend/myPageFriend";
		}
	}
	
	@PostMapping("friendDelete.me")
	public String friendDelete(String memberId, String friendId, Model m){
		Friend fri = new Friend(memberId, friendId);
		
		if(memberService.friendDelete(fri) > 0) {
			m.addAttribute("alertMsg", "친구 삭제에 성공하셨습니다.");
			return "redirect:myPageFriend.me";
		}else {
			m.addAttribute("alertMsg", "친구 삭제에 실패하셨습니다.");
			return "redirect:myPageFriend.me";
		}
	}
	
	@RequestMapping("goMemo")
	public String goMemo(String memId, HttpServletRequest request) {
		request.setAttribute("newMemo", memId);
		return "memo/newMemo";
	}
	
	@PostMapping("freindSharing.me")
	public String freindSharing(String memberId, String friendId, Model m) {
		Friend fri = new Friend(memberId, friendId);
		
		if(memberService.freindSharing(fri) > 0) {
			m.addAttribute("alertMsg", "친구 일정 공유에 성공하셨습니다.");
			return "redirect:myPageFriend.me";
		} else {
			m.addAttribute("alertMsg", "친구 일정 공유에 실패하셨습니다.");
			return "redirect:myPageFriend.me";
		}
	}
	
	@PostMapping("sharingCancellation.me")
	public String sharingCancellation(String memberId, String friendId, Model m) {
		Friend fri = new Friend(memberId, friendId);
		
		if(memberService.sharingCancellation(fri) > 0) {
			m.addAttribute("alertMsg", "친구 일정 공유 취소에 성공하셨습니다.");
			return "redirect:myPageFriend.me";
		} else {
			m.addAttribute("alertMsg", "친구 일정 공유 취소에 실패하셨습니다.");
			return "redirect:myPageFriend.me";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="friendSearch.me", produces="application/json; charset=UTF-8")
	public String friendSearch(String friendSearch, String memberId, Model m) {
		Friend fri = new Friend(memberId, friendSearch);
		Member member = memberService.friendSearch(fri);
		System.out.println(member);
		if(member != null) {
			return new Gson().toJson(member);
		}else {
			return new Gson().toJson("없음");
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="liveSearch.me", produces="application/json; charset=UTF-8")
	public String liveSearch(String keyword) {
		ArrayList<Member> list = memberService.liveSearch(keyword +"%");
		if(list != null) {
			return new Gson().toJson(list);
		}else {
			return new Gson().toJson("없음");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="findMember.me", produces="application/json; charset=UTF-8")
	public String findMember(String findMember) {
		Member member = memberService.findMember(findMember);
		if(member != null) {
			return new Gson().toJson(member);
		}else {
			return new Gson().toJson("없음");
		}
	}
	
	@PostMapping("friendInsert.me")
	public String friendInsert(String friendId, String memberId, Model m) {
		Friend f = new Friend(friendId, memberId);
		if(memberService.friendInsert(f) > 0) {
			m.addAttribute("alertMsg", "친구 추가에 실패하셨습니다.");
			return "redirect:myPageFriend.me";
		}else {
			m.addAttribute("alertMsg", "친구 추가에 실패하셨습니다.");
			return "redirect:myPageFriend.me";
		}
	}
	@RequestMapping("inquiry.me")
	public String inquiry(@RequestParam(value="iPage", defaultValue="1") int currentPage, HttpServletRequest request, Model m) {
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginMember")).getMemId();
		PageInfo pi = Pagination.getPageInfo(memberService.inquiryCount(memberId), currentPage, 10, 10);
		pi.setMemberId(memberId);
		ArrayList<Inquiry> list = memberService.inquiry(pi);
		if(list.isEmpty()) {
			m.addAttribute("inquiryList", list);
			return "member/inquiry/memberInquiry";
		}else {
			m.addAttribute("pi", pi);
			m.addAttribute("inquiryList", list);
			return "member/inquiry/memberInquiry";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="inquiryDetail.me", produces="application/json; charset=UTF-8")
	public String inquiryDetail(int inquiryNo, String memberId) {
		System.out.println(memberId);
		Inquiry i = new Inquiry(memberId, inquiryNo);
		Inquiry inquiry = memberService.inquiryDetail(i);
		if(inquiry != null) {
			if(inquiry.getInquiryAnswer() == null) {
				inquiry.setInquiryAnswer("답변 내용이 아직 작성되지 않았습니다.");
			}
			return new Gson().toJson(inquiry);
		}else {
			return new Gson().toJson("없음");
		}
	}
	
	@RequestMapping("inuqiryDelete.me")
	public String inquiryDelete(int ino, Model m) {
		if(memberService.inquiryDelete(ino) > 0) {
			m.addAttribute("alertMsg", "삭제에 성공하셨습니다.");
			return "redirect:inquiry.me";
		}else {
			m.addAttribute("alertMsg", "삭제에 실패하셨습니다.");
			return "redirect:inquiry.me";
		}
	}
	
	@RequestMapping("inquiryInsertPage.me")
	public String inquiryInsertPage() {
		return "member/modal/memberinquiryModal";
	}
	
	@RequestMapping("inquiryInsert.me")
	public String inquiryInsert(String memberId, String inquiryTitle, String inquiryContent, Model m) {
		Inquiry i = new Inquiry();
		i.setMemberId(memberId);
		i.setInquiryTitle(inquiryTitle);
		i.setInquiryContent(inquiryContent);
		if(memberService.inquiryInsert(i) > 0) {
			m.addAttribute("alertMsg", "작성에 성공하셨습니다.");
			return "redirect:inquiry.me";
		}else {
			m.addAttribute("alertMsg", "작성에 실패하셨습니다.");
			return "redirect:inquiry.me";
		}
		
	}
	
	@RequestMapping("chatting.me")
	public String chatting(HttpServletRequest request, Model m) {
		AllChatting all= memberService.allChatLast();
		HttpSession session = request.getSession();
		String memberId = ((Member)session.getAttribute("loginMember")).getMemId();
		ArrayList<OneChatting> one = memberService.oneChatList(memberId);
		session.setAttribute("clear", "clear");
		m.addAttribute("oneChatList", one);
		m.addAttribute("lastChat", all);
		return "member/chatting/memberChatting";
				
	}
	@ResponseBody
	@RequestMapping(value="allChattingInsert.me", produces="application/json; charset=UTF-8")
	public String allChattingInsert(String memberId) {
		ArrayList<AllChatting> a = memberService.allChattingInsert(memberId);
		return new Gson().toJson(a);
	}
	
	@PostMapping("oneChatInsert.me")
	public String oneChatInsert(String friendId, String memberId, Model m, HttpServletRequest request) {
		System.out.println(1111);
		OneChatting one = new OneChatting();
		one.setMemberOne(friendId);
		one.setMemberTwo(memberId);
		one.setOneChatContent(memberId + "님이 " + friendId + "님을 초대하였습니다.");
		
		//System.out.println(one);
		one = memberService.oneChatInsert(one);
		System.out.println(one);
		request.getSession().setAttribute("onChat", one);
		return "redirect:chatting.me";
	}
	
	@ResponseBody
	@RequestMapping(value="oneChattingSelect.me", produces="application/json; charset=UTF-8")
	public String oneChattingSelect(int oneChatNo) {
		ArrayList<OneChatting> one = memberService.oneChattingSelect(oneChatNo);
		return new Gson().toJson(one);
	}
	
	@PostMapping(value="boardSelectDelete", produces="application/json; charset=UTF-8")
	public String boardSelectDelete(String numbers) {
		String[] num = numbers.split(",");
		int[] intArray = new int[num.length];
		for(int i = 0; i < num.length; i++) {
			intArray[i] = Integer.parseInt(num[i]);
		}
		 memberService.boardSelectDelete(intArray);
		return "redirect:myPage";
	}
		
	}
