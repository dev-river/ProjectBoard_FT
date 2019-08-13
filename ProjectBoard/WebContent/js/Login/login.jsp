<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="login">
		<h2 align="center"><a href="/ProjectBoard/Main.do">로그인 창</a></h2>
		<form action="loginAction.do" name="f" onsubmit="return login()" method="post">
			<input id="id" name="id" placeholder="아이디" style="width: 100%; height: 30px;"><br> 
			<input id="pw" name="pw" placeholder="비밀번호" style="width: 100%; height: 30px;"><br>
			<input style="width: 100%; height: 30px;" type="submit" value="로그인">
		</form>
		<div class="login_ground">
			<a href="#" onclick="javascript:sing()">회원가입</a>
			<a href="#" onclick="javascript:find()">아이디/비밀번호 찾기</a>
		</div>
	</div>
<script type="text/javascript">
	function login(){
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		if(!f.id.value){
			alert("아이디 입력 안하셨습니다.");
			f.id.focus();
			return false;
			
		}else if(!f.pw.value){
			alert("비밀번호 입력 안하셨습니다.");
			f.pw.focus();
			return false;
		}
	}

	function sing(){
		window.open("/ProjectBoard/singui.do","","width=600px height=500px");	
	}
	
	function find(){
		window.open("/ProjectBoard/idpwui.do","","width=600px height=500px");
	}
	

</script>
</body>
</html>