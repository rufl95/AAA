<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description"
	content="Bootstrap 3 template for corporate business" />
<title>개발자</title>


<!-- Favicon -->
<link rel="shortcut icon" href="/resources/img/favicon.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jasny-bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/bootstrap-select.min.css"
	type="text/css">
<link href="/resources/css/bootstrap-theme.css" rel="stylesheet">

<!-- Material CSS -->
<link rel="stylesheet" href="/resources/css/material-kit.css"
	type="text/css">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="/resources/fonts/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/fonts/themify-icons.css">

<!-- Animate CSS -->
<link rel="stylesheet" href="/resources/extras/animate.css"
	type="text/css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="/resources/extras/owl.carousel.css"
	type="text/css">
<link rel="stylesheet" href="/resources/extras/owl.theme.css"
	type="text/css">
<!-- Rev Slider CSS -->
<link rel="stylesheet" href="/resources/extras/settings.css"
	type="text/css">
<!-- Main Styles -->
<link rel="stylesheet" href="/resources/css/main.css" type="text/css">
<!-- Slicknav js -->
<link rel="stylesheet" href="/resources/css/slicknav.css"
	type="text/css">
<!-- Responsive CSS Styles -->
<link rel="stylesheet" href="/resources/css/responsive.css"
	type="text/css">

<!-- Color CSS Styles  -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/colors/red.css" media="screen" />

<!-- Custom styles -->
<!-- Team -->
<link rel="/stylesheet" href="/resources/css/agency.css" type="text/css">
<!-- Loin -->
<link href="/resources/css/style.css" rel="stylesheet">
<link href="/resources/css/style-responsive.css" rel="stylesheet" />

<!-- font icon -->
<link href="/resources/css/elegant-icons-style.css" rel="stylesheet" />
<link href="/resources/css/font-awesome.css" rel="stylesheet" />

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700&subset=korean');
font-family: 'Nanum Gothic', sans-serif;

/* @font-face {  */
/*      font-family:"setFont"; */
/*      src:url("/resources/fonts/A뉴굴림2.TTF") format("truetype"); */
/* }     */

/* body, div, h1, h2, h3, h4, h5, h6 {  */
/*      font-family:setFont; */
/* }  */
</style>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

	<!-- Main JS  -->
	<script type="text/javascript" src="/resources/js/jquery-min.js"></script>
	<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/material.min.js"></script>
	<script type="text/javascript" src="/resources/js/material-kit.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.parallax.js"></script>
	<script type="text/javascript" src="/resources/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.slicknav.js"></script>
	<script type="text/javascript" src="/resources/js/main.js"></script>
	<script type="text/javascript"
		src="/resources/js/jquery.counterup.min.js"></script>
	<script type="text/javascript" src="/resources/js/waypoints.min.js"></script>
	<script type="text/javascript"
		src="/resources/js/jasny-bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/resources/js/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="/resources/js/form-validator.min.js"></script>
	<script type="text/javascript"
		src="/resources/js/contact-form-script.js"></script>
</body>

</html>
