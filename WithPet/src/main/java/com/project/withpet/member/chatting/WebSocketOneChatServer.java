package com.project.withpet.member.chatting;



import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.withpet.member.model.service.MemberService;
import com.project.withpet.member.model.vo.AllChatting;
/*
 * 웹소켓의 기본적인 이해를 돕기위해 만든 서버
 * - 특정 클래스 / 인터페이스 상속 필요
 * 
 */
import com.project.withpet.member.model.vo.OneChatting;

public class WebSocketOneChatServer extends TextWebSocketHandler{

		private Set<WebSocketSession> users = new CopyOnWriteArraySet();
		private Map<String, Object> userMap = new HashMap<String, Object>();
		
		
		@Autowired
		private MemberService memberService;
		
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
			super.afterConnectionEstablished(session);
			Map<String, Object> map = session.getAttributes();
		    String memberId = (String)map.get("memberId");
		    int roomNo = Integer.parseInt((String)map.get("roomNo"));
		    OneChatting one2 = new OneChatting();
		    one2.setMemberId(memberId);
		    one2.setOneChatNo(roomNo);
		    userMap.put(memberId, session);

		    System.out.println(session+"여기가 세션");
		    if(memberService.oneRoomIn(one2) != null) {
				users.add(session);
				System.out.println(users +"여기봐야함");
				
				System.out.println("사용자 접속! 현재 " + users.size() + "명");
		    }else {
		    	System.out.println("사용자 접속 실패!! 현재 " + users.size() + "명");
		    }
		    
		}

		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			// 메시지를 모든 사용자에게 전송(사용자 수만큼 반복해서 전송)
			String[] arr = message.getPayload().split(":");
			Map<String, Object> map = session.getAttributes();
		    String memberId = (String)map.get("memberId");
		    int roomNo = Integer.parseInt((String)map.get("roomNo"));
		    OneChatting one = new OneChatting();
		    one.setMemberId(memberId);
		    one.setOneChatNo(roomNo);
		    OneChatting oneChat = memberService.oneRoomIn(one);

			OneChatting o = new OneChatting();
			o.setMemberId(arr[0]);
			if(arr.length == 2) {
				o.setOneChatContent(arr[1]);
			}else {
				o.setOneChatContent("　");
			}
			o.setOneChatNo(roomNo);
			TextMessage newMessage = new TextMessage(message.getPayload()); // payload필드에 사용자가 실제 보낸 내용
			if(memberService.oneChatContentInsert(o) > 0) {
				session.sendMessage(newMessage);
			}
			
			
			
		    if(oneChat.getMemberOne() != null) {
		    	if(((String)oneChat.getMemberOne()).equals((String)memberId)) {
		    		WebSocketSession wss = (WebSocketSession)userMap.get((String)oneChat.getMemberTwo()); 
		    		for(WebSocketSession ws : users) {
		    			if(wss == ws) {
				    			wss.sendMessage(newMessage);
		    			}
		    		}
		    		
		    	}else {
		    		WebSocketSession wss = (WebSocketSession)userMap.get((String)oneChat.getMemberOne());
		    		for(WebSocketSession ws : users) {
		    			if(wss == ws) {
				    			wss.sendMessage(newMessage);
		    			}
		    		}
		    	}
		    }
		}

		public void afterConnectionClosed(WebSocketSession session, CloseStatus status, HttpServletRequest requests) throws Exception {
			users.remove(session);
			System.out.println("사용자 종료! 현재 " + users.size() + "명");
		}


}