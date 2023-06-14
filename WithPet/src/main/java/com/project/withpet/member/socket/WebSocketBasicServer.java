package com.project.withpet.member.socket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.withpet.member.model.service.MemberService;

public class WebSocketBasicServer extends TextWebSocketHandler{
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("접속 : ");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String memId = message.getPayload();

		TextMessage sendmsg = new TextMessage(String.valueOf(memberService.selectReceiveMemoCount(memId)));
		
		session.sendMessage(sendmsg);
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("전화 끊었다");
	}

}
