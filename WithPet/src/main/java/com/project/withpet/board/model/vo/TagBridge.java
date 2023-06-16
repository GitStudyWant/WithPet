package com.project.withpet.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class TagBridge {
	
	private int bridgeNo;	//NUMBER
	private int bridgeId;	//NUMBER
	
	public TagBridge() {
	}

	public void setBridgeId(int bridgeId) {
        this.bridgeId = bridgeId;
    }
}
