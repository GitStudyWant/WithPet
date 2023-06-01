package com.project.withpet.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data @AllArgsConstructor @Builder
public class CertVO {

	private String who;
	private String secret;
	private String when;
}
