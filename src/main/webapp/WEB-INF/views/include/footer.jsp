<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.footer {
	background: #78C2AD;
	height: 400px;
	margin-top: 100px;
	width: 100%;
	border-bottom: 1px solid #CCCCCC;
	border-top: 1px solid #DDDDDD;
}

.footer p {
	margin: 0;
}

.footer img {
	max-width: 100%;
}

.footer h3 {
	color: white;
	font-size: 18px;
	font-weight: 600;
	line-height: 27px;
	padding: 40px 0 0px;
	text-transform: uppercase;
	margin-bottom: 15px;
}

.footer h4 {
	color: white;
	font-size: 2em;
	font-weight: 600;
	line-height: 38px;
	padding: 40px 0 10px;
	font-family: cursive;
	font-weight: lighter;
	text-align: left;
}

.footer ul {
	font-size: 13px;
	list-style-type: none;
	margin-left: 0;
	padding-left: 0;
	margin-top: 0px;
	color: white;
	padding: 0 0 8px 0;
}

.email {
	border-bottom: 3px solid white;
}

.footer ul li a {
	padding: 0 0 12px 0;
	display: block;
	text-align: right;
}

.footer a {
	color: white;
	font-weight: lighter;
}

.footer p {
	color: white;
	font-weight: lighter;
}

.footer a:hover {
	text-decoration: none;
	font-weight: bold;
	font: white;
}

.supportLi h4 {
	font-size: 20px;
	font-weight: lighter;
	line-height: normal;
	margin-bottom: 0 !important;
	padding-bottom: 0;
}

.bg-gray {
	background-image: -moz-linear-gradient(center bottom, white 0%, white 100%);
	box-shadow: 0 1px 0 #B4B3B3;
}

.footer a {
	color: white;
}

.footer-bottom {
	margin-top: 2em;
	border-top: 1px solid white;
	padding-top: 20px;
	padding-bottom: 10px;
	text-align: center;
}

.footer-bottom p.pull-left {
	padding-top: 6px;
	font-size: 0.75em
}

h6 {
	font-size: 1em;
}
</style>

<footer>
	<div class="footer" id="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<h4>HAPPY SUNGBUK</h4>
					<p>홈페이지에 오신 것을 환영합니다 ^_^
					<h6></h6>
				</div>
				<div class="col-lg-3 col-sm-2 col-xs-3">
					<h3>Contact</h3>
					<ul>
						<li><a class="email" href="#"> insert email here </a></li>
						<li>
							<p><a href="https://github.com/ParkJaeRim">github.com/ParkJaeRim</a></p>
						</li>
					</ul>
				</div>
				<div class="col-lg-3 col-sm-2 col-xs-3">
					<ul>
						<li>
							<h5>
								<a href="#" style="margin-top: 5em"> </a>
							</h5>
						</li>
						<li>
							<h5>
								<a href="${root}/crawling"> NEWS </a>
							</h5>
						</li>
						<li>
							<h5>
								<a href="http://localhost:9999/happyhouse/"> 질문 게시판 </a>
							</h5>
						</li>
						<li>
							<h5>
								<a href="http://www.ssafy.com"> SSAFY </a>
							</h5>
						</li>
					</ul>
				</div>

				<!--/.row-->
			</div>
			<!--/.container-->
		</div>
		<!--/.footer-->

		<div class="footer-bottom">
			<div class="container">
				<p class="pull-left copyright">Copyright © Footer 2020. All
					right reserved on 김영호 윤영현 박재림.</p>
			</div>
		</div>
	</div>
</footer>