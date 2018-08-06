<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<style>
.page-header {
	background-color: #b8b4b4;
	padding: 20px 0px;
	margin-bottom: 10px;
}

.breadcrumb {
	margin-bottom: 0px;
}

/* 테이블 행, 열 가운데 정렬 */
table.table-hover, thead tr th {
	text-align: center;
}

.pagination-sm>li:first-child>a, .pagination-sm>li:last-child>a {
	border-radius: 50px;
}
</style>

<!-- Page Header Start -->
<div class="page-header"
	style="background-color: #b8b4b4; padding: 20px 0;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="breadcrumb-wrapper">
					<h2 class="product-title">Q & A - Detail</h2>
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
	<div class="pull-right">
		<a class="btn btn-common btn-rm" href="/board/qna">목록</a> <a
			class="btn btn-common btn-rm" id="modifyBnt"
			href="/board/updateView/${articleDto.article_no}">수정</a> <a
			class="btn btn-common btn-rm"
			href="/board/delete/${articleDto.article_no}">삭제</a>
	</div>
	<table class="table table-defualt table-hover">

		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="15%">
			<col width="10%">
			<col width="20%">
		</colgroup>
		<thead>
			<tr>
				<th>제목</th>
				<td colspan="5"><b>${articleDto.title }</b></td>
				<th>카테고리</th>
				<td><b>[${articleDto.category_name }]</b></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td style="text-align: left;">${articleDto.users_name}</td>
				<th>조회</th>
				<td style="text-align: left;">${articleDto.hit}</td>
				<th align="center" style="text-align: right;">작성일</th>
				<td colspan="1" style="text-align: left;"><fmt:formatDate
						pattern="yyyy-MM-dd HH:mm" value="${articleDto.a_date}" /></td>
				<td colspan="2"></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="table-content" colspan="8"><pre
						style="padding: 20 50px; text-align: left; background-color: white; height: 300px;">${articleDto.content}</pre></td>

			</tr>
			<tr>
				<td colspan="8" style="text-align: center;"><i
					class="fa fa-thumbs-o-up "></i> 우리 모두가 함께 만드는 소중한 공간입니다. 댓글은 신중히
					작성해주세요. <i class="fa fa-thumbs-o-up "></i></td>
			</tr>
			<form action=/board/reply method="post"
				encType="multiplart/form-data" name="fr" onsubmit="return check()">
				<tr>
					<td align=center>댓글</td>
					<td colspan="6"><input type="text" name="content"
						id="newReplyText" size="100" /></td>
					<td colspan="2" align=center><input type="hidden"
						name="article_no" value="${articleDto.article_no}" />
						<button type="submit" id="reply" name="reply"
							class="btn btn-common btn-rm" size="30"
							style="background-color: #ff4f578a; height: 30px; padding-top: 7px;">등록</button>
					</td>
				</tr>
			</form>
		</tbody>
		<tfoot id='replies'>
		</tfoot>
	</table>
</div>
<script>
	$(".dropdown-menu li a").click(
			function() {
				$(this).parents(".dropdown").find('.btn').html(
						$(this).text() + ' <span class="caret"></span>');
				$(this).parents(".dropdown").find('.btn').val(
						$(this).data('value'));
			});
</script>