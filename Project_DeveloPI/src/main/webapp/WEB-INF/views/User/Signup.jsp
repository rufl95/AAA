<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<body style="background-color: white;">
	<form>
		<div class="container">
			<!-- 좌우측의 공간 확보 -->
			<div style="margin-top: 150px;">
				<!-- 본문 들어가는 부분 -->
				<div class="form-group" id="divId">
					<label for="inputId" class="col-lg-4 control-label"
						style="text-align: right">아이디</label>
					<div class="col-lg-8 form-inline">
						<input type="text" class="form-control onlyAlphabetAndNumber"
							id="id" data-rule-required="true"
							placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30"
							size="50">
					</div>
				</div>
				<div class="form-group" id="divPassword">
					<label for="inputPassword" class="col-lg-4 control-label"
						style="text-align: right; margin-top: 20px">패스워드</label>
					<div class="col-lg-8 form-inline" style="margin-top: 20px">
						<input type="password" class="form-control" id="password"
							name="excludeHangul" data-rule-required="true" placeholder="패스워드"
							maxlength="30" size="50">
					</div>
				</div>
				<div class="form-group" id="divPasswordCheck">
					<label for="inputPasswordCheck" class="col-lg-4 control-label"
						style="text-align: right; margin-top: 20px">패스워드 확인</label>
					<div class="col-lg-8 form-inline" style="margin-top: 20px">
						<input type="password" class="form-control" id="passwordCheck"
							data-rule-required="true" placeholder="패스워드 확인" maxlength="30"
							size="50">
					</div>
				</div>
				<div class="form-group" id="divName">
					<label for="inputName" class="col-lg-4 control-label"
						style="text-align: right; margin-top: 20px">이름</label>
					<div class="col-lg-8 form-inline" style="margin-top: 20px">
						<input type="text" class="form-control onlyHangul" id="name"
							data-rule-required="true" placeholder="한글만 입력 가능합니다."
							maxlength="15" size="50">
					</div>
				</div>
				<div class="form-group" id="divBirthday">
					<label for="inputName" class="col-lg-4 control-label"
						style="text-align: right; margin-top: 20px">생년월일</label>
					<div class="col-lg-8 form-inline" style="margin-top: 20px">
						<select name="Year" class="form-control">
							<%
								for (int i = 0; i < 30; i++) {
							%><option><%=1980 + i%></option>
							<%
								}
							%>
						</select> <select name="Month" class="form-control">
							<%
								for (int i = 1; i < 13; i++) {
							%><option><%=i + "월"%></option>
							<%
								}
							%>
						</select> <select name="Day" class="form-control">
							<%
								for (int i = 1; i < 32; i++) {
							%><option><%=i + "일"%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>

				<div class="form-group" id="divPhoneNumber">
					<label for="inputPhoneNumber" class="col-lg-4 control-label"
						style="text-align: right; margin-top: 20px">휴대폰 번호</label>
					<div class="col-lg-8 form-inline" style="margin-top: 20px">
						<input type="tel" class="form-control onlyNumber" id="phoneNumber"
							data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."
							maxlength="11" size="50">
					</div>
				</div>
				<div class="form-group" id="divQuestion">
					<label for="inputQuestion" class="col-lg-4 control-label"
						style="text-align: right; margin-top: 20px">비밀번호 찾기 질문</label>
					<div class="col-lg-8 form-inline" style="margin-top: 20px">
						<input type="text" class="form-control" id="Question"
							data-rule-required="true" placeholder="비밀번호 찾기 질문" maxlength="40"
							size="50">
					</div>
				</div>

				<div class="form-group" id="divAnswer">
					<label for="inputAnswer" class="col-lg-4 control-label"
						style="text-align: right; margin-top: 20px">비밀번호 찾기 답변</label>
					<div class="col-lg-8 form-inline" style="margin-top: 20px">
						<input type="text" class="form-control" id="Answer"
							data-rule-required="true" placeholder="비밀번호 찾기 답변" maxlength="40"
							size="50">
					</div>
				</div>
				<div class="form-group navbar-default main-navigation">
					<div class="col-lg-offset-2 col-lg-5">
						<div class="collapse navbar-collapse" id="navbar">
							<ul class="nav navbar-nav navbar-right float-right">
								<li><a href="Signin"> 회원가입</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-offset-5"></div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
