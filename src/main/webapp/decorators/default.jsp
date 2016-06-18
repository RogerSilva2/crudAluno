<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<title><decorator:title /> | <fmt:message key="application.title" /> </title>

		<!-- Bootstrap v3.3.4 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.min.css" type="text/css" />

		<!-- Form Validation -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/form-validation/formValidation.min.css" type="text/css" />

		<!-- Default CSS -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" type="text/css" />
	
		<!-- Bootstrap DateTimePicker -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap-datetimepicker.min.css" type="text/css" />

		<decorator:head />
	</head>

	<body>
		<div class="content-wrapper">
			<decorator:body />
		</div>

		<!-- jQuery v2.1.3 -->
		<script src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js" type="text/javascript"></script>

		<!-- Bootstrap v3.3.4 -->
		<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

		<!-- Jquery Maskedinput -->
		<script src="${pageContext.request.contextPath}/lib/jquery-mask/jquery.mask.min.js" type="text/javascript"></script>

		<!-- Form Validation v0.6.3 -->
		<script src="${pageContext.request.contextPath}/lib/form-validation/formValidation.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/lib/form-validation/framework/bootstrap.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/lib/form-validation/language/en_US.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/lib/form-validation/language/pt_BR.js" type="text/javascript"></script>

		<!-- Moment -->
		<script src="${pageContext.request.contextPath}/lib/moment/moment-with-locales.js" type="text/javascript"></script>

		<!-- Bootstrap DateTimePicker -->
		<script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>

		<!-- Custom Javascript -->
		<decorator:getProperty property="page.local-script"></decorator:getProperty>
	</body>
</html>
