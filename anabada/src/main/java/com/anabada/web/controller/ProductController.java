package com.anabada.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.anabada.web.service.ProductService;
import com.anabada.web.vo.MemberVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PageMaker;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.SearchCriteriapro;

@Controller
@RequestMapping("/product/*")
@SessionAttributes("member")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	// 이미지 파일 저장 폴더 설정
	private static final String CURR_IMAGE_REPO_PATH = "C:\\images\\";
	@Inject
	ProductService service;

	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public String writeView(HttpServletRequest req ,HttpServletResponse res ) {

		// 임의 설정 부분 지워주어야 한다 나중에

		HttpSession session = req.getSession();
		MemberVO memberVO = new MemberVO();
		memberVO.setId("korea");
		session.setAttribute("member", memberVO);
		session.setAttribute("userId", "korea");
		// ---------------------------------------------------
		System.out.println("product Write 컨트롤러 ");

		return "/product/productwrite";

	}

	// 글을 다 작성하고 저장을 눌렀을때 (이미지 / 글 모두 저장 )
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(PBoardVO pboardVO, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {

		/* 값이 넘어올때 체크되지 않은 체크 박스는 null로 넘어온다. 처리필요 */

		if (pboardVO.getSell_a() == null) {
			pboardVO.setSell_a("0");
		}
		if (pboardVO.getSell_b() == null) {
			pboardVO.setSell_b("0");
		}

		multipartRequest.setCharacterEncoding("utf-8");
		Map map = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}

		// view에서 넘어온 사진들이 담긴 fileList
		List fileList = fileProcess(multipartRequest);
		pboardVO.setP_file(fileList.size());
		System.out.println("파일의 갯수 : " +fileList.size());

		int pnum = service.write(pboardVO); // DB에 insert 실행 , pnum은 해당 개시글의 pno

		for (int i = 0; i < fileList.size(); i++) {
			int ftotal = i + 1;
			Map<String, String> fileMap = new HashMap<>();
			fileMap.put("fno", String.valueOf(ftotal)); // 게시글 내부에서 파일의 넘버 전달 
			fileMap.put("filePath", "/tomcatImg/"+ (String) fileList.get(i)); // 파일의 경로 저장
			fileMap.put("pno", String.valueOf(pnum)); // 게시글 넘버 저장
			service.fileSave(fileMap); // 파일 저장
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("result");

		return "redirect:/product/list";
	}

	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteriapro scri ,HttpServletRequest req ,HttpServletResponse res) throws Exception {

		
		logger.info("product_ list");
		
		model.addAttribute("list", service.list(scri)); // 전체 게시글 조회
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "product/list";
	}

	// 게시판 글조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(PBoardVO pboardVO, @ModelAttribute("scri") SearchCriteriapro scri, Model model,HttpServletRequest req ,HttpServletResponse res)
			throws Exception {

	 
	
		System.out.println(   );
		PBoardVO read = service.read(pboardVO.getPno());
		//게시글정보 조회 > model에 담음
		model.addAttribute("read", read);
		
		//사진 정보 저장하기 
		model.addAttribute("filelist",service.filelist(read.getPno()));
		

		
		model.addAttribute("similar", service.read(pboardVO.getPno()).getP_type()); // 유사제품 리스트 6개담음 5개뽑아쓰기

		return "product/readView";
	}

	// 이미지 저장

	@RequestMapping(value = "/form")
	public String form() {
		return "uploadForm";
	}

	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {

			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
			}
		}
		return fileList;
	}

}
