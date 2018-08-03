package com.pi.developi;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.pi.developi.qnaBoard.domain.QnAArticleDTO;
import com.pi.developi.qnaBoard.domain.QnACategoryDTO;
import com.pi.developi.qnaBoard.domain.QnAUsersDTO;
import com.pi.developi.qnaBoard.service.QnABoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   @Inject
   private QnABoardService qnaService;
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

      List<QnAArticleDTO> list = qnaService.list();
      model.addAttribute("li", list);

      List<QnAUsersDTO> name = new ArrayList<QnAUsersDTO>();
      List<QnACategoryDTO> category = new ArrayList<QnACategoryDTO>();

      for (QnAArticleDTO articleList : list) {
         name.add(qnaService.getUser(articleList.getUser_no()));
         category.add(qnaService.getCategory(articleList.getCategoty_no()));
      }
      
      System.out.println(name.toString());
      System.out.println(category.toString());

      model.addAttribute("name", name);
      model.addAttribute("category", category);
      

      return "board/qna/qna";
   }
}