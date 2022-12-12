package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.SearchCriteriapro;
import com.anabada.web.vo.SimilarSearch;

public interface PBoardDAO {
	
	//게시글 작성시 저장해주는 쿼리 
	public int write(PBoardVO pboardVO) throws Exception;
	
	//게시글 목록 보기
	public List<PBoardVO> list (SearchCriteriapro scri) throws Exception;

	// 총 게시글 숫자 
	public int listCount(SearchCriteriapro scri) throws Exception ;

	// 게시글 상세보기
	public Object read(int pno);

	// 해당 타입의 개시글 총 수 구하기 
	public int typecount(String p_type);

	// 유사한 상품 검색하기 
	public List<PBoardVO> similar(SimilarSearch si);

	//게시글 저장시 사진 정보 저장 
	public void fileSave(Map<String, String> map);

	//게시글 상세보기시 파일정보 가져오기
	public List<PfileVO> filelist(int pno);

}
