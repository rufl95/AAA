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
					<h2 class="product-title">Q & A</h2>
					<ol class="breadcrumb">
						<li><a href="#"><i class="ti-home"></i> Home</a></li>
						<li><a href="#">Board</a></li>
						<li class="current">Q & A</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Page Header End -->

<div class="container">
	<form action=/board/qnaWrite method="post"
		encType="multiplart/form-data" name="fr" onsubmit="return check()">
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
									<li><a tabindex="-1" href="#" data-value="1">JAVA</a></li>
									<li><a tabindex="-1" href="#" data-value="2">C</a></li>
									<li><a tabindex="-1" href="#" data-value="3">PYTHON</a></li>
								</ul>
							</div>
						</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<th style="vertical-align: inherit;">TITLE</th>
						<td colspan="4"><input class="form-control" type="text"
							name='title' value="" style="width: 100%;" /></td>
					</tr>
				</thead>
				<tbody>
					<input type="hidden" value="" id="categoty_no" name="categoty_no">
					<tr>
						<td colspan="5"><textarea class="form-control" name="content"
								rows="10" id="content"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="pull-left">
				<a class="btn btn-common btn-rm" href="/board/qna">목록</a>
			</div>
			<div class="pull-right">
				<input type="submit" class="btn btn-common btn-rm" value="글쓰기">
			</div>

		</div>
	</form>
</div>

<script>
	$(".dropdown-menu li a").click(
			function() {
				$(this).parents(".dropdown").find('.btn').html(
						$(this).text() + ' <span class="caret"></span>');
				$(this).parents(".dropdown").find('.btn').val(
						$(this).data('value'));
				$('#categoty_no').val($(this).data('value'));
			});

	function check() {

		if (fr.title.value == "") {

			alert("제목을 입력해 주세요.");

			return false;

		}

		else if (fr.content.value == "") {

			alert("내용을 입력해 주세요.");

			return false;

		}
		else if (fr.categoty_no.value == "") {

			alert("카테고리를 지정해 주세요.");

			return false;

		}
		else
			return true;

	}
</script>