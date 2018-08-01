<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="m" uri="urlDecode"%> 

<header>
<!-- Header Section Start -->
      <div class="header">    
        <div class="logo-menu">
          <nav class="navbar navbar-default main-navigation" role="navigation" data-spy="affix" data-offset-top="50">
            <div class="container">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand logo" href="/"><img src="/resources/img/logo1.png" alt="" style="height: 70px;"></a>
              </div>

              <div class="collapse navbar-collapse" id="navbar">              
                 <!-- Start Navigation List -->
                <ul class="nav navbar-nav">
                  <li>
                    <a class="active" href="/">
                    Home 
                    </a>
                  </li>
                  <li>
                    <a href="/about/about">
                    About
                    </a>
                  </li>
                  <li>
                    <a href="/board/qna">
                    Q & A
                    </a>
                  </li>
                  <li>
                    <a href="#">
                    BOARD <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown">
                      <li>
                        <a href="/board/noticeList">
                       NOTICE
                        </a>
                      </li>
                      <li>
                        <a href="/board/free">
                       FREE
                        </a>
                      </li>
                    </ul>
                  </li>
                </ul>
                <ul class="nav navbar-nav navbar-right float-right">
                  <li class="left" style="padding-top: 10px;"> <span>로그인이 필요합니다. </span></li>
                  <li class="right"><a href="/User/Login"><i class="ti-lock"></i>  Log In</a></li>
                </ul>
              </div>
            </div>
            <!-- Mobile Menu Start -->
            <ul class="wpb-mobile-menu">
              <li>
                <a class="/active" href="/">Home</a>
              </li>
              <li>
                <a href="/about/about">About</a>
              </li>
              <li>
                <a href="/board/qna">Q & A</a>
              </li>
              <li>
                <a href="#">BOARD</a>
                <ul>
                  <li><a href="/board/noticeList">NOTICE</a></li>
                  <li><a href="/board/freeList">FREE</a></li>
                </ul>
              </li> 
              <li class="btn-m"><a href="/User/Login"><i class="ti-lock"></i>  Log In</a></li>          
            </ul>
            <!-- Mobile Menu End -->  
          </nav>
        </div>
      </div>
      <!-- Header Section End --> 
</header>
