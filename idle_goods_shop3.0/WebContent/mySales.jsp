<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的发布</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mySales.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css"/>
</head>
<script type="text/javascript">
	function del(id){
		if(confirm("确认是否取消发布物品?")){
			//alert(id);
			location.href="delGoods.do?g_id="+id;
		}
	}
	
	function findGoodsById(id){
		//alert(id);
		if(confirm("确认是否修改发布信息?")){
			location.href="findGoodsById.do?g_id="+id;
		}
		
	}
	
	function addGoods(){
		location.href="findAllType.do";
	}
	
	function findLike(){
		var find_id=$("#find_id option:selected").val();
		var find=$("#find").val();
		//alert(find_id+find);
		location.href="findGoodsLike.do?find_id="+find_id+"&find="+find;
	}
</script>
<script type="text/javascript">


</script>
<body>
<!--头部-->
<div id="container">
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
<div class="main">
	<p class="title">我的发布</p>
	<p class="title-id">当前卖家编号：${u_id }</p>
	<div class="main-top container">
		<div class="row">
			<div class="col-md-4">
				<button type="button" class="btn btn-primary" onclick="addGoods()">添加发布</button>
			</div>
			<!-- 搜索表单 -->
			<div class="col-md-8 search">
				<form>
					<!-- <div class="search-float"> -->
						<select name="find_id" id="find_id">
							<option value="0">- - - - - -</option>
							<option value="1">发布编号</option>
							<option value="2">物品名称</option>
							<option value="3">物品类别</option>
						</select>
					 <!-- </div> -->
					<!-- <div class="find-border search-float"> --><input type="text" name="find" id="find" class="search-find"><!--  </div> -->
					<!-- <div class="search-float"> --><input type="button" class="btn btn-primary" onclick="findLike()" value="搜索"><!-- </div> -->
				</form>
			 </div>
		</div>
	</div>
	<c:choose>
		<c:when test="${list.size()!=0}">
		<div class="table-responsive">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>发布编号</th>
						<th>商品名称</th>
						<th>商品图片</th>
						<th>商品类别</th>
						<th>价格</th>
						<th>商品描述</th>
						<th>商品状态</th>
						<th>操作</th>
					</tr>
				</thead>
					<tbody>
					<c:forEach items="${list }" var="g">
						<tr>
							<td>${g.g_id }</td>
							<td>${g.g_name }</td>
							<td><img src="${g.url }"/></td>
							<td>${g.type.t_name }</td>
							<td>${g.g_price }</td>
							<td class="limit">${g.g_detail}</td>
							<c:if test="${g.flag==0 }">
								<td>未通过审核</td>
							</c:if>
							<c:if test="${g.flag==1 || g.flag==2}">
								<td>未出售</td>
							</c:if>
							<c:if test="${g.flag==3 }">
								<td>已出售</td>
							</c:if>
							<td>
							<c:if test="${g.flag ==1 ||g.flag==2 || g.flag==0}">
								<button type="button" class="btn btn-primary" onclick="del(${g.g_id})">取消发布</button>
								<button type="button" class="btn btn-primary" onclick="findGoodsById(${g.g_id})">修改信息</button>
							</c:if>
							</td>
						</tr>
					</c:forEach>
					</tbody>
			</table>
			</div>
			<!-- 全部分页 -->
			 <div class="page">
			 	<c:choose>
					<c:when test="${find==null || find_id==null ||find_id==0 || find==''}"> 
						<!-- <p>全部</p> -->
						<div class="page-pos">
						<ul class="pagination">
							<li><a href="findGoodsBySeller.do?index=1">首页</a></li>
							<c:if test="${index>1 }">
								<li><a href="findGoodsBySeller.do?index=${index-1 }">&laquo; 上一页</a></li>
							</c:if>
						    <c:if test="${index<total}">
						    	<li><a href="findGoodsBySeller.do?index=${index+1}">下一页 &raquo;</a></li>
						    </c:if>
						    <li><a href="findGoodsBySeller.do?index=${total }">尾页</a></li>
						</ul>
						</div>
					 </c:when>
					<c:otherwise>
						<!-- <p>搜索</p> -->
						<div class="page-pos">
						<ul class="pagination">
						<li><a href="findGoodsLike.do?find_id=${find_id }&find=${find }&index=1">首页</a></li>
							<c:if test="${index>1 }">
								<li><a href="findGoodsLike.do?find_id=${find_id }&find=${find }&index=${index-1 }">&laquo; 上一页</a></li>
							</c:if>
						    <c:if test="${index<total}">
						    	<li><a href="findGoodsLike.do?find_id=${find_id }&find=${find }&index=${index+1}">下一页 &raquo;</a></li>
						    </c:if>
						    <li><a href="findGoodsLike.do?find_id=${find_id }&find=${find }&index=${total}">尾页</a></li>
						</ul>
						</div>
				 	</c:otherwise>
				</c:choose>
			</div>
		</c:when> 
		<c:otherwise>
			<p class="not-found">无搜索结果</p>
		</c:otherwise>	
	</c:choose>
</div>
<footer>
	<div class="container-fluid text-center">
		<div class="row" style="text-align:center;">
			<p>COPYRIGHT &copy; 陈益 &emsp; 董丽荣 &emsp; 王晏</p>
			<p>南昌大学软件学院</p>
			<p>电话：19979404672&emsp; &emsp;邮箱1159428961@qq.com</p>
		</div>
	</div>
</footer>
</div>
</body>
</html>