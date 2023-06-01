package com.project.withpet.board.model.service;

import java.util.ArrayList;

import com.project.withpet.board.common.model.vo.PageInfo;
import com.project.withpet.board.model.vo.Board;

public interface BoardService {

	ArrayList<Board> selectFrList(PageInfo pi);

	int selectFrListCount();
	

	
}
