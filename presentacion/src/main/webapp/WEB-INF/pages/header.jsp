<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<title>FastTourist</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<!--[if ie]><meta content='IE=8' http-equiv='X-UA-Compatible'/><![endif]-->
	
		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->
		<!-- bootstrap -->
		<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">  
		<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">      
		<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">		
		<link href="${pageContext.request.contextPath}/resources/themes/css/bootstrappage.css" rel="stylesheet"/>
		
		<!-- global styles -->
		<link href="${pageContext.request.contextPath}/resources/themes/css/jquery.fancybox.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/themes/css/flexslider.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/themes/css/main.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/themes/css/datepicker.css" rel="stylesheet"/>

		<!-- scripts -->
		<script src="${pageContext.request.contextPath}/resources/themes/js/jquery-1.7.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/themes/js/bootstrap-datepicker.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>				
		<script src="${pageContext.request.contextPath}/resources/themes/js/superfish.js"></script>	
		<script src="${pageContext.request.contextPath}/resources/themes/js/jquery.scrolltotop.js"></script>
		<script src="${pageContext.request.contextPath}/resources/themes/js/jquery.fancybox.js"></script>

		<script>
		$(function(){
			$('#dp1').datepicker();
			$('#dp2').datepicker();
		});
		</script>

		<!--[if lt IE 9]>			
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->		
	</head>
<body>

	<div id="top-bar" class="container">
		<div class="row">
			<div class="span4">
				<!-- <a href="index.html" class="logo pull-left"><img src="${pageContext.request.contextPath}/resources/themes/images/logo.png" class="site_logo" alt="" height="37px"></a> -->
				<a href="/presentacion/registro" class="logo pull-left"><h1><strong>LabRedes</strong></h1></a>
			</div>
			<div class="span8">
				<div class="account pull-right">
					<ul class="user-menu">	
						<c:if test="${not empty usuarioAutenticado}">
						<li>Bienvenido <span style="color:#eb4800">${usuarioAutenticado}</span></li>
						</c:if>
						<c:choose>
							<c:when test="${not empty usuarioAutenticado}">
						<li><a href="/presentacion/">Salir</a></li>
    						</c:when>
							<c:otherwise>
						<li><a href="/presentacion/registro">Registrarse</a></li>		

							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="wrapper" class="container">