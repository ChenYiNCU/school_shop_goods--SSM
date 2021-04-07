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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buy.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/card.css" />

<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/card.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
<script type="text/javascript">
function cardDelete(g_id,u_id){
	if(confirm("确认删除吗？")){

			$.ajax({
				url:'cardDelete.do',
				data:'g_id='+g_id,
				dataType:'text',
				type:'post',
				success:function(result){
					if(result!=null){
						alert("删除成功");
						location.href="card.do?u_id="+u_id;
						
					}
				}
			}); 
		
	}
	else{
		return;
	}
}
function pay(u_id){
	if(confirm("确认结算？")){
		var cbs = document.querySelector('.mycard tbody').getElementsByTagName('input');
		for(var i = 0; i < cbs.length; i++) {
			if(cbs[i].checked){
				var goods=cbs[i].parentNode.children[0];
				var g_id=goods.innerHTML;
				//alert(g_id);           //ajax是异步的
				$.ajax({
					url:'pay.do',
					data:'g_id='+g_id,
					dataType:'text',
					type:'post',
					success:function(result){
						if(result!=null){
							//alert("生成订单成功！！");
							location.href="card.do?u_id="+u_id;
							
						}
					}
				}); 
			}			 
		}
	}
	else{
		return;
	}
	
}

</script>
</head>
<body>
	<header>
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
	<div class="mycard">
	<button class="btn btn-default" onclick="location.href='allGoods.do?flag=0'">继续购物</button>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><input type="checkbox">全选</th>
					<th>商品名</th>
					<th>图片</th>
					<th>价格</th>
					<th>卖家名字</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<%
			int num=0;
			int money=0;
			
			%>
			<c:forEach items="${list}" var="goods">
			   <tr>
					<td><span hidden>${goods.g_id}</span> <input type="checkbox" name="" id=""></td>
					<td>${goods.g_name}</td>
					<td><img src="${goods.url }" /> </td>
					<td>${goods.g_price }</td>
					<td>${goods.seller.u_name }</td>
					<td><button class="btn btn-default" onclick="cardDelete(${goods.g_id},'<%=session.getAttribute("u_id")%>')">删除</button></td>
				</tr>
				<% 
				num++;
				
				
				%>
			</c:forEach>
				

			</tbody>

		</table>

		<div class="final">
			<ul>
				<li>购物车中共有&emsp;${num }&emsp;件商品</li>
				<li>共&emsp;${total_money}&emsp; 元</li>
			</ul>
			<div class="buy">
			
				<span>已选<span style="color:red">0</span> 件商品</span>
					<span>合计：<span style="color:red;font-size:18px">0</span> 元</span>
					<button onclick="pay(<%=session.getAttribute("u_id")%>)">结算</button>
			</div>

		</div>

<!-- <img src="img/表情.png" id="mouseflow" /> -->
	</div>

</body>
</html>