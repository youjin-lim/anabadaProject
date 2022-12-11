package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.PBoardDAO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.SearchCriteriapro;
import com.anabada.web.vo.SimilarSearch;
@Service
public class ProductServiceImpl  implements ProductService {

  
	
	  //DAO 주입
	  @Inject PBoardDAO dao;
	 
	
	
	//글쓰기 저장
	@Override
	public void write(PBoardVO pboardVO) throws Exception {
		
		
		dao.write(pboardVO);
		
		
		
	}



  // 글목록 보기 
	@Override
	public List<PBoardVO> list(SearchCriteriapro scri) throws Exception {
	
	 
		
		
		return dao.list(scri);
	}


  // 게시글 총 갯수 
	@Override
	public int listCount(SearchCriteriapro scri) throws Exception {
		
		return dao.listCount(scri);
	}


    // 게시글 상세보기 
	@Override
	public PBoardVO read(int pno) throws Exception {
		
		return (PBoardVO) dao.read(pno);
	}



	// 유사한 상품 목록 얻어오기 
	@Override
	public List<PBoardVO> similar(String p_type) throws Exception {
		
		//제품의 p_type을 받아서 비교
		/* 
		1. p_type에 해당하는 전체 게시글 수 구하기
		2. 
		 
	     */
		
		//1. p_type에 해당하는 게시글들이 총 몇개인지 얻어오기 
		int num =   dao.typecount(p_type); 
		
		// 랜덤 처리 
		double rannum = Math.random();
		int tnum=  (int)(rannum*50)+1;
		if(tnum < 8) {tnum+=8;}
		//랜덤 처리 된 것에서 게시글 6개 받아오기 
		
		SimilarSearch si = new SimilarSearch();
		si.setSearchP_type(p_type);
		si.setTnum(tnum);
		
		
		
		
		
		return dao.similar(si);
	}
	
	
	

}
