package com.project.withpet.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.project.withpet.member.model.vo.Member;

public class WebSocketHandShakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception{
		
		
		ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		
		
		HttpServletRequest req = ssreq.getServletRequest();
		HttpSession session = req.getSession();
		String memberId = ((Member)session.getAttribute("loginMember")).getMemId();
		attributes.put("memberId", memberId);
		attributes.put("roomNo", ssreq.getServletRequest().getParameter("chat"));
		attributes.put("style", ssreq.getServletRequest().getParameter("style"));
		return super.beforeHandshake(request, response, wsHandler, attributes);
		
	}
	
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex) {
	
		super.afterHandshake(request, response, wsHandler, ex);
	}
	
}
