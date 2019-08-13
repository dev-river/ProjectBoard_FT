<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
<%
	String num = request.getParameter("num");
%>
<form name="f" action="/ProjectBoard/join.do" method="post" onsubmit="return sing()">
<input type="hidden" name="num" value="<%=num%>">
<table>
	<thead>
		<tr>
			<th colspan="2">회원가입</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>이름</td>
			<td><input id="name" name="name" placeholder="이름을 입력하세요"></td>
		</tr>
		<tr>
			<td >아이디</td>
			<td><input id="id" name="id"> <input type="button" value="중복검사" onclick="idcheck()"> <label id="idcheck">테스트</label></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input id="nickname" name="nickname"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan="2"><input id="pw" name="pw"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input id="pwok" name="pwok" onkeyup="pwcheck()"> <label id="pwcheck"></label></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td colspan="2"><input id="birth1" name="birth1" maxlength="6" placeholder="주민번호 6자리 입력">-<input id="birth2" name="birth2" maxlength="1" placeholder="뒷자리 1자리"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input id="email" name="email" maxlength="30"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="3"><input id="address1" name="address1" readonly> <input id="address2" name="address2" placeholder="상세주소"> <input type="button" onclick="address()" value="주소검색"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input id="phone" name="phone" maxlength="11" placeholder="전화번호 11자리 입력"></td>
		</tr>
		<tr>
			<td></td>
			<td><div id="html_element"></div></td>
		</tr>
		<tr>
			<td><input type="submit" value="등록"></td>
			<td><input type="button" value="취소" onclick="cansel()"></td>
		</tr>
	</tbody>
</table>
</form>

<script type="text/javascript">
	function pwcheck(){ //비밀번호 확인 스크립트
		var pw = document.getElementById('pw');
		var pwok = document.getElementById('pwok');
		if(f.pw.value != f.pwok.value){
			document.getElementById('pwcheck').innerHTML = "비밀번호가 틀립니다";
		}else if(f.pw.value == f.pwok.value){
			document.getElementById('pwcheck').innerHTML = "비밀번호가 맞습니다";
		}
	}
	
	function address(){
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = data.address;
				document.getElementById("address1").value = addr;
			}
		}).open();
	}
	
	function sing(){ //회원 가입 공백 체크 스크립트
		var name = document.getElementById("name");
		var id = document.getElementById("id");
		var nickname = document.getElementById("nickname");
		var pw = document.getElementById("pw");
		var pwok = document.getElementById("pwok");
		var birth = document.getElementById("birth");
		var email = document.getElementById("email");
		var address = document.getElementById("address");
		var phone = document.getElementById("phone");
		if(!f.name.value || !f.id.value || !f.nickname.value || !f.pw.value || !f.pwok.value || !f.birth.value || !f.email.value || !f.email.value || !f.address.value || !f.phone.value){
			alert("입력 안 한 곳이 있습니다.");
			return false
		}
	}
	
	function idcheck(){ //아이디 중복체크 창
		var id = document.getElementById("id");
		window.open("./idcheck.jsp?id="+f.id.value,"","width=600, height=300");
	}
	function cansel(){ //창 닫기
		self.close();
	}
</script>
</body>
</html>