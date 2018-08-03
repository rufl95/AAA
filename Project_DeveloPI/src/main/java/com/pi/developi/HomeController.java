package com.pi.developi;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! ", locale);
		System.out.println("홈이다아아아아아아ㅏ");
		
		
		return "index";
	}
	@RequestMapping(value = "/about/about", method = RequestMethod.GET)
	public String about(Model model) {
		logger.info("어바웃");
		
		return "about/about";
	}
	@RequestMapping(value = "/board/qna", method = RequestMethod.GET)
	public String qna(Model model) {
		logger.info("Q&A게시판");
		
		return "board/qna/qna";
	}	
	
	@RequestMapping(value = "/board/free", method = RequestMethod.GET)
	public String free(Model model) {
		logger.info("자유게시판");
		
		return "board/free/free";
	}
	
	/** 맵핑할때 
	 * /qna/qnaForm 
	 * /board/free/freeForm 
	 *  이런식으로 하기 
	 *  notice랑 free는 board안에 있으니까 앞에 /board라는 경로 추가
	 *  이 주석 밑으로는 각자 컨트롤러에 맵핑해야함*/
	
	@RequestMapping(value = "/board/qnaForm", method = RequestMethod.GET)
	public String qnaForm(Model model) {
		logger.info("자유게시판");
		
		return "board/qna/qnaForm";
	}
	
	@RequestMapping(value = "/board/freeForm", method = RequestMethod.GET)
	public String freeForm(Model model) {
		logger.info("자유게시판");
		
		return "board/free/freeForm";
	}
}
