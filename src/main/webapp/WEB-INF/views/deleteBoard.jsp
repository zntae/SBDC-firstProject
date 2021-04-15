<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>인턴프로젝트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="FqXMAnwaMTsf5yfUvdmWufX8XqLazGL59qUM3IHfb0j1fWYCDNuv4bISmEPOR4/eBdk06e7VYJT12gH+EdiXwg==" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
h2 {
	color: #008080;
	text-align: center;
	margin: 10px 5px 30px;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 100%;
	margin: auto;
}

a {
	text-decoration: none;
}

input[type=button] {
	padding: 10px 25px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

/* outline 버튼 */
.info {
  border-color: #008080;
  color: #008080;
}

.info:hover {
  background: #008080;
  color: white;
}

body {
	font-family: arial;
}

.navbar-custom {
	background-color: white;
	border-bottom: thick double #8ca8ab;
	height: 100px;
}

.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: fixed;
	top: 6.3rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #ffffff;
	border-right: thick double #8ca8ab;
	overflow-y: auto;
	min-width: 160px;
	max-width: 290px;
}

.bd-sidebar .nav {
	display: block;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: 0.25rem 4.5rem;
	font-size: 90%;
}

.footer {
	width: 100%;
	height: 100px;
	position: absolute;
	bottom: 0;
	text-align: center;
	color: black;
}

div#head {
	position: absolute;
	left: 40%;
	top: 8%;
	color: #19555c;
}

div#user {
	position: absolute;
	color: teal;
	right: 3%;
	top: 40%;
	right: 3%;
}

ul#menu {
	position: absolute;
	top: 8%
}

.dropdown {
	background-color: white;
}

.dropdown-menu {
	color: white;
	border: thick double #8ca8ab;
	background-color: #ffffff;
}

.dropdown-menu li a {
	text-decoration: none;
	display: block;
	color: #000;
	padding: 8px 15px 8px 15px;
}

.dropdown-menu a:hover {
	color: #ffffff !important;
	background: teal;
	border-color: #42423e;
}

.cardwrapper {
	display: flex;
	position: relative;
	width: 70%;
	margin-left: 300px;
	padding: 6rem 1rem 3rem 12rem;
	justify-content: space-between;
}

.cardwrap {
	display: flex;
	width: 350px;
	height: 400px;
	flex-direction: column;
	box-shadow: 2px 2px 7px rgba(0, 0, 0, 0.15);
	border-radius: 2rem;
	cursor: pointer;
}

.boardwrap {
	width: 100%;
	/* height: auto; */
	height: 320px;
	display: flex;
	align-items: top;
	justify-content: center;
	background: #fffabf;
	/*border-bottom: solid 1px;*/
	border-radius: 0 0 1rem 1rem;
}

.boardwrap:hover {
	background-color: #ffffff;
	opacity: 0.5;
}

.textwrap {
	width: 100%;
	height: 5rem;
	display: flex;
	justify-content: space-around;
	background: #4e859c;
	border-radius: 1rem 1rem 0 0;
}

.left-text {
	text-align: center;
	font-size: large;
	display: flex;
	align-items: center;
	color: white;
}

.right-text {
	text-align: center;
	font-size: large;
	color: white;
	display: flex;
	align-items: center;
}

.table {
	width: 100% !important;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					
	function() {
						$("#writeBtn").click(function() {
							location.href = "write";
						})

						$("#restoreBtn").click(function() {
							location.href = "restore";
						})

						$
								.ajax({
									url : "boardList",
									success : function(result) {
										console.log(result);
										var html = "";
										result
												.forEach(function(item) {
													html += "<tr> <td><a href = 'view?idx="
															+ item.idx
															+ "'>"
															+ item.title
															+ "</a>"
															+ "<button type='button' class='btn btn-primary' style='float: right;' id = 'restoreBtn' onclick = 'location.href = 'view?idx='"
															+ item.idx
															+ "'>글복구</button></td> </tr>"
												})
										$("#listArea").append(html);
										$("#listArea1").append(html);
										$("#listArea2").append(html);
										$("#listArea3").append(html);
										$('#example').DataTable();
									}
								});
						$("#deleteBtn").click(function() {
							location.href = "delete";
						})

						$("#restoreBtn").click(function() {

							var deleteYN = confirm("삭제하시겠습니까?");
							if (deleteYN == true) {

								location.href = "restore";

							}

						})

					});
</script>

</head>
<body>
	<header class="navbar navbar-custom">
		<a class="navbar-brand" href="index">
			<div>
				<img class="sbdc" alt="SBDC" width="250" height="45"
					src="https://img.etnews.com/photonews/2012/1370528_20201230091413_961_0001.jpg">
			</div>
			<div id="head">
				<h3>
					<a href="index"
						style="font-weight: bold; font-size: 1.0em; line-height: 1.0em; color: #19555c">
						SBDC 21년도 게시판</a>
				</h3>
			</div>
			<div id="user">
				<h5>임시사용자</h5>
			</div>
		</a>

	</header>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav" id="menu">
					<li class="nav-item"><a class="nav-link" href="index"
						style="color: black; font-size: 20px;">홈</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="color: black; font-size: 20px;">게시판
					</a>
						<ul class="dropdown-menu">
							<li style="text-align: center"><a href="saveBoard"
								style="color: black">완료 게시판</a></li>
							<li style="text-align: center"><a href="tempBoard"
								style="color: black">임시저장 게시판</a></li>
							<li style="text-align: center"><a href="deleteBoard"
								style="color: black">삭제 게시판</a></li>
						</ul></li>
				</ul>
				<br>
			</div>
		</div>
	</div>



	<div class="container" style="margin-top: 30px">
		<div class="row">
			<div class="col-sm-12">
				<h2 >삭제된 게시물</h2>

				<div id="outter">

					<!-- 목록시작 -->

					<div class="card mb-12">
						<div class="card-header">
							<i class="fas fa-table mr-3"> 
							
							<!-- 검색 -->
								<div style="margin:10px 0 -10px" class="container">
									<div class="row">
										<div style="margin:0 1px" class="span2">
											<select class="form-control" name="searchType">
												<option value="t"
													<c:out value="${searchType eq 't' ? 'selected' : ''}"/>>제목</option>
												<option value="w"
													<c:out value="${searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											</select>
										</div>

										<div style="margin:0 5px" class="span8">
											<input type="text" class="form-control" name="keyword"
												id="keywordInput" value="${keyword}" />
										</div>

										<div class="span2">
											<button id="searchBtn" type="submit"
												class="btn btn-outline-info">검색</button>
										</div>
									</div>
								</div>
							</i>
						</div>
						<!-- 검색 끝-->


						<div class="card-body">
							<div class="table-responsive">

								<!-- 글갯수 옵션 -->
								<div style="float: right;">
									<select id="cntPerPage" name="sel" onchange="selChange()">
										<option value="5"
											<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
											보기</option>
										<option value="10"
											<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
											보기</option>
									</select>
								</div>
								<!-- 옵션선택 끝 -->

								<!-- 글목록 -->
								<!-- 테이블 디자인 클래스 적용 확인 class="table table-striped table-bordered" -->
								<table id="dataTable" border="1">
									<thead>
										<tr>
											<td>글번호</td>
											<td width="50%">제목</td>
											<td>작성자</td>
										<!-- 	<td>등록일</td>
											<td>조회수</td>
										 --></tr>
									<tbody>
										<%-- <c:if test="${status eq '삭제'}"> --%>
										<c:forEach items="${viewAll }" var="list">
											<tr>
												<td>${list.idx }</td>
												<td><a href='view?idx=${list.idx }'>${list.title }</a>

													<!-- 복구 버튼 --> <input type="button"
													class="btn btn-outline-info" id="restoreBtn" value="복구"
													style="float: right;" onclick="location.href='/restore'">
												</td>
												<td>${list.writer }</td>
												<%-- <td><fmt:formatDate value="${list.reg_date }"
														pattern="yyyy.MM.dd" /></td>
												 <td>${list.count }</td> --%>
											</tr>
										</c:forEach>
										<%-- </c:if> --%>
									</tbody>
								</table>
							
								
							</div>
						</div>
					</div>

					<!-- 글쓰기 버튼 -->
					<input type="button" class="btn btn-outline-info" id="writeBtn"
						value="글쓰기" style="float: right;" onclick="location.href='/write'"><br>

					<!-- 페이지네이션 -->
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="/boardPage?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="/boardPage?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/boardPage?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>


			</div>
		</div>
	</div>
	<footer class="footer">
		<p style="color: black; text-align: left;">
		<div
			style="width: 250px; height: 50px; float: left; margin-left: 430px; margin-right: 100px">
			<img class="sbdc" alt="SBDC" width="250" height="50" align="middle"
				hspace="50"
				src="https://www.sbdc.or.kr/assets/images/footer/footer-logo.png">
		</div>
		<div style="margin-left: 300px">
			<p style="text-align: left;">
				(07997) 서울특별시 양천구 목동동로 309 중소기업유통센터<br> 대표자 : 정진수 / 대표전화 :
				02-6678-9000 / 사업자등록번호 : 107-81-53660 <br> © Small & Medium
				Business Distribution Center. All Rights Reserved.
			</p>
		</div>
		</p>
	</footer>
</body>
</html>