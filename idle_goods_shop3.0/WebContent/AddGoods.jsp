<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/init.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/add.css"/>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css" />
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
<!-- <div id="container"> -->
<header id="top"> <!--头部通栏-->
	<div class="container-fluid top-bar">
		<div class="row">
			<div class="col-md-8"></div>
			<div class="col-md-4 text-right">
				<table>
					<tr>
						<%
							if (session.getAttribute("u_name") == null) {
						%>
						<td>欢迎，请<a href="login&regist.jsp" style="color: red">登录</a>
						</td>
						
						<%
							} else {
						%>
						<td>欢迎,<strong
							style="color: red; font-size: 14px; margin-left: 10px"><%=session.getAttribute("u_name")%></strong></td>
							<td><a href="Out.do">登出 </a>  </td>

						<%
							}
						%>

						<td><a href="personal.do">我的主页</a></td>
						<td
							onclick="location.href='card.do?u_id=<%=session.getAttribute("u_id")%>'">
							<img src="img/购物 车.png" />&nbsp; 购物车
						</td>
						<td onclick="location.href='index.do'">首页</td>
						
					</tr>
				</table>
			</div>
		</div>
	</div>
</header>
	<div class="container">
		<div class="upload_title">
			<h3 class="title">发布商品</h3>
		    <p class="title-text">Upload Goods</p>
		</div>
		<div class="attention col-lg-3">
				<div id="accordion">
					<div class="card">
				    	<div class="card-header">
					        <a class="card-link" data-toggle="collapse" href="#collapseOne">
					          	合理标价可以让宝贝更快的卖出去！
					        </a>
				      	</div>
				      	<div id="collapseOne" class="collapse show" data-parent="#accordion">
					        <div class="card-body">
					          	看着自己的心爱之物，总容易高估物品的价值。但是站在买家的角度，
							  	人家要的就是价格低廉的诱惑。
							  	所在标价的时候不要标的太高太离谱，可以看看别人标价多少，作为参考。
							  	记住，旧东西真的比新东西不值钱太多。 
					        </div>
				    	</div>
				    </div>
				    <div class="card">
				     	<div class="card-header">
					        <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
					        	请详细的描述您的宝贝！
					      	</a>
				      	</div>
				      	<div id="collapseTwo" class="collapse" data-parent="#accordion">
					        <div class="card-body">
					          	最简单的几个问题：用了多久、卖价多少、产品核心信息要写清楚，说明瑕疵程度 。
					        </div>
				    	</div>
				    </div>
				    <div class="card">
				      	<div class="card-header">
					        <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
					          简洁明了的标题让宝贝被更多人关注！
					        </a>
				      	</div>
				      	<div id="collapseThree" class="collapse" data-parent="#accordion">
					        <div class="card-body">
					          温馨提示：标题最好带有商品名哦！
					        </div>
				    	</div>
					</div>
				</div>
			</div>
		</div>			
		<div class="upload_box">
			<div class="upload_form" id="app">
				<form action="addGoods.do" method="post" enctype="multipart/form-data">
					<div class="form_in">
						<h4>上传图片</h4>
						<input type="file" name="file" id="file">
						<h4>商品名称</h4>
						<input type="text" name="g_name" id="g_name" required="required"  />
						<h4>商品描述</h4>
						<textarea rows="10" cols="67" name="g_detail" id="g_detail"></textarea>
						<h4>商品价格</h4>
						<input type="text" name="g_price" id="g_price" required="required"  />
						<h4>商品分类</h4>
						<select name="t_id" id="t_id">
							<c:forEach items="${list}" var="t">
								<option value="${t.t_id}">${t.t_name}</option>
							</c:forEach>
						</select><br><br>
					</div>
					<div class="form_in f_btn">
						<input type="submit" name="" id="btn" value="提交" />
					</div>
				</form>
			</div>
		</div>
		
		<!-- <footer>
	<div class="container-fluid text-center">
		<div class="row" style="text-align:center;">
			<p>COPYRIGHT &copy; 陈益 &emsp; 董丽荣 &emsp; 王晏</p>
			<p>南昌大学软件学院</p>
			<p>电话：19979404672&emsp; &emsp;邮箱1159428961@qq.com</p>
		</div>
	</div>
</footer> -->
<!-- 	</div> -->
</body>
</html>