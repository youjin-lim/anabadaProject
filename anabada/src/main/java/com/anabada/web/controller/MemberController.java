package com.anabada.web.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.MemberService;
import com.anabada.web.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("회원가입 get ~ ");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("회원가입 post ~ ");
		service.register(vo);
		
		return "redirect:/";
	}
	
	// 로그인 get
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() throws Exception {
		logger.info("로그인 get ~ ");
	}
	
	// 로그인 post
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("로그인 post ~ ");
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			
		} else {
			session.setAttribute("member", login);
			logger.info("member: " +  login);
		}
		return "redirect:/";
	}
	
	// 회원 정보 수정 get
	@RequestMapping(value="/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception {
		logger.info("회원 정보 수정 get ~ ");
		return "member/memberUpdateView";
	}
	
	// 회원 정보 수정 post
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception {
		logger.info("회원 정보 수정 post ~ ");
		service.memberUpdate(vo);
		session.invalidate();
		return "redirect:/"; 
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
			
		return "redirect:/"; 
		}
}
