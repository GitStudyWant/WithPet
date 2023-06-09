package com.project.withpet.cafe.model.service;

import java.util.ArrayList;

import com.project.withpet.cafe.model.vo.Cafe;
import com.project.withpet.cafe.model.vo.CafeRes;
import com.project.withpet.common.model.vo.PageInfo;

public interface CafeService {

	// 카페 총 개수 조회
	int selectListCount();
	
	// 카페 리스트 조회
	ArrayList<Cafe> selectList(PageInfo pi);
	
	// 카페 등록하기
	int insertCafe(Cafe c);
	
	// 카페 이용안내(디테일)
	Cafe cafeInfo(int cafeNo);
	
	int cafeReservation(CafeRes r);
	
	int findCafeNo(CafeRes r);
	
}
