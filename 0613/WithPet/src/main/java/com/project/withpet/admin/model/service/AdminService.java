package com.project.withpet.admin.model.service;

import java.util.ArrayList;

import com.project.withpet.trip.model.vo.Transportation;

public interface AdminService {
	
	ArrayList<Transportation> adminTransportation();
	
	int addTransportation(Transportation t);
	
	int deleteTr(int trNo);
}
