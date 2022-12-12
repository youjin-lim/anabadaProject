package com.anabada.web.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.JobService;
import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.PageMaker;
import com.anabada.web.vo.SearchCriteria;

@Controller
@RequestMapping("/job/*") 
public class JobController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobController.class);
	
	@Inject
	JobService jobService;
	
	// 알바 구인 게시물 쓰기 눌렀을 때
	@RequestMapping(value = "/writeView_boss", method = RequestMethod.GET)
	public String write_boass_view(HttpServletRequest req) throws Exception{ // 임의로 내가 아이디줬음
		
		logger.info("write_boss_view");
		
		
		HttpSession session = req.getSession(); // HttpServletRequest는 HttpSession 객체 만드는데 필요
		// MemberVO login = service.login(vo); // 로그인한 회원 객체 반환
		session.setAttribute("id", "korea"); // 아이디를 세션으로
		// 세션 지금 임의로 저장한거!!!!!!나중에 수정하기!!!!!
		
		return "/job/write_boss";
	}
	
	// 알바 구인 게시글 등록하기
	@RequestMapping(value = "/write_boss", method = RequestMethod.POST)
	public String write_boss(@ModelAttribute JobVO vo) throws Exception{
		
		logger.info("write_boss");
		
		System.out.println(vo.getJ_uploadImg()); // 저장한 파일 해쉬코드나옴
		MultipartFile uploadImg = vo.getJ_uploadImg(); // 업로드한 이미지 불러옴. 이미지 선택안해도 아래와 같이 저장됨
		// org.springframework.web.multipart.commons.CommonsMultipartFile@70f4eb58
		
		String imgName = uploadImg.getOriginalFilename(); // 이미지이름 추출
		
		if(imgName.lastIndexOf(".") > 0) { // 이미지 선택했다면 확장자때문에 .가 존재. 여기서 이미지 존재하지는 여부 확인
			String imgExtension = imgName.substring(imgName.lastIndexOf("."),imgName.length());// 확장자 추출
			
			String uploadFolder = "C:\\upload"; // 업로드할 폴더 경로

			/*
			파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		    업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
			타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
			고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
			*/
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			
			
			String uniqueName = uuids[0];
			System.out.println("생성된 고유문자열: " + uniqueName + ", 확장자명: " + imgExtension);
			uploadImg.transferTo(new File(uploadFolder+"\\"+uniqueName + imgExtension)); // 해당 경로에 폴더 업로드
			vo.setJ_img(uniqueName + imgExtension); // 빈에 이미지 이름 저장
		}
		
		System.out.println(vo);
		jobService.write_boss(vo);
		
		return "redirect:/job/job_list"; // 알바 게시판 조회 컨트롤러로 이동
	}
	
	
	// 알바 게시판
	@RequestMapping(value = "/job_list", method = RequestMethod.GET) // 임의
	public String job_list(Model model, @ModelAttribute JobVO vo, HttpServletRequest request, @ModelAttribute("scri")SearchCriteria scri) throws Exception{
		// @ModelAttribute로 SearchCriteria scri 객체를 생성해서 뷰에서 값을 받고, 넘길 수 있다.
		
		logger.info("게시판 보기 눌렀음");
		
		model.addAttribute("j_list", jobService.job_list(scri));// 한 페이지에 출력될 게시물 객체들(단어 검색했을 때도 포함)
		System.out.println("알바 게시판:" + jobService.job_list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		// setCri(scri)로 목록뷰가 로딩될때마다(검색이나 페이징 등)url값이 넘어오면 페이지가 바뀌어도 그 값이 계속 유지될 수 있다.
		pageMaker.setTotalCount(jobService.job_listCount(scri)); // 게시글 총 개수 받아서 페이징 처리함
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/job/job_list";
	}
	
	// 알바 구인 게시물 상세보기 페이지로 가는거
	@RequestMapping(value = "/job_readView", method = RequestMethod.GET) // job_list.jsp에서 사진 눌러서 상세보기할 때 실행
	public String job_readView(JobVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpServletRequest req) throws Exception{
		// ex) job_list.jsp의 a 태그에 적었던 파라미터 값들이 scri(page, perPageNum, j_term 등), model(j_bno) 저장됨(setter)
		
		logger.info("상세보기 페이지~");
		
		System.out.println("번호: " + vo.getJ_bno());
		
		model.addAttribute("j_read", jobService.job_view(vo.getJ_bno())); // 게시글 번호로 게시글 객체 불러옴
		model.addAttribute("scri", scri);
		System.out.println("상세보기 게시물:" + jobService.job_view(vo.getJ_bno()));
		
		// 임의
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("세션에 저장된 id:" + id);
		
		return "/job/job_read";
	}
	
	// 알바 수정 게시물 페이지로 가는거
	@RequestMapping(value = "/updateView_boss", method = RequestMethod.GET)
	public String updateView_boss(JobVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		
		logger.info("사장이 수정하려고함~~");
		
		model.addAttribute("j_update", jobService.job_view(vo.getJ_bno()));
		model.addAttribute("scri", scri);
		
		return "/job/update_boss"; // 수정 페이지로 이동
	}
	
	// 알바 게시글 수정게시글에서 수정 버튼 눌렀을 때 실행
	@RequestMapping(value = "/update_boss", method = RequestMethod.POST)
	public String update_boss(JobVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		
		logger.info("수정완료 버튼 눌렀음");
		
		System.out.println(vo);
		
		jobService.update_boss(vo);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNUm", scri.getPerPageNum());
		rttr.addAttribute("term", scri.getJ_term());
		rttr.addAttribute("addr1", scri.getJ_addr1());
		rttr.addAttribute("cate", scri.getJ_cate());
		rttr.addAttribute("method", scri.getJ_method()); // 이거는 빼고 다른 걸로 바꿀거같음 수정!!!!
		
		return "redircet:/job/job_list"; // 컨트롤러로 이동
		// 게시물 수정하기 전 검색이나 페이징 등이 유지되어야 하기 때문에 /job_list 컨트롤러로 이동
	}
	
	// 알바 구인 게시물 삭제할 떄
	@RequestMapping(value = "/delete_boss", method = RequestMethod.POST)
	public String delete_boss(@ModelAttribute JobVO vo) throws Exception{
		
		logger.info("사장이 삭제버튼 눌렀음"); 
		// 페이징 처리 안해줬음 
		
		jobService.delete_boss(vo.getJ_bno()); 
		return "redirect:/job/job_list"; // 임의
		// 게시판 기본 상태로 돌아감
	}
	
	
}
