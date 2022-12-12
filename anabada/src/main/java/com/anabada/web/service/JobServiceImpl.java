package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.JobDAO;
import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.SearchCriteria;

@Service
public class JobServiceImpl implements JobService {

	@Inject
	JobDAO dao;
	
	// 알바 구인 게시글 작성
	@Override
	public void write_boss(JobVO vo) throws Exception {
		dao.write_boss(vo);
	}

	// 알바 목록 조회
	@Override
	public List<JobVO> job_list(SearchCriteria scri) throws Exception {
		return dao.job_list(scri);
	}

	// 게시글 총 개수
	@Override
	public int job_listCount(SearchCriteria scri) throws Exception {
		return dao.job_listCount(scri);
	}

	// 알바 구인 게시물 상세 보기
	@Override
	public JobVO job_view(int j_bno) throws Exception {
		return dao.job_view(j_bno);
	}

	// 알바 구인 게시물 수정 
	@Override
	public void update_boss(JobVO vo) throws Exception {
		dao.update_boss(vo);
	}

	@Override
	public void delete_boss(int j_bno) throws Exception {
		dao.delete_boss(j_bno);
	}

}