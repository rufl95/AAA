<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<meta charset="utf-8">

<!-- Bootstrap CSS -->
  <link href="resources/css/bootstrap.min.css" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="resources/css/bootstrap-theme.css" rel="stylesheet">
<title>Signup</title>
</head>
<body class="login-img3-body">
	<div class="container">
		<form>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-6">
				<div class="">
					<h2 >회원가입</h2>
					<br><hr/>
					<form>
						<table>
							<tr>
								<td>아이디: </td><td><input type="text" name="ID"></td>
							</tr>
							<tr>
								<td>비밀번호: </td><td><input type="password" name="password"></td>
							</tr>
							<tr>
								<td>이름: </td><td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>생년월일: </td>
								<td>
									<select name="Year">
										<%for(int i=0;i<30;i++){
											%><option><%=1980+i %></option>
											<%}
										%>
									</select>
									<select name="Month">
										<%for(int i=1;i<13;i++){
											%><option><%=i+"월"%></option>
											<%}
										%>
									</select>
									<select name="Day">
										<%for(int i=1;i<32;i++){
											%><option><%=i+"일"%></option>
											<%}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td>연락처: </td><td><input type="text" name="Mobile"></td>
							</tr>
							<tr>
								<td>암호 재발급 질문: </td>
								<td>
									<select name="Question"> 
										<option value="Q1">자신의 보물 1호는?</option>
										<option value="Q2">가장 기억에 남는 선생님 성함은?</option>
										<option value="Q3">인상 깊게 읽은 책 이름은?</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>암호 재발급 답변: </td><td><input type="text" name="Answer"></td>
							</tr>
						</table>
						<hr>
						<input type="submit" value="회원가입">
					</form>
					</div>
					<div col-md-4>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>