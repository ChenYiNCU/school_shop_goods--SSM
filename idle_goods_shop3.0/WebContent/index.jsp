<%@page import="com.goods.entity.Type"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.List,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/swiper-bundle.min.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/box.css" />
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/swiper-bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script>
	function findGoods(e) {
		var input = e.parentNode.children[0];
		var g_name = input.value;
		
		if(g_name==''){
			alert('输入不能为空');
		}
		else{
			location.href = "allGoods.do?g_name=" + g_name + "&flag=1";
		}
	}
	function findGoodsByType(t_id){
		location.href = "allGoods.do?t_id=" + t_id + "&flag=2";
	}
</script>

</head>
<body>
	<!--头部-->
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
							<img src="img/购物 车.png" />&nbsp; 购物车<span style="color:red;font-size:16px;display: inline-block;width:20px;height:20px;border-radius:50% ;line-height: 20px;text-align: center;">
							<%=session.getAttribute("cardnum")%></span>
						</td>
						<td>首页</td>
						
					</tr>
				</table>
			</div>
		</div>
	</div>

	<!--导航栏-->
	<div class="mynav text-center">
		<span> <img src="./img/logo3.png" />
		</span>
		<nav>
		<ul>
			<!-- <li>男装</li>
			<li>女装</li>
			<li>电子产品</li>
			<li>箱包</li>
			<li>食物</li>
			<li>美妆</li> -->
			<%
				int i = 0;
				int j = 1;
				
			%>

			<c:forEach items="${list1}" var="t">
				<%
					i++;
						if (i < 7) {
				%>

				<li onclick="findGoodsByType(${t.t_id})">${t.t_name}</li>

				<%
					} else {
							j--;
				%>
				<%
					if (j == 0) {
				%>
				<li id="more">更多
					<ul id="box">

						<%
							}
						%>

						<li onclick="findGoodsByType(${t.t_id})">${t.t_name}</li>
						<%
							}
						%>
					
			</c:forEach>
		</ul>
		</li>
		</ul>

		</nav>

		<div class="h_inpt">
			<input type="text" /> <img src="img/搜索.png" id="img_sh"
				onclick="findGoods(this)" />
		</div>

	</div>
	</header>

	<!--内容-->
	<div class="mycontent">
		<!--轮播图-->
		<div id="sub1">
			<img src="img/banner.jpg" alt="" class="s1 img-responsive"> <img
				src="img/banner2.png" alt="" class="s2 img-responsive"> <img
				src="img/banner4.png" alt="" class="s2 img-responsive">
			<ul id="imgc">
				<li value="0"></li>
				<li value="1"></li>
				<li value="2"></li>
			</ul>
		</div>
		<!--公告-->
		<div class="notice text-center">


			<div
				class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
				<div class="swiper-wrapper" id="swiper-wrapper-1b10ecfe5af1015103"
					aria-live="polite">
					
					<c:forEach items="${list2}" var="n">
					<div class="swiper-slide" role="group" aria-label="1 / 10"
						style="margin-right: 30px;">
						<span> <textarea readonly="readonly">${n.n_content }</textarea>
						</span>
					</div>
					</c:forEach>
					
				</div>
			</div>

		</div>


		<!--商品展示-->
		<div class="goods">

			<div class="ty">
				<div class=ty_head>
					<span>
					<img alt="" src="img/line.png" width="180px" height="40px">
					</span> <a href="allGoods.do?flag=0">查看更多<img
						src="img/right.png"  width="20px"/></a>
				</div>
				<table>
					<tr>
						<%
							int b = 0;
						%>
						<c:forEach items="${list3}" var="t">
							<%
								b++;
									if (b == 5) {
										b = 1;
							%>						
					</tr>
					<tr>
						<%
							}
						%>
						<td>
							<div class="box" onclick="location.href='findByGId.do?g_id=${t.g_id}'">
		                        <img src="${t.url }" title="${t.g_name }" />
		                        <div class="box-content">
		                            <div class="content">
		                                <h3 class="title">${t.g_name }</h3>
		                                <span class="post">${t.g_price }</span>
		                            </div>
		                        </div>
		                    </div>
						</td>

						</c:forEach>

					</tr>
				</table>

			</div>
		</div>
	</div>
	<aside>
	<ul>
		<li
			onclick="location.href='card.do?u_id=<%=session.getAttribute("u_id")%>'">
			<p>
				<img src="img/购物 车.png" /><span style="color:red;font-size:16px;display: inline-block;width:20px;height:20px;border-radius:50% ;line-height: 20px;text-align: center;background: #ff1e005a;">
				<%=session.getAttribute("cardnum")%></span>
			</p> 购物车
		</li>
		<li onclick="location.href='findAllType.do'">
			<p>
				<img src="img/发布.png" />
			</p> 发布
		</li>
		<a href="#top">
		<li>
				<p>顶部</p> <img src="img/回到顶部 (1).png" />
		</li>
		</a>
	</ul>
	</aside>
	<img src="img/表情.png" id="mouseflow" />
	<!--尾部-->
	<footer>
	<div class="container-fluid text-center">
		<div class="row">
			<p>COPYRIGHT &copy; 陈益 &emsp; 董丽荣 &emsp; 王晏</p>
			<p>南昌大学软件学院</p>
			<p>电话：19979404672&emsp; &emsp;邮箱1159428961@qq.com</p>
		</div>

	</div>
	</footer>

</body>
</html>