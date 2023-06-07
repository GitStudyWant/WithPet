package com.project.withpet.member.controller;

import java.io.BufferedReader;
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

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
			mv.addObject("errorMsg", "에러 발생").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("login.me")
	public ModelAndView selectMember(Member member, ModelAndView mv, HttpSession session) throws ServletException, IOException{
				
		Member loginMember = memberService.selectMember(member);
		int loginMemo = memberService.selectMemoCount(member.getMemId());
		System.out.println(member.getMemId());
		System.out.println(loginMemo);
		
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
	
	@RequestMapping("kakaoLogin.me")
	public void selectKakaoMember(String kakaoId, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		
		System.out.println("kakaoLogin 진입");
		
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
		System.out.println("kakaoLoginJump 진입");
		return "member/kakaoLogin";
	}
	
	@RequestMapping("kakaoGetTokenUser")
	public void kakaoGetTokenUser(String code, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		System.out.println("kakaoGetTokenUser 진입");
		
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
	
	@RequestMapping(value="memberDiaryMain.me")
	public ModelAndView Diary(ModelAndView mv){
		
		//숫자가 들어오면 해당 달의 마지막 날짜 구하기 (31)
		//숫자가 들어오면 해당 달의 1일 주 구하기 (수)
		
		HashMap<Integer, Integer> monthLastList = new HashMap();
		monthLastList.put(1, 31);
		monthLastList.put(2, 28);
		monthLastList.put(3, 31);
		monthLastList.put(4, 30);
		monthLastList.put(5, 31);
		monthLastList.put(6, 30);
		monthLastList.put(7, 31);
		monthLastList.put(8, 31);
		monthLastList.put(9, 30);
		monthLastList.put(10, 31);
		monthLastList.put(11, 30);
		monthLastList.put(12, 31);
		
		Date date = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("MM");
		int thisMonth = Integer.parseInt(sdf.format(date)); // 오늘의 달값
		
		//System.out.println(monthLastList.get(thisMonth));

		
		mv.setViewName("member/diary/memberDiary");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 박민성
	
	// 작성글 보기
	
	
	// 메일 보내기
	@Autowired
	private JavaMailSenderImpl sender;
	
	@ResponseBody
	@PostMapping("sendMail.bo")
	public int sendMail(String email, HttpServletRequest request) throws MessagingException {
		System.out.println("오냐?");
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
		System.out.println("오냐?");
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
	
}
