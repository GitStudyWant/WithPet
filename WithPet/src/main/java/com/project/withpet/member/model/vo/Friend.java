package com.project.withpet.member.model.vo;

import lombok.Data;

@Data
public class Friend {

	private String friendSender;
	private String friendReceiver;
	public Friend(String friendSender, String friendReceiver) {
		super();
		this.friendSender = friendSender;
		this.friendReceiver = friendReceiver;
	}
	
	
	
}
