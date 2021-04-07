<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="${pageContext.request.contextPath}/resources/css/box.css" />
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/index.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>
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
	<div class="goods">

		<div class="ty">
			<div class=ty_head>
				<span></span>
				<!-- <a>查看更多<img src="img/右.png" /></a>  -->
			</div>
			<table>
			
				<c:if test="${list3.size()==0}">
					<p style="text-align:center; font-size:20px">未查询到相关商品</p>

				</c:if>

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
			<c:if test="${flag==0}">
				<nav aria-label="Page navigation ">
				<ul class="pagination ">
					<li><a href="allGoods.do?index=1&flag=0">首页</a></li>
					<c:if test="${index>1}">
						<li><a href="allGoods.do?index=${index-1}&flag=0">上一页</a></li>
					</c:if>

					<c:if test="${index<total}">
						<li><a href="allGoods.do?index=${index+1}&flag=0">下一页</a></li>
					</c:if>


					<li><a href="allGoods.do?index=${total}&flag=0">末页</a></li>
					<em>当前${index}页,共${total}页</em>
				</ul>

				</nav>
			</c:if>





		</div>
	</div>
	<img src="img/表情.png" id="mouseflow" />

</body>
</html>