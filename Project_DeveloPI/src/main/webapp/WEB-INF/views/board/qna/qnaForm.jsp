<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Write something else you want</title>
<style>
a {
	margin-right: 10px;
	margin-top: 15px
}
</style>
</head>
<body>

	<div class="btn-group">
		<button class="btn btn-danger dropdown-toggle"
			style="margin-left: 1200px; margin-bottom: 10px;"
			data-toggle="dropdown">
			카테고리 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu",>
			<li><a href="">Action</a></li>
			<li><a href="">Another action</a></li>
			<li><a href="">Something else here</a></li>
			<li><a href="">Separated link</a></li>
		</ul>
	</div>
	<div class="container">
		<table class="table">
			<tbody>
				<form action="write_ok.jsp" method="post"
					encType="multiplart/form-data">
				<tr>
					<th>제목:</th>
					<td><div class="form-group has-error">
							<label class="control-label" for="inputError1"></label> <input
								type="text" class="form-control" id="inputError1">
						</div></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><div class="form-group has-error">
							<label class="control-label" for="inputError1"></label>
							<textarea class="form-control" id="inputError1" rows="4"></textarea></td>
					</div>
			</tbody>
			</tr>
			</tbody>
		</table>
		<div class="pull-right">
			<a class="btn btn-outline-danger" href="KwakBABO.jsp" >글쓰기</a>
		</div>
		<div class="pull-right">
			<a class="btn btn-outline-danger" href="#" >글수정</a>
		</div>
		<div class="pull-right">
			<a class="btn btn-outline-danger" href="#">글삭제</a>
		</div>

		<div class="pull-right">
			<a class="btn btn-outline-danger" href="#">리스트</a>
		</div>
		</form>
	</div>
</body>
</html>


