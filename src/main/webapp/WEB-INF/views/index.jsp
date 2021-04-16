<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>


<style>
body {
	font-family: arial;
}
.container-fluid {
	font-family: stencil;
	font-size: 30px;
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
	margin-left: 130px;
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
	top: 30%;
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
	margin-left: 330px;
	padding: 3rem 1rem 3rem 12rem;
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
#tempCount {
	text-align: center;
	font-size: large;
	color: white;
	display: flex;
	align-items: center;
}
#saveCount {
	text-align: center;
	font-size: large;
	color: white;
	display: flex;
	align-items: center;
}
#deleteCount {
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
	$(document).ready(
			function() {
				$("#writeBtn").click(function() {
					location.href = "write";
				})
				$.ajax({
					url : "dashBoard",
					success : function(result) {
						console.log(result);
						var tempHtml = "";
						var saveHtml = "";
						var delHtml = "";
						result.temp.forEach(function(item) {
							tempHtml += "<tr> <td><a href = 'view?idx="
									+ item.idx + "'>" + item.title + "</a>"
									+ "</td>" + "<td>" + item.writer
									+ "</td></tr>"
						})
						result.save.forEach(function(item) {
							saveHtml += "<tr> <td><a href = 'view?idx="
									+ item.idx + "'>" + item.title + "</a>"
									+ "</td>" + "<td>" + item.writer
									+ "</td></tr>"
						})
						result.del.forEach(function(item) {
							delHtml += "<tr> <td><a href = 'view?idx="
									+ item.idx + "'>" + item.title + "</a>"
									+ "</td>" + "<td>" + item.writer
									+ "</td></tr>"
						})
						$("#listArea1").append(tempHtml);
						$("#listArea2").append(saveHtml);
						$("#listArea3").append(delHtml);
						$('#example').DataTable();
					}
				});
				$.ajax({
					url : "countDashBoard",
					success : function(result) {
						console.log(result);
						$("#tempCount").append(result[0]);
						$("#saveCount").append(result[1]);
						$("#deleteCount").append(result[2]);
					}
				});
				$("#deleteBtn").click(function() {
					location.href = "write";
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
				<h2 style="font-family: stencil">
					<a href="index"
						style="font-weight: bold; font-size: 1.0em; line-height: 1.0em; color: #19555c">
						2021 SBDC Board Project</a>
				</h2>
			</div>
			<div id="user" onclick="alert('임시 사용자입니다.')" style="cursor:pointer">
					<img alt="user" width="50" height="50"
					
					src="https://i.pinimg.com/736x/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg"
					>
				USER
			</div>
		</a>

	</header>

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav" id="menu">
					<li class="nav-item"><a class="nav-link" href="index"
						style="color: black;">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="color: black;">Board </a>
						<ul class="dropdown-menu">
							<li style="text-align: center"><a href="saveBoard"
								style="color: black">Complete Board</a></li>
							<li style="text-align: center"><a href="tempBoard"
								style="color: black">Archive</a></li>
							<li style="text-align: center"><a href="deleteBoard"
								style="color: black">Delete Board</a></li>
						</ul></li>
				</ul>
				<br>
			</div>
		</div>
	</div>

	<div>
		<p style="margin-left: 300px">
		<h1 style="color: teal; text-align: center; margin: 60px 0 0 260px; font-family: stencil;">Dashboard</h1>
		</p>
	</div>
	<div class="cardwrapper">
		<!--  카드 컴포넌트 -->
		<div class="cardwrap">
			<div class="textwrap" onClick="location.href='tempBoard'">
				<div class="left-text">Archive</div>
				<div id="tempCount">Count : </div>
			</div>
			<div class="boardwrap" onClick="location.href='tempBoard'">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-hover table-striped" id="example"
								class="display" style="width: 50%">
								<thead>
									<tr>
										<th>Title</th>
										<th>Writer</th>
									</tr>
								</thead>
								<tbody id="listArea1">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!--  카드 컴포넌트 -->
		<div class="cardwrap">
			<div class="textwrap" onClick="location.href='saveBoard'">
				<div class="left-text">Complete</div>
				<div id="saveCount">Count : </div>
			</div>
			<div class="boardwrap" onClick="location.href='saveBoard'">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-hover table-striped" id="example"
								class="display" style="width: 50%">
								<thead>
									<tr>
										<th>Title</th>
										<th>Writer</th>
									</tr>
								</thead>
								<tbody id="listArea2">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!--  카드 컴포넌트 -->
		<div class="cardwrap">
			<div class="textwrap" onClick="location.href='deleteBoard'">
				<div class="left-text">Delete</div>
				<div id="deleteCount">Count : </div>
			</div>
			<div class="boardwrap" onClick="location.href='deleteBoard'">

				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-hover table-striped" id="example"
								class="display" style="width: 50%">
								<thead>
									<tr>
										<th>Title</th>
										<th>Writer</th>
									</tr>
								</thead>
								<tbody id="listArea3">
								</tbody>
							</table>
						</div>
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