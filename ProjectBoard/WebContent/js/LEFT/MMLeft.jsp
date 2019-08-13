<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="Left">
	<div id="LeftMenu" class="legacyLeftMenu">
		<c:if test="${empty dto}">
			<div id="leftLoginbox" class="Left_login_box">
				<a href="#" class="Login/login_box" onclick="javascript:login()">로그인</a>
				<ul class="btn_area">
					<li class="col_left"><a href="#" onclick="javascript:sing()">회원가입</a>
					</li>
					<li class="col_right"><a href="#" onclick="javascript:find()">아이디/비밀번호 찾기</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${!empty dto}">
			<c:if test="${dto.access == 1}">
				<div id="leftLoginbox" class="Left_login_box">
					<span id="nick">닉네임 :</span>${dto.nickname}
					<ul class="btn_area">
						<li>
							<a href="#" onclick="javascript:info()">내 정보</a>
						</li>
						<li>
							<a href="#" onclick="javascript:note()">쪽지함</a>
						</li>
						<li>
							<a href="/ProjectBoard/logout.do">로그아웃</a>
						</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${dto.access == 2}">
				<div id="leftLoginbox" class="Left_login_box">	
					<ul class="btn_area">
						<li>
							<a href="#">개인정보 수정</a>
						</li>
						<li class="col_right">
							<a href="/ProjectBoard/logout.do">로그아웃</a>
						</li>
					</ul>
				</div>
			</c:if>
		</c:if>
		
		<div class="menu_area commonColorMark">
			<h3 class="menu_title">공지사항</h3>
			<ul class="list">
				<li class="firstMenuItem"><span> <a href="#">트럭 MAP</a>
				</span></li>
				<li><span> <a href="#"> <span>이벤트 / 행사</span>
					</a>
				</span></li>
				<li><span> <a href="#"> <span>관련뉴스</span>
					</a>
				</span></li>
				<li><span> <a href="#"> <span>유튜브</span>
					</a>
				</span></li>
			</ul>
			<h3 class="menu_title">커뮤니티</h3>
			<ul class="list">
				<li class="firstMenuItem"><span> <a href="#">자유게시판</a>
				</span></li>
				<li><span> <a href="#">트럭 리뷰</a>
				</span></li>
				<li><span> <a href="#">질문과 답변</a>
				</span></li>
				<li><span><a href="#">갤러리</a></span></li>
				<li><span> <a href="#">트럭 홍보</a>
				</span></li>
			</ul>
			<h3 class="menu_title">서비스</h3>
			<ul class="list">
				<li class="firstMenuItem"><span> <a href="#">건의</a>
				</span></li>
				<li><span> <a href="#">문의</a>
				</span></li>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">
	function sing(){
		window.open("singui.do","","width=600px height=500px");
	}
	
	function find(){
		window.open("idpwui.do","","width=600px height=500px");
	}
	
	function note(){
		window.open("noteui.do","","width=600px height=500px");
	}
	
	function info(){
		window.open("infoui.do","","width=600px height=500px");
	}
	
	function login(){
		location.href="loginui.do";
	}
</script>