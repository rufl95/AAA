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
					<h2 class="product-title">Notice</h2>
					<ol class="breadcrumb">
						<li><a href="#"><i class="ti-home"></i> Home</a></li>
						<li><a href="#">Board</a></li>
						<li class="current">Notice</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Page Header End -->
<form role="form" id="writeForm" action="/board/notice/white"
	method="POST">
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
									aria-expanded="true" style="width: 150px" id="categoryValue">
									Category<span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu"
									aria-labelledby="dropdownMenu">
									<li><a tabindex="-1" id="category" data-value="1">JAVA</a></li>
									<li><a tabindex="-1" id="category2" data-value="2">C</a></li>
								</ul>
							</div>
						</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<th style="vertical-align: inherit;">TITLE</th>
						<td colspan="4"><input class="form-control" type="text"
							name="title" id="title" value="" style="width: 100%;" />
							<input type="hidden" id="categoryNo" name="categoryNo"/></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="5"><textarea class="form-control" name="content"
								rows="10" id="content"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="pull-left">
				<a class="btn btn-common btn-rm" href="/board/notice">목록</a>
			</div>
			<div class="pull-right">
				<a class="btn btn-common btn-rm writeBtn">글쓰기</a>
			</div>
		</div>
	</div>
</form>
<script>
	$(".dropdown-menu li a").click(
			function() {
				$(this).parents(".dropdown").find('.btn').html(
						$(this).text() + ' <span class="caret"></span>');
				$(this).parents(".dropdown").find('.btn').val(
						$(this).data('value'));
			});

	$('.writeBtn').on('click', (function() {
		var category = $("#categoryValue").text();
		var categoryNo = $("#categoryValue").val();
		$("#categoryNo").val(categoryNo);
		var formObj = $("#writeForm");
		formObj.attr("action", "/board/notice/write");
		formObj.attr("method", "post");
		formObj.submit();
	}));
</script>