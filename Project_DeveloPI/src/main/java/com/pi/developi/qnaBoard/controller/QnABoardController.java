package com.pi.developi.qnaBoard.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pi.developi.qnaBoard.domain.QnAArticleDTO;
import com.pi.developi.qnaBoard.domain.QnACategoryDTO;
import com.pi.developi.qnaBoard.domain.QnAUsersDTO;
import com.pi.developi.qnaBoard.service.QnABoardService;

@Controller
public class QnABoardController {

	@Inject
	private QnABoardService service;

	private static final Logger logger = LoggerFactory.getLogger(QnABoardController.class);

	@RequestMapping(value = "/board/qnaForm", method = RequestMethod.GET)
	public String qnaForm(Model model) {
		logger.info("qna 글쓰기 폼");

		return "board/qna/qnaForm";
	}

	@RequestMapping(value = "/board/qnaWrite", method = RequestMethod.POST)
	public String write(QnAArticleDTO dtos) {
		logger.info("Q&A게시판 글 작성");

		service.write(dtos);

		return "redirect:/board/qna";
	}

	@RequestMapping("/board/qnaDetail/{articleNo}")
	public String detail(Model model, @PathVariable int articleNo) {
		logger.info("Q&A게시판 글 상세보기");

		service.hit(articleNo);

		QnAArticleDTO dtos = service.getArticle(articleNo);
		model.addAttribute("articleDto", dtos);

		return "board/qna/qnaDetail";
	}

	@RequestMapping(value = "/board/delete/{articleNo}", method = RequestMethod.GET)
	public String delete(Model model, @PathVariable int articleNo) {
		logger.info("자유게시판");

		service.delete(articleNo);

		return "redirect:/board/qna";
	}

	@RequestMapping(value = "/board/updateView/{articleNo}", method = RequestMethod.GET)
	public String updateView(Model model, @PathVariable int articleNo) {
		logger.info("자유게시판");

		QnAArticleDTO dtos = service.getArticle(articleNo);
		model.addAttribute("articleDto", dtos);

		return "board/qna/qnaUpdate";
	}

	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(QnAArticleDTO dtos) {
		logger.info("Q&A게시판 글 작성");

		service.update(dtos);

		return "redirect:/board/qna";
	}

	@RequestMapping(value = "/board/search", method = RequestMethod.GET)
	public String Searchs(Model model, String searchOption, String keyword) {
		logger.info("검색");

		System.out.println(searchOption+"*");
		System.out.println(keyword+"*");
		
		List<QnAArticleDTO> list = service.listSearch(searchOption, keyword);
		List<QnAUsersDTO> name = new ArrayList<QnAUsersDTO>();
		List<QnACategoryDTO> category = new ArrayList<QnACategoryDTO>();
		
		
		for (QnAArticleDTO articleList : list) {
			name.add(service.getUser(articleList.getUser_no()));
			category.add(service.getCategory(articleList.getCategoty_no()));
		}

		model.addAttribute("li", list);
		model.addAttribute("name", name);
		model.addAttribute("category", category);

		return "board/qna/qna";
	}
}
