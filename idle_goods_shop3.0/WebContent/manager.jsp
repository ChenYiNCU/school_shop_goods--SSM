<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
<script type="text/javascript">
function setHeight(e){
	//e.style.height=e.contentWindow.document.body.offsetHeight+'px';
	
}

</script>
</head>
<body>
	<div class="admin">
		<div class="body_left">
			<!-- 导航元素 -->

			<li><img src="img/logo1.png" />
				<p>管理员系统</p></li>
			<nav>
			<li><a href="user/findAllUsers.do" target="myFrame">用户管理</a></li>
			<li><a href="admin/manageGoods.do" target="myFrame">商品管理</a></li>
			<li><a href="findNoPage.do" target="myFrame">公告管理</a></li>
			</nav>

		</div>
		<!-- 右侧导航 -->
		<div class="body_right">
			<iframe src="user/findAllUsers.do" name="myFrame" scrolling="no" onload="setHeight(this)"></iframe>
		</div>
	</div>
</body>
</html>