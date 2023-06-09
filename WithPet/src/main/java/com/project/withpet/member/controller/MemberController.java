package com.project.withpet.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.Format;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.common.template.Pagination;
import com.project.withpet.board.model.vo.Board;
import com.project.withpet.board.model.vo.Comments;
import com.project.withpet.member.model.service.MemberService;
import com.project.withpet.member.model.vo.CertVO;
import com.project.withpet.member.model.vo.Friend;
import com.project.withpet.member.model.vo.Member;
import com.project.withpet.member.model.vo.Passward;
import com.project.withpet.member.model.vo.Schedule;
import com.project.withpet.trip.model.vo.Place;

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
		
		if(memberService.insertMember(member) > 0) {
			mv.setViewName("common/main");
		} else { 
			mv.addObject("errorMsg", "�뿉�윭 諛쒖깮").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("login.me")
	public ModelAndView selectMember(Member member, ModelAndView mv, HttpSession session) throws ServletException, IOException{

		Member loginMember = memberService.selectMember(member);

		int loginMemo = memberService.selectMemoCount(member.getMemId());

		if(loginMember != null && (member.getMemPwd().equals(loginMember.getMemPwd())) /* && bcryptPasswordEncoder.matches(member.getMemPwd(), loginMember.getMemPwd())*/) {
			session.setAttribute("loginMember", loginMember);
			session.setAttribute("loginMemo", loginMemo);
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errorMsg", "�쓳 �븞�뤌~");
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
		
		System.out.println("kakaoGetCodeUrl 吏꾩엯");
		
		String getCodeUrl = "https://kauth.kakao.com/oauth/authorize"
				        + "?client_id=" + "261f64346cb2da405692b542c232a7d3&"
				        + "&redirect_uri=" + "http://localhost:8787/withpet/kakaoLoginJump"
				        + "&response_type=code";
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(getCodeUrl);
	}
	
	@RequestMapping("kakaoLogin.me")
	public void selectKakaoMember(String kakaoId, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		
		System.out.println("kakaoLogin 吏꾩엯");
		
		Member TempMember = memberService.selectKakaoMember(kakaoId);
		
		if(TempMember != null) {
			session.setAttribute("loginMember", TempMember);
			session.setAttribute("loginMemo", memberService.selectMemoCount(TempMember.getMemId()));
			session.removeAttribute("kakaoId");			
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("1");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("0");
		}
	}
	
	@RequestMapping("/kakaoLoginJump")
	public String kakaoLoginJump() throws ServletException, IOException {
		System.out.println("kakaoLoginJump 吏꾩엯");
		return "member/kakaoLogin";
	}
	
	@RequestMapping("kakaoGetTokenUser")
	public void kakaoGetTokenUser(String code, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		System.out.println("kakaoGetTokenUser 吏꾩엯");
		
		String accessToken = getAccessToken(code);
		HashMap<String, Object> userInfo = getUserInfo(accessToken);
		
		HttpSession session = request.getSession();
		session.setAttribute("accessToken", userInfo.get("accessToken"));
		session.setAttribute("kakaoId", userInfo.get("id"));
		
		if(memberService.selectKakaoCount((String)userInfo.get("id")) == 0){			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("http://localhost:8787/withpet");
		} else {
        response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print("http://localhost:8787/withpet");
		}
		
	}
	
	@RequestMapping("deleteKakaoId")
	public String deleteKakaoId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("kakaoId");
		
		return "common/main";
	}
	
	public String getAccessToken(String code) throws ServletException, IOException, ParseException {
		
		System.out.println("getAccessToken 吏꾩엯");
		
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
	
		System.out.println("getUserInfo 吏꾩엯");
		
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
	
	
	
	@RequestMapping(value="memberDiaryMain")
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
	
	@RequestMapping(value="insertSchedule")
	public String insertSchedule(Schedule schedule){
		
		int schedulecount = memberService.insertSchedule(schedule);

		return "redirect:/memberDiaryMain";
	}
	
	@RequestMapping(value="updateSchedule")
	public String updateSchedule(Schedule schedule){
		
		int schedulecount = memberService.updateSchedule(schedule);

		return "redirect:/memberDiaryMain";
	}
	
	@RequestMapping(value="deleteSchedule")
	public String deleteSchedule(int scheduleNo){
		
		int schedulecount = memberService.deleteSchedule(scheduleNo);

		return "redirect:/memberDiaryMain";
	}
	
	
	@RequestMapping("receiveMemo")
	public String receiveMemo(@RequestParam(value="cPage", defaultValue="1") int currentPage, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		String memId = (String)((Member)session.getAttribute("loginMember")).getMemId();
						
		int listCount = memberService.selectMemoCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", memberService.selectMemoGet(memId, pi));
		
		return "member/memo/receiveMemo";
		
	}
	
	@RequestMapping("sendMemo")
	public String sendMemo(@RequestParam(value="cPage", defaultValue="1") int currentPage, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		String memId = (String)((Member)session.getAttribute("loginMember")).getMemId();
						
		int listCount = memberService.selectMemoCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", memberService.selectMemoSend(memId, pi));
		
		return "member/memo/sendMemo";
	}
	
	@RequestMapping("newMemo")
	public String newMemo() {
		return "member/memo/newMemo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 마이페이지 trip관련 조회 메뉴 추가 
	
	@RequestMapping("myReservation")
	public String myReservation(Model m) {
		return "member/reservation/myReservation";
	}
	
	@RequestMapping("myCourse")
	public String myCourse(Model m, HttpSession session) {
		
		if(session.getAttribute("loginMember") == null) {
			session.setAttribute("alertMsg","로그인 후 이용해주세요~");
			return "common/main";
		} else {
			
		String memId = ((Member)session.getAttribute("loginMember")).getMemId();
		ArrayList<Place> myCourse = memberService.myCourse(memId);
		System.out.println(myCourse);
		m.addAttribute("myCourse", myCourse);
		return "member/course/myCourse";
		
		}
	}
	
	@RequestMapping("sendMemo")
	public String sendMemo(@RequestParam(value="cPage", defaultValue="1") int currentPage, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		String memId = (String)((Member)session.getAttribute("loginMember")).getMemId();
						
		int listCount = memberService.selectMemoCount(memId);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", memberService.selectMemoSend(memId, pi));
		
		return "member/memo/sendMemo";
	}
	
	@RequestMapping("newMemo")
	public String newMemo() {
		return "member/memo/newMemo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 諛뺣�쇱꽦
	
	// �옉�꽦湲� 蹂닿린
	
	
	// 硫붿씪 蹂대궡湲�
	@Autowired
	private JavaMailSenderImpl sender;
	
	@ResponseBody
	@PostMapping("sendMail.bo")
	public int sendMail(String email, HttpServletRequest request) throws MessagingException {
		System.out.println("�삤�깘?");
		System.out.println(email);
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
		helper.setSubject("�씤利앸쾲�샇 蹂대궡�뱶由쎈땲�떎");
		helper.setText("�씤利앸쾲�샇 : " + secret);
		
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
		System.out.println("�삤�깘?");
		System.out.println(email);
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
		helper.setSubject("�씤利앸쾲�샇 蹂대궡�뱶由쎈땲�떎");
		helper.setText("�씤利앸쾲�샇 : " + secret);
		
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
			mv.addObject("alertMsg", "鍮꾨�踰덊샇媛� 蹂�寃쎈릺�뿀�뒿�땲�떎!");
			mv.setViewName("common/main");
		}else {
			mv.addObject("errorMsg", "鍮꾨�踰덊샇蹂�寃쎌뿉 �떎�뙣�븯���뒿�땲�떎!");
			mv.setViewName("common/main");
		}
		return mv;
	}
	
	@PostMapping("myPage")
	public String myPage(@RequestParam(value="mPage", defaultValue="1") int currentPage, String memberId, HttpServletRequest request, Model m) {
		
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
			m.addAttribute("alertMsg", "移쒓뎄 �궘�젣�뿉 �꽦怨듯븯�뀲�뒿�땲�떎.");
			return "redirect:myPageFriend.me";
		}else {
			m.addAttribute("alertMsg", "移쒓뎄 �궘�젣�뿉 �떎�뙣�븯�뀲�뒿�땲�떎.");
			return "redirect:myPageFriend.me";
		}
	}
	
	@PostMapping("freindSharing.me")
	public String freindSharing(String memberId, String friendId, Model m) {
		Friend fri = new Friend(memberId, friendId);
		
		if(memberService.freindSharing(fri) > 0) {
			m.addAttribute("alertMsg", "移쒓뎄 �씪�젙 怨듭쑀�뿉 �꽦怨듯븯�뀲�뒿�땲�떎.");
			return "redirect:myPageFriend.me";
		} else {
			m.addAttribute("alertMsg", "移쒓뎄 �씪�젙 怨듭쑀�뿉 �떎�뙣�븯�뀲�뒿�땲�떎.");
			return "redirect:myPageFriend.me";
		}
	}
	
	@PostMapping("sharingCancellation.me")
	public String sharingCancellation(String memberId, String friendId, Model m) {
		Friend fri = new Friend(memberId, friendId);
		
		if(memberService.sharingCancellation(fri) > 0) {
			m.addAttribute("alertMsg", "移쒓뎄 �씪�젙 怨듭쑀 痍⑥냼�뿉 �꽦怨듯븯�뀲�뒿�땲�떎.");
			return "redirect:myPageFriend.me";
		} else {
			m.addAttribute("alertMsg", "移쒓뎄 �씪�젙 怨듭쑀 痍⑥냼�뿉 �떎�뙣�븯�뀲�뒿�땲�떎.");
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
			return new Gson().toJson("�뾾�쓬");
		}
	}
	
}
