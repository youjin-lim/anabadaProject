package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.SearchCriteriapro;
import com.anabada.web.vo.SimilarSearch;

@Repository
public class PBoardDAOImpl implements PBoardDAO {

	@Inject
	private SqlSession sql;

	// 게시글을 저장하는 쿼리
	@Override
	public int write(PBoardVO pboardVO) throws Exception {

		int pnum ;
		sql.selectOne("pBoardMapper.maxpno"); // pno 설정을 위해 max값 찾아옴
		if (sql.selectOne("pBoardMapper.maxpno") == null) {
			pnum = 1;
		}else {
			pnum = sql.selectOne("pBoardMapper.maxpno");
		}
		pboardVO.setPno(pnum);

		sql.insert("pBoardMapper.insert", pboardVO);

		return pnum;

	}

	// 게시글 목록보기
	@Override
	public List<PBoardVO> list(SearchCriteriapro scri) throws Exception {

		return sql.selectList("pBoardMapper.listPage", scri);

	}

	// 총 개시글 숫자
	@Override
	public int listCount(SearchCriteriapro scri) throws Exception {

		return sql.selectOne("pBoardMapper.listCount", scri);
	}

	// 게시글 상세보기 (게시물 조회)
	@Override
	public Object read(int pno) {

		sql.update("pBoardMapper.cuntup", pno); // 조회수를 1 올린다.

		return sql.selectOne("pBoardMapper.read", pno); // 게시물 상세보기 정보 전송
	}

	// 타입에 해당하는 게시글 총 갯수 구하기
	@Override
	public int typecount(String p_type) {

		return sql.selectOne("pBoardMapper.typecount", p_type);
	}

	// 유사한 상품 검색하는 쿼리 (tnum 은 랜덤 처리를 위한 숫자 )
	@Override
	public List<PBoardVO> similar(SimilarSearch si) {

		return sql.selectList("pBoardMapper.similar");
	}

	//게시글 저장시 사진경로 저장 
	@Override
	public void fileSave(Map<String, String> map) {
		sql.insert("pBoardMapper.fileSave", map);

	}

	//게시글 상세보기시 사진정보 가져오기
	@Override
	public List<PfileVO> filelist(int pno) {
		// TODO Auto-generated method stub
		return sql.selectList("pBoardMapper.filelist",pno);
	}

}
