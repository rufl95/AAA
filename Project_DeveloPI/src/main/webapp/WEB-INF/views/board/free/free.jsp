<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="bootstrap-grid.css">
<link rel="stylesheet" href="bootstrap-grid.min.css">
<link rel="stylesheet" href="bootstrap-reboot.css">
<link rel="stylesheet" href="bootstrap-reboot.min.css">
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="bootstrap.techie.css">
<title>Insert title here</title>
</head>
<body>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container">
		<table class="table table-defualt table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">이름</th>
					<th scope="col">내용</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>1</td>
					<td>이겨레</td>
					<td>메인</td>
					<td>2018-07-28</td>
					<td>20</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>2</td>
					<td>김동진</td>
					<td>로그인</td>
					<td>2018-07-28</td>
					<td>30</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>3</td>
					<td>곽우현</td>
					<td>게시판</td>
					<td>2018-07-28</td>
					<td>15</td>
				</tr>

			</tbody>
		</table>


		<div class="pull-right">
			<a class="btn btn-primary" href="/board/freeForm">글쓰기</a>
		</div>
		<br> <br>
		<div class="text-center">
			<ul class="pagination pagination-sm">
				<li><a href="#"> « </a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li class="disabled"><a href="#">»</a></li>
			</ul>
		</div>
	</div>
</body>
</html>