package com.pi.developi.user.controller;

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
@RequestMapping("/User")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String Login(Model model) {
		logger.info("로그인");

		return "User/Login";
	}

	@RequestMapping(value = "/Signup", method = RequestMethod.GET)
	public String Signup(Model model) {
		logger.info("회원가입");

		return "User/Signup";
	}
}
