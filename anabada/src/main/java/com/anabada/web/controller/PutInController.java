package com.anabada.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anabada.web.service.PutInService;
import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.PutInVO;
import com.anabada.web.vo.SearchCriteria;

@Controller
@RequestMapping("/putIn/*") 
public class PutInController {
	
	private static final Logger logger = LoggerFactory.getLogger(PutInController.class);
	
	@Inject
	PutInService putInService;
	
	// 알바구인 게시물보고 지원하기 눌렀을 때 실행
	@RequestMapping(value = "/putIn_job", method = RequestMethod.GET)
	public String putIn_job(@ModelAttribute JobVO vo, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest req, Model model) throws Exception{
		
		logger.info("지원하기 눌렀음");
		
		model.addAttribute("j_bno", vo.getJ_bno()); // 알바 구인게시물 번호 넘김
		model.addAttribute("scri", scri);
		
		// 임의로 알바 지원할 때 아이디 만든거!!!!!!
		HttpSession session = req.getSession();
		session.setAttribute("id", "part-timer");
		
		return "/putIn/putIn_job";
		
	}
		
	// 알바지원페이지 작성하고 지원하기 눌렀을 때 실행
	@RequestMapping(value = "/putIn_done", method = RequestMethod.GET)
	public String putIn_done(@ModelAttribute PutInVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		
		logger.info("지원서 다 썼음!");
		
		System.out.println(vo);
		
		model.addAttribute(model);
		model.addAttribute("scri", scri);
		
		putInService.putIn_job(vo);
					
		return "redirect:/job/job_list"; // 알바 게시판 컨트롤러로 이동
	}

}
