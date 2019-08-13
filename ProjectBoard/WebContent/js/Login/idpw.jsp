<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<input type="radio" name="find" id="id" onclick="search_check(1)" checked><label for="id">아이디 찾기</label>
<input type="radio" name="find" id="pw" onclick="search_check(2)"><label for="pw">비밀번호 찾기</label>
<div id="search_id"><!-- 아이디 찾기 -->
	<form action="/ProjectBoard/idsearch.do" method="post">
		<label for="name">이름</label>
		<input id="name" name="name"><br>
		<label for="birth">생년월일</label>
		<input id="birth" name="birth1" maxlength="6" placeholder="생년월일 6자리">-<input id="birth" name="birth2" maxlength="1" placeholder="앞자리 1자리"><br>
		<button class="btn">찾기</button>
		<button class="btn" onclick="self.close();">닫기</button>
	</form>
</div>
<div id="search_pw" style="display: none;"> <!-- 비밀번호 찾기 -->
	<form action="/ProjectBoard/pwsearch.do" method="post">
		<label for="id">아이디</label>
		<input id="id" name="id" placeholder="아이디 입력"><br>
		<label for="email">이메일</label>
		<input id="email" name="email" placeholder="이메일 입력">
		<input type="submit" value="찾기">
		<button class="btn" onclick="self.close();">닫기</button>
	</form>
</div>
<script type="text/javascript">
	function search_check(num){ /*  */
		if(num == '1'){
			document.getElementById("search_id").style.display="";
			document.getElementById("search_pw").style.display="none";
		} else{
			document.getElementById("search_id").style.display="none";
			document.getElementById("search_pw").style.display="";
		}
	}
</script>
</body>
</html>