package com.anabada.web.controller;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartRequest;

import com.anabada.web.service.ProductService;
import com.anabada.web.vo.MemberVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PageMaker;
import com.anabada.web.vo.SearchCriteriapro;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	ProductService service;

	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public String writeView(HttpServletRequest req) {

		// 임의 설정 부분 지워주어야 한다 나중에

		HttpSession session = req.getSession();
		MemberVO memberVO = new MemberVO();
		memberVO.setId("korea");
		session.setAttribute("member", memberVO);
		// ---------------------------------------------------
		System.out.println("product Write 컨트롤러 ");

		return "/product/productwrite";

	}

	// 글을 다 작성하고 저장을 눌렀을때
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(PBoardVO pboardVO ,HttpServletRequest req, HttpServletResponse resp ) throws Exception {

		/* 값이 넘어올때 체크되지 않은 체크 박스는 null로 넘어온다. 처리필요 */
		/*
		 * if (pboardVO.getSell_a() == null) { pboardVO.setSell_a("0"); } if
		 * (pboardVO.getSell_b() == null) { pboardVO.setSell_b("0"); } if
		 * (pboardVO.getP_file() == null) { pboardVO.setP_file("0"); }
		 */
		/*
		 * req.setCharacterEncoding("UTF-8"); String realFoler=""; String
		 * uploadFoler="/productimg"; int fileSize = 5*1024*1024; try { MultipartRequest
		 * multi = null; multi = new MultipartRequest(req, uploadFilePath, fileSize,
		 * "UTF-8" , new DefaultFileRe );
		 * 
		 * 
		 * } catch (Exception e) { // TODO: handle exception }
		 */
		
		
		

		
		System.out.println("pboardVO : " + pboardVO);
		
		service.write(pboardVO); // DB에 insert 실행

		return "redirect:/product/list";
	}

	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteriapro scri) throws Exception {

		logger.info("product_ list");
	    System.out.println("확인용123 :   "+scri);
		model.addAttribute("list", service.list(scri)); //  전체 게시글 조회 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
        
      
		return "product/list";
	}
	
	
	// 게시판 글조회
	@RequestMapping(value="/readView" , method = RequestMethod.GET)
	public String read(PBoardVO pboardVO,  @ModelAttribute("scri") SearchCriteriapro scri, Model model ) throws Exception{
		
		model.addAttribute("read", service.read(pboardVO.getPno()));
	
		
		model.addAttribute("similar" , service.read(pboardVO.getPno()).getP_type() ); // 유사제품 리스트 6개담음 5개뽑아쓰기 
		
		return "product/readView";
	}
	
	
	
	
	
	

}
