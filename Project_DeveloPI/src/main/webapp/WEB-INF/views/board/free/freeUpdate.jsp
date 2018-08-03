<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
   
<style>
/* 현재 위치 알려주는 헤더 */
.page-header {
   background-color: #b8b4b4;
   padding: 20px 0px;
   margin-bottom: 10px;
}

/* 테이블 행, 열 가운데 정렬 */
table.table-hover, thead tr th, td, th {
   text-align: center;
}

/* 폼 전체 크기 조정 */
div.panel-body {
   display: inline-block;
   width: 80%;
}

/* 입력폼 바닥 마진 없애기 */
.form-group {
   margin-bottom: 0px;
}
</style>

<!-- Page Header Start -->
<div class="page-header">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            <div class="breadcrumb-wrapper">
               <h2 class="product-title">Free</h2>
               <ol class="breadcrumb">
                  <li><a href="#"><i class="ti-home"></i> Home</a></li>
                  <li><a href="#">Board</a></li>
                  <li class="current">Free</li>
               </ol>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- Page Header End -->
<form name="form1" method="post" id="boardForm" action="/board/free/update">
<div class="container">
   <div class="form-body">
      <table class="table table-defualt table-hover">
         <colgroup>
            <col width="13%">
            <col width="7%">
            <col width="*">
            <col width="10">
            <col width="20%">
         </colgroup>         
         <thead>   
           <tr>
               <td colspan="2">
                  <div class="dropdown">
                     <button class="btn btn-common btn-rm dropdown-toggle"
                        type="button" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="true" style="width: 150px">
                        Category<span class="caret"></span>
                     </button>
                     <ul class="dropdown-menu" role="menu"
                        aria-labelledby="dropdownMenu">
                        <li><a tabindex="-1" href="#" data-value="5">자유</a></li>
                        <li><a tabindex="-1" href="#" data-value="6">건의사항</a></li>
                     </ul>
                     <input type="hidden" value="" name="category_no" id="category_no"/>
                  </div>
               </td>
               <td colspan="3"></td>
            </tr>
            <tr>
               <th style="vertical-align: inherit;">TITLE</th>
               <td colspan="4"><input class="form-control" type="text" value='${update.title}' id="title"
                  name='title' value="" style="width: 100%;" /><input type="hidden" value="3" name="board_no"/></td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td colspan="5"><textarea class="form-control" name="Content"
                     rows="10" id="Content">${update.content }</textarea><input type="hidden" value="${update.article_no}" name="article_no"/></td>
            </tr>
         </tbody>
      </table>
      <div class="pull-left">
         <a class="btn btn-common btn-rm" href="/board/free">목록</a>
      </div>
      <div class="pull-right">
         <a id="write"class="btn btn-common btn-rm" >수정하기</a>
      </div>
   </div>
</div>
</form>
<script>

$("#write").click(function(){
	var form = $("#boardForm");
	var a=document.getElementById("title").value;
	var ta=document.getElementById("Content");
	var ca=document.getElementById("category_no");
	if(a=="")
		alert("제목을 입력하시오!");
	else if(ta.value=='')
		alert("내용을 입력하시오!!");
	else if(ca.value=='')
		alert("카테고리를 선택하시오!!!");
	else
		form.submit();
});
$(".dropdown-menu li a").click(
        function() {
           $(this).parents(".dropdown").find('.btn').html(
                 $(this).text() + ' <span class="caret"></span>');
           $(this).parents(".dropdown").find('.btn').val(
                 $(this).data('value'));
          
          var c=document.getElementById("category_no");	
          c.setAttribute("value",$(this).data('value'));
       		
        });
</script>