package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.SearchCriteria;

public interface JobDAO {

	public void write_boss(JobVO vo) throws Exception;

	public List<JobVO> job_list(SearchCriteria scri) throws Exception;

	public int job_listCount(SearchCriteria scri) throws Exception;

	public JobVO job_view(int j_bno) throws Exception;

	public void update_boss(JobVO vo) throws Exception;
	
	public void delete_boss(int j_bno) throws Exception;
	
}
