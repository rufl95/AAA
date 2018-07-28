<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<<meta charset="utf-8">
<title>Signup</title>
</head>
<body background="#FFFFFF">
	<div class="container">
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-6">
				<br><br><br>
					<h2 >회원가입</h2>
					<br>
					<form class="form-inline">
						<table>
							<tr>
								<td>아이디: </td><td><input type="text" name="ID"  ></td>
							</tr>
							<tr>
								<td>비밀번호: </td><td><input type="password" name="password"></td>
							</tr>
							<tr>
								<td>이름: </td><td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td>생년월일: </td>
								<td class="form-group">
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
									<select name="Question" > 
										<option value="Q1">자신의 보물 1호는?</option>
										<option value="Q2">가장 기억에 남는 선생님 성함은?</option>
										<option value="Q3">인상 깊게 읽은 책 이름은?</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>암호 재발급 답변: &nbsp;&nbsp;&nbsp;</td><td><input type="text" name="Answer" ></td>
							</tr>
						</table>
						<br>
						<input type="submit" value="회원가입" class="btn btn-default btn-sm">
					</form>
					</div>
			</div>
	</div>
</body>
</html>