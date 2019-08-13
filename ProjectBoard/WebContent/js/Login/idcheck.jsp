<%@page import="persistence.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
%>
<h3>아이디 중복검색</h3>
	<label for="id">아이디</label>
	<input id="id" name="id" value="<%=id%>">
	<input type="button" value="확인" onclick="check()">
<script type="text/javascript">
	function check(){ /* 아이디 중복 스크립트 */
<%
		MemberDAO dao = new MemberDAO();
		boolean check = dao.idcheck(id);
		if(check){
%>
		opener.document.getElementById('idcheck').innerHTML="해당 아이디는 가입 불가능";
		self.close();
<%
		} else {
%>
		opener.document.getElementById('idcheck').innerHTML="해당 아이디는 가입 가능";
		self.close();
<%
		}
%>
	}
</script>
</body>
</html>