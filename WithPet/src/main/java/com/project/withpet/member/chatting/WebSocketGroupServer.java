package com.project.withpet.member.chatting;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.withpet.member.model.service.MemberService;
import com.project.withpet.member.model.vo.AllChatting;

public class WebSocketGroupServer extends TextWebSocketHandler{

	/*
	 * 사용자들을 기억하기 위한 저장소
	 * - 중복 불가
	 * - 동기화 지원 
	 * 
	 */
	private Set<WebSocketSession> users = new CopyOnWriteArraySet();
	@Autowired
	private MemberService memberService;
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session);
		users.add(session);
		System.out.println("사용자 접속! 현재 " + users.size() + "명");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 메시지를 모든 사용자에게 전송(사용자 수만큼 반복해서 전송)
		System.out.println(message+"여기맞음?");
		String[] arr = message.getPayload().split(":");
		for(int i = 0; i < arr.length; i++) {
		System.out.println(arr[i]);
		}
		System.out.println(users);
		AllChatting a = new AllChatting();
		a.setMemberId(arr[0]);
		a.setChatContent(arr[1]);
		memberService.allChatList(a);
		TextMessage newMessage = new TextMessage(message.getPayload()); // payload필드에 사용자가 실제 보낸 내용
		//session.sendMessage(newMessage);
		for(WebSocketSession ws : users) {
			System.out.println(ws+"ws");
			System.out.println(users + "users");
			System.out.println(ws.getId());
			System.out.println(newMessage);
			ws.sendMessage(newMessage);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		System.out.println("사용자 종료! 현재 " + users.size() + "명");
	}

	
	
}
