package com.anabada.web.service;

import java.util.List;

import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.SearchCriteriapro;

public interface ProductService {
	
	
	//게시글 작성 
	public void write(PBoardVO pboardVO) throws Exception;
	
	//게시글 목록 조회(list 조회)
    public List<PBoardVO> list (SearchCriteriapro scri) throws Exception ;
	//총 게시글 수 
	public int listCount(SearchCriteriapro scri) throws Exception ;
    //게시글 상세보기 
	public PBoardVO read(int pno) throws Exception ;
	//연관 상품 정보 담아오기 
	public List<PBoardVO> similar(String p_type) throws Exception;
	
	// 게시물 수정 
	
	//게시물 삭제 
	
	
	

}
