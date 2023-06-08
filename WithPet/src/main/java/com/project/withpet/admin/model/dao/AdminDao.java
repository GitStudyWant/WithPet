package com.project.withpet.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.project.withpet.trip.model.vo.Transportation;

@Repository
public class AdminDao {

	public ArrayList<Transportation> adminTransportation(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminTransportation");
	}

	public int addTransportation(SqlSessionTemplate sqlSession, Transportation t) {
		return sqlSession.insert("adminMapper.addTransportation", t);
	}

	public int deleteTr(SqlSessionTemplate sqlSession, int trNo) {
		System.out.println("dao결과:"+sqlSession.delete("adminMapper.deleteTr", trNo));
		return sqlSession.delete("adminMapper.deleteTr", trNo);
	}

}
