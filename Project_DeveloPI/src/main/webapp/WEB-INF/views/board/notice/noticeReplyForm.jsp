<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
					<h2 class="product-title">Notice</h2>
					<ol class="breadcrumb">
						<li><a href="#"><i class="ti-home"></i> Home</a></li>
						<li><a href="#">Board</a></li>
						<li class="current">Notice</li>
						<li class="current">Reply</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Page Header End -->

<form role="form" id="form">
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
						<td colspan="5" align="center">
							[ ${article.groupNo}번 글의 답글 ]
						</td>
					</tr>
					<tr>
						<th style="vertical-align: inherit;">TITLE</th>
						<td colspan="4"><input class="form-control" type="text"
							name="title" id="title" value="${article.title}"
							style="width: 100%;" /></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="5"><textarea class="form-control" name="content" 
								rows="10" id="content" >${article.content}</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="pull-left">
				<a class="btn btn-common btn-rm"
					href="/board/notice/noticeDetail?articleNo=${article.articleNo}">취소</a>
			</div>
			<div class="pull-right">
				<a class="btn btn-common btn-rm registBtn">답글달기</a>
			</div>
		</div>
	</div>
	<input type="hidden" name="boardNo" id="boardNo" value="${article.boardNo}">
	<input type="hidden" name="step" id="step" value="${article.step}">
	<input type="hidden" name="indent" id="indent" value="${article.indent}">
	<input type="hidden" name="userNo" id="userNo" value="${article.userNo}">
	<input type="hidden" name="groupNo" id="groupNo" value="${article.groupNo}">
	<input type="hidden" id="categoryNo" name="categoryNo" value="${article.categoryNo}"/>
	
</form>
<script>
	$(".dropdown-menu li a").click(
			function() {
				$(this).parents(".dropdown").find('.btn').html(
						$(this).text() + ' <span class="caret"></span>');
				$(this).parents(".dropdown").find('.btn').val(
						$(this).data('value'));
			});

	$('.registBtn').on('click', (function() {
		var categoryNo = $("#categoryValue").val();
// 		$("#categoryNo").val(categoryNo);
// 		console.log("title: " + $("#title").val()
// 				+ ", content: " + $("#content1").val()
// 				+ ", articleNo: " + $("#articleNo").val()
// 				+ ", userNo: " + $("#userNo").val()
// 				+ ", groupNo: " + $("#groupNo").val()
// 				+ ", step: " + $("#step").val()
// 				+ ", indent: " + $("#indent").val());
		var formObj = $("#form");
		formObj.attr("action", "/board/notice/replyArticle");
		formObj.attr("method", "post");
		formObj.submit();
	}));
</script>