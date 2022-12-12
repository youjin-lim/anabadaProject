package com.anabada.web.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.PutInVO;

@Repository
public class PutInDAOImpl implements PutInDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void putIn_job(PutInVO vo) throws Exception {
		sqlSession.insert("putInMapper.insert", vo);
	}

}
