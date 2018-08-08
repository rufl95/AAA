package com.pi.developi.noticeBoard.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pi.developi.category.domain.CategoryDTO;
import com.pi.developi.category.service.CategoryService;
import com.pi.developi.noticeBoard.domain.NoticeBoardDTO;
import com.pi.developi.noticeBoard.domain.NoticeReplyDTO;
import com.pi.developi.noticeBoard.service.NoticeBoardService;
import com.pi.developi.user.domain.UserDTO;
import com.pi.developi.user.service.UserService;
import com.pi.developi.util.Criteria;

/**
 * Handles requests for the application home page.
 * 
 * @param <BoardService>
 */
@Controller
@RequestMapping("/board/notice")
public class NoticeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);

	@Inject
	private NoticeBoardService service;

	@Inject
	private UserService userService;
	
	@Inject
	private CategoryService categoryService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String noticeList(@RequestParam("boardNo") int boardNo, Model model) {
		logger.info("공지게시판");
		ArrayList<NoticeBoardDTO> list = (ArrayList<NoticeBoardDTO>) service.listAll(boardNo);
		ArrayList<UserDTO> userlist = new ArrayList<UserDTO>(list.size());
		ArrayList<String> categorylist = new ArrayList<String>(list.size());
		for (int i = 0; i < list.size(); i++) {
			userlist.add(userService.getId(list.get(i).getUserNo()));
			categorylist.add(categoryService.getName(list.get(i).getCategoryNo()));
		}
		model.addAttribute("userList", userlist);
		model.addAttribute("noticeList", list);
		model.addAttribute("categorylist", categorylist);

		return "board/notice/noticeList";
	}

	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String detail(@RequestParam("articleNo") int articleNo, Model model) {
		logger.info("Welcome noticeForm!");
		service.hitUp(articleNo);
		NoticeBoardDTO article = service.detail(articleNo);
		UserDTO user = userService.getId(article.getUserNo());
		String categoryName= categoryService.getName(article.getCategoryNo());

		ArrayList<NoticeReplyDTO> replyList = (ArrayList<NoticeReplyDTO>)service.replyListAll(articleNo);
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>(replyList.size());
		
		for (int i = 0; i < replyList.size(); i++) {
			logger.info(replyList.get(i).toString());
			userList.add(userService.getId(replyList.get(i).getUserNo()));
			logger.info(userList.get(i).toString());
		}
		int replyCount = replyList.size();
		
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("article", article);
		model.addAttribute("user", user);
		model.addAttribute("categoryName", categoryName);
		
		model.addAttribute("userList", userList);
		model.addAttribute("replyList", replyList);
		
		return "board/notice/noticeDetail";
	}

	@RequestMapping(value = "/noticeModifyForm", method = { RequestMethod.GET })
	public String modifyForm(@RequestParam("articleNo") int articleNo, Model model) {
		logger.info("와따 수정하기페이지~");
		NoticeBoardDTO article = service.detail(articleNo);
		String categoryName= categoryService.getName(article.getCategoryNo());

		model.addAttribute("categoryName", categoryName);
		model.addAttribute("article", article);
		logger.info(article.toString());
		
		return "board/notice/noticeModify";
	}

	@RequestMapping(value = "/noticeModify", method = { RequestMethod.POST })
	public String modify(int articleNo, int categoryNo, String content, RedirectAttributes rttr) {
		logger.info("왔다 수정하기 버튼 눌렀을때!");
		NoticeBoardDTO article = service.detail(articleNo);
		article.setCategoryNo(categoryNo);
		article.setContent(content);
		service.modify(article);
		logger.info("수정끝!");

		return "redirect:/board/notice/?boardNo=2";
	}

	@RequestMapping(value = "/noticeForm", method = RequestMethod.GET)
	public String form(Model model) {
		logger.info("Welcome noticeForm!");
		return "board/notice/noticeForm";
	}

	@RequestMapping(value = "/replyArticleForm", method = { RequestMethod.GET })
	public String replyArticleForm(@RequestParam("articleNo") int articleNo, Model model) {
		logger.info("와따 답글 작성페이지");
		NoticeBoardDTO article = service.detail(articleNo);
		logger.info(article.toString());
		model.addAttribute("article", article);
		return "board/notice/noticeReplyForm";
	}
	
	@RequestMapping(value = "/replyArticle", method = { RequestMethod.POST })
	public String replyArticle(NoticeBoardDTO noticeBoard, RedirectAttributes rttr) {
		logger.info("들어왔다 답글쓰기 누른곳!!!");
		logger.info(noticeBoard.toString());
//		service.stepUp(noticeBoard);
//		noticeBoard.setStep(noticeBoard.getStep()+1);
//		noticeBoard.setIndent(noticeBoard.getIndent()+1);
//		service.write(noticeBoard);
//		logger.info("수정끝!");

		return "redirect:/board/notice/?boardNo=2";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeBoardDTO noticeBoard, Model model) {
		logger.info("글쓰기눌렀다!");
		logger.info(noticeBoard.toString());
		service.write(noticeBoard);
		return "redirect:/board/notice/?boardNo=2";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("articleNo") int articleNo, Model model) {
		logger.info("Welcome noticeForm!");
		logger.info(String.valueOf(articleNo));
		service.delete(articleNo);

		logger.info("삭제끝!!");
		return "redirect:/board/notice/?boardNo=2";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(@RequestParam("boardNo") int boardNo, @RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword, Model model) {
		logger.info("Welcome search!");
		Criteria cri = new Criteria();
		cri.setBoardNo(boardNo);
		cri.setSearchType(searchType);
		cri.setKeyword(keyword);

		ArrayList<NoticeBoardDTO> list;
		ArrayList<UserDTO> userlist;
		logger.info(cri.toString());

		if (searchType.equals("userId")) {
			System.out.println(userService.getNo(keyword));	
			int id = userService.getNo(keyword);
				cri.setSearchType("userNo");
				cri.setKeyword(String.valueOf(id));
				logger.info(String.valueOf(id));
			
		}
		list = (ArrayList<NoticeBoardDTO>) service.search(cri);

		userlist = new ArrayList<UserDTO>();
		
		for (int i = 0; i < list.size(); i++) {
			userlist.add(userService.getId(list.get(i).getUserNo()));
		}
		
		model.addAttribute("userList", userlist);
		model.addAttribute("noticeList", list);
		model.addAttribute("boardNo", boardNo);
		
		return "board/notice/noticeList";
	}
	
	@RequestMapping(value = "/replyRegist", method = RequestMethod.POST)
	public String replyRegist(NoticeReplyDTO reply, Model model) {
		logger.info("댓글등록 컨트롤러 입성!");
		logger.info(reply.toString());
		service.replyRegist(reply);
		return "redirect:noticeDetail/?articleNo="+reply.getArticleNo();
	}
}