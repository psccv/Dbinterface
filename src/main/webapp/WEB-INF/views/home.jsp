<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<style type="text/css">
table {
	border: 1px solid black;
}

tr, th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<div class="card card-warning">
		<div class="col-12">
			<div class="card-header">
				<h3 class="card-title">회원등록</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<form role="form" action="/admin/member/create" method="post">
					<div class="row">
						<div class="col-sm-6">
							<!-- text input -->
							<div class="form-group">
								<label>아이디</label> <input name="userid" type="text" class="form-control"
									placeholder="아이디">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>패스워드</label> <input name="userpw" type="text" class="form-control"
									placeholder="패스워드">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>이름</label> <input name="username" type="text" class="form-control"
									placeholder="이름">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>이메일</label> <input name="email" type="text" class="form-control"
									placeholder="이메일">
							</div>
						</div>
						<button type="submit" class="btn btn-block btn-info btn-lg">회원등록</button>
					</div>
				</form>

			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.col-12 -->
	</div>
	<!-- /.card -->

	<table class="bbsListTbl" summary="회원정보 리스트">
		<caption class="hdd">회원정보 목록 : 제작자-${jspMaker}</caption>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">사용자 ID</th>
				<th scope="col">사용자 PW</th>
				<th scope="col">사용자 Name</th>
				<th scope="col">사용자 Email</th>
				<th scope="col">사용자 Regdate</th>
				<th scope="col">사용자 Update</th>
				<th scope="col">수정</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="memberVO" items="${memberList}" varStatus="number">
				<tr>
						<td>${number.count}</td>
						<form action="/admin/member/update" method="post">
						<td>
						${memberVO.userid}
						<input type="hidden" name="userid" value="${memberVO.userid}"></td>
						<td><input type="text" name="userpw" value="${memberVO.userpw}"></td>
						<td><input type="text" name="username" value="${memberVO.username}"></td>
						<td><input type="text" name="email" value="${memberVO.email}"></td>
						<td>${memberVO.regdate}</td>
						<td>${memberVO.updatedate}</td>
						<td><input type="submit" value="수정"></td>
						</form>
						<td>
						<form action="/admin/member/delete" method="post">
						<input type="hidden" value="${memberVO.userid}" name="userid" >
						<input type="submit" value="삭제">
						</form>
						</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>




</body>
</html>
