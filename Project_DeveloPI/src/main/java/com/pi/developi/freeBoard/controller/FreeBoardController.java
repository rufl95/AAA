package com.pi.developi.freeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pi.developi.category.service.CategoryService;
import com.pi.developi.freeBoard.domain.FreeArticleDTO;
import com.pi.developi.freeBoard.domain.FreeReplyDTO;
import com.pi.developi.freeBoard.service.FreeBoardService;

@Controller
@RequestMapping(value = "/board/free")
public class FreeBoardController {
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Inject
	FreeBoardService freeBoardService;
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping(value= "")
	public ModelAndView list(@RequestParam int pageNum,@RequestParam String searchType,@RequestParam String keyword,@RequestParam int isSearch) throws Exception{
		logger.info("자유게시판 list");
		int start=(pageNum-1)*10+1;
		int end=pageNum*10;
		int allPage,allArticle,startPage,endPage;
		List<FreeArticleDTO> list;
		List<Integer> replyNum;
		Map<String, Object> info=new HashMap<>();
		info.put("start", start);
		info.put("end", end);
		if(isSearch==0) {
			list=freeBoardService.listAll(info);
			List<String> user=freeBoardService.userId();
			replyNum=freeBoardService.replyNum(info);
			allArticle=freeBoardService.countArticle("t","");
		}
		else {
			list=freeBoardService.search(searchType,keyword,info);
			replyNum=freeBoardService.searchReplyNum(searchType,keyword,info);
			allArticle=freeBoardService.countArticle(searchType,keyword);
		}
		if(allArticle<10) {
			allPage=1;
		}else if(allArticle%10==0)
			allPage=allArticle/10;
		else
			allPage=allArticle/10+1;
		if(pageNum%5==0)
			startPage=pageNum/5*5-4;
		else
			startPage=pageNum/5*5+1;
		if(allPage<startPage+5)
			endPage=allPage;
		else
			endPage=startPage+4;
		
		Map<String,Object> pages=new HashMap<>();
		pages.put("allPage",allPage);
		pages.put("nowPage", pageNum);
		pages.put("start", startPage);
		pages.put("end", endPage);
		logger.info(startPage+""+pageNum);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/free/freeList");
		mav.addObject("list",list);
		mav.addObject("reply",replyNum);
		mav.addObject("pages",pages);
		mav.addObject("isSearch",isSearch);
		mav.addObject("searchType",searchType);
		mav.addObject("keyword",keyword);
		return mav;
	}
	
	@RequestMapping(value= "/freeDetail",method = RequestMethod.GET)
	public ModelAndView Detail(@RequestParam int article_no,@RequestParam int pageNum,HttpSession session) throws Exception{
		logger.info("자유게시판 Detail");
		freeBoardService.upHit(article_no, session);
		FreeArticleDTO Detail=freeBoardService.detail(article_no);
		String category=categoryService.getName(Detail.getCategory_no());
		String user=freeBoardService.detailId(article_no);
		List<FreeReplyDTO> reply=freeBoardService.replyList(article_no);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/free/freeDetail");
		mav.addObject("detail",Detail);
		mav.addObject("user",user);
		mav.addObject("reply",reply);
		mav.addObject("category",category);
		mav.addObject("nowPage",pageNum);
		return mav;
	}
	
	@RequestMapping(value= "/freeForm",method = RequestMethod.GET)
	public ModelAndView WriteForm(@RequestParam int board_no ,@RequestParam int pageNum) throws Exception{
		logger.info("자유게시판 Form");
		List<String> Category=freeBoardService.listCategory(board_no);
		logger.info(Category.get(0));
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/free/freeForm");
		mav.addObject("detail",Category);
		mav.addObject("nowPage",pageNum);
		return mav;
	}
	
	@RequestMapping(value= "/write",method = RequestMethod.POST)
	public String Write(@ModelAttribute FreeArticleDTO dto) throws Exception{
		
		logger.info("자유게시판 글 작성");
		freeBoardService.write(dto);
		logger.info("작성완료");
		return "redirect: /board/free?pageNum=1&searchType=t&keyword=''&isSearch=0";
	}
	
	@RequestMapping(value= "/updateForm",method = RequestMethod.GET)
	public ModelAndView Update(@RequestParam int no,@RequestParam String title,@RequestParam String content,@RequestParam int pageNum)  throws Exception{
		logger.info("업데이트 Form");
		FreeArticleDTO dto=new FreeArticleDTO();
		dto.setArticle_no(no);
		dto.setTitle(title);
		dto.setContent(content);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/free/freeUpdate");
		mav.addObject("dto",dto);
		mav.addObject("nowPage",pageNum);
		return mav;
	}
	
	@RequestMapping(value= "/update",method = RequestMethod.GET)
	public String Update(@ModelAttribute FreeArticleDTO dto,@RequestParam int pageNum) throws Exception{
		logger.info("게시글 수정");
		freeBoardService.update(dto);
		logger.info("수정완료");
		return "redirect: /board/free?pageNum="+pageNum+"&searchType=t&keyword=''&isSearch=0";
	}
	
	@RequestMapping(value= "/delete",method = RequestMethod.GET)
	public String Delete(@RequestParam int no, @RequestParam int pageNum)  throws Exception{
		logger.info("게시글 삭제");
		freeBoardService.delete(no);
		
		return "redirect: /board/free?pageNum="+pageNum+"&searchType=t&keyword=''&isSearch=0";
	}
	
	/*@RequestMapping(value= "/search",method = RequestMethod.POST)
	public ModelAndView Search(HttpServletRequest req)  throws Exception{
		logger.info("검색");
		List<FreeArticleDTO> list=freeBoardService.search(req.getParameter("searchType"),req.getParameter("keyword"));
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/free/freeList");
		mav.addObject("list",list);
		return mav;
	}*/
	
	@RequestMapping(value= "/replyWrite",method = RequestMethod.POST)
	public String replyWrite(@ModelAttribute FreeReplyDTO dto,@RequestParam int pageNum) throws Exception{
		logger.info("댓글 작성");
		freeBoardService.replyWrite(dto);
		logger.info("작성완료");
		return "redirect: /board/free/freeDetail?article_no="+dto.getArticle_no()+"&pageNum="+pageNum;
	}
	@RequestMapping(value= "/replyArticle",method = RequestMethod.GET)
	public ModelAndView replyArticle(@RequestParam String title, @RequestParam String content,@RequestParam int category_no,
			@RequestParam int article_no,@RequestParam int group_no,@RequestParam int step,@RequestParam int indent,@RequestParam int pageNum) throws Exception{
		logger.info("답글 작성 뷰");
		FreeArticleDTO dto=new FreeArticleDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCategory_no(category_no);
		dto.setArticle_no(article_no);
		dto.setGroup_no(group_no);
		dto.setStep(step);
		dto.setIndent(indent);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/free/freeReplyForm");
		mav.addObject("article",dto);
		mav.addObject("nowPage",pageNum);
		return mav;
	}
	
	@RequestMapping(value= "/replyArticleWrite",method = RequestMethod.POST)
	public String replyArticleWrite(@ModelAttribute FreeArticleDTO dto,@RequestParam int pageNum) throws Exception{
		logger.info("답글 작성");
		freeBoardService.indentUp(dto);
		freeBoardService.replyArticle(dto);
		logger.info("작성완료");
		return "redirect:/board/free?pageNum="+pageNum+"&searchType=t&keyword=''&isSearch=0";
	}
}
