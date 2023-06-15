package com.project.withpet.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {
	
	private int boardNo;//BOARD_NO	NUMBER
	private String boardTitle;//BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardWriter;//BOARD_WRITER	VARCHAR2(50 BYTE)
	private String boardContent;//BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private Date enrolldate;//ENROLLDATE	DATE
	private int viewCount;//VIEW_COUNT	NUMBER
	private String status;//STATUS	VARCHAR2(10 BYTE)
	private int rating;//RATING	NUMBER
	private int boardNum;//BOARD_NUM	NUMBER
	private String originName;
	private String changeName;
	
}
