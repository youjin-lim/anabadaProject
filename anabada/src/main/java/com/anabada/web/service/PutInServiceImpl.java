package com.anabada.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.PutInDAO;
import com.anabada.web.vo.PutInVO;

@Service
public class PutInServiceImpl implements PutInService {

	@Inject
	PutInDAO dao;
	
	public void putIn_job(PutInVO vo) throws Exception{
		dao.putIn_job(vo);
	}
}
