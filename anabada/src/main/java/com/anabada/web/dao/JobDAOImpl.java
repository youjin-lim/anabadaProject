package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.SearchCriteria;

@Repository
public class JobDAOImpl implements JobDAO{

	@Inject
	private SqlSession sqlSession;
	
	// 게시물 작성
	@Override
	public void write_boss(JobVO vo) throws Exception {
		sqlSession.insert("jobMapper.insert", vo);
	}

	// 게시판 조회
	@Override
	public List<JobVO> job_list(SearchCriteria scri) throws Exception {
		System.out.println(scri);
		return sqlSession.selectList("jobMapper.listPage", scri);
	}

	// 게시글 갯수
	@Override
	public int job_listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("jobMapper.listCount", scri);
	}

	// 게시물 상세 보기
	@Override
	public JobVO job_view(int j_bno) throws Exception {
		return sqlSession.selectOne("jobMapper.read", j_bno);
	}

	@Override
	public void update_boss(JobVO vo) throws Exception {
		sqlSession.update("jobMapper.update", vo);
	}

	@Override
	public void delete_boss(int j_bno) throws Exception {
		sqlSession.delete("jobMapper.delete", j_bno);
	}

}
