<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mySales.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css"/>
</head>

<script type="text/javascript">

	function findLike(){
		var find_id=$("#find_id option:selected").val();
		var find=$("#find").val();
		//alert(find_id+find);
		location.href="findGoodsLike2.do?find_id="+find_id+"&find="+find;
	}
	
	function findEvaByGid(g_id){
		$.ajax({
			url:"findEvaByGid.do",
			data:"g_id="+g_id,
			type:"get",
			dataType:"json",
			success:function(result){
				var g_url,g_name,e_content,e_score,u_name
				for(var p in result){
					if(p=="index"){
						alert("index"+index)
					}
					if(p=="eva"){
						if(result[p]==null || result[p]==""){
							findGoodsById(g_id)
					}else{
						g_url=result[p].goods.url;
						g_name=result[p].goods.g_name;
						e_content=result[p].e_content;
						e_score=result[p].e_score;
						u_name=result[p].seller.u_name;
						ShowEva(g_url,g_name,e_content,e_score,u_name);
					}
					}
				}
			}
		})
	}
	
	//查看评价
	function ShowEva(g_url,g_name,e_content,e_score,u_name){
		var star=[
			"💗",
			"💗💗",
			"💗💗💗",
			"💗💗💗💗",
			"💗💗💗💗💗"
		]
		var stars = star[e_score-1]
		var div = document.createElement('div')
		div.className="in_card"
		div.innerHTML='<div class="modal-body">'+
							'<div class="card mb-3" style="max-width: 540px;">'+
								'<div class="row no-gutters">'+
									'<div class="col-md-4">'+
										'<img class="g_img" src="'+g_url+'" class="card-img" alt="...">'+
									'</div>'+
									'<div class="col-md-8">'+
										'<div class="card-body">'+
											'<h5 class="card-title">'+g_name+'</h5>'+
											'<p class="card-text">'+e_content+'</p>'+
											'<p class="card-text"><small class="text-muted">'+
												'<span >'+stars+'</span>&nbsp;'+u_name+
												'</small>'+
											'</p>'+
										'</div>'+
									'</div>'+
								'</div>'+
							'</div>'
						+"</div>"
					+"<div class='modal-footer'>"
				+"<button type='button' class='btn btn-default' data-dismiss='modal'>已评价</button>"
		$("#for").html(div);
	}
	
	//发布评价
	function findGoodsById(id){
		$.ajax({
			url:'findGoodsById1.do',
			data:'g_id='+id,
			dataType:'json',
			type:'post',
			success:function(result){
				var input="";
				input+="<form action='addEva.do' method='post'>";
				input+="<div class='modal-body'>"
				input+="<p>物品编号：<input type='text' class='form-control' name='g_id' id='g_id' readOnly value='"+result.g_id+"'></p>";
				input+="<p>卖家编号：<input type='text' class='form-control' name='se_id' id='se_id' readOnly value='"+result.seller.u_id+"'></p>";
				input+="<p>买家编号：<input type='text' class='form-control' name='bu_id' id='bu_id' readOnly value='"+result.buyer.u_id+"'></p>";
				input+="<p>评价内容：<textarea rows='10' cols='67' class='form-control' name='e_content' id='e_content' ></textarea></p>";
				input+="请打分（1-5分）：<br /><br /> "
				input+="<select name='e_score' id='e_score'>"
				input+="<option value='5'>5</option>"
				input+="<option value='4'>4</option>"
				input+="<option value='3'>3</option>"
				input+="<option value='2'>2</option>"
				input+="<option value='1'>1</option>"
				input+="</select>"
				input+="</div>"
				input+="<div class='modal-footer'>"
				input+="<button type='button' class='btn btn-default' data-dismiss='modal'>关闭</button>"
				input+="<button type='submit' class=''>修改</button></div></form>"
				$("#for").html(input);
			},
			error : function() {
				alert("异常，请稍后再试！");
	        }
		});
	}
	
</script>
<body>
<div id="container">
<header id="top">
<!--头部通栏-->
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
	<p class="title">我的订单</p>
	<p class="title-id">当前买家编号：${u_id }</p>
	<div class="main-top container">
		<div class="row">
			<div class="col-md-4"></div>	
			<!-- 搜索表单 -->
			<div class="col-md-8 search">
				<form>
					<select name="find_id" id="find_id">
						<option value="0">- - - - - -</option>
						<option value="1">订单编号</option>
						<option value="2">物品名称</option>
						<option value="3">物品类别</option>
					</select>
					<input class="search-find" type="text" name="find" id="find" placeholder="输入搜索内容"> 
					<input class="btn btn-primary" type="button" onclick="findLike()" value="搜索">
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
						<th>物品名称</th>
						<th>物品图片</th>
						<th>物品类别</th>
						<th>价格</th>
						<th>物品描述</th>
						<th>卖家编号</th>
						<th>卖家姓名</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:forEach items="${list }" var="g">
						<tr>
							<td>${g.g_id }</td>
							<td>${g.g_name }</td>
							<td><img src="${g.url }"/></td>
							<td>${g.type.t_name }</td>
							<td>${g.g_price }</td>
							<td>${g.g_detail}</td>
							<td>${g.seller.u_id }</td>
							<td>${g.seller.u_name }</td>
							<td>
								<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="findEvaByGid(${g.g_id})">发布评论</button>
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
					<li><a href="findGoodsByBuyer.do?index=1">首页</a></li>
					<c:if test="${index>1 }">
						<li><a href="findGoodsByBuyer.do?index=${index-1 }">&laquo; 上一页</a></li>
					</c:if>
				    <c:if test="${index<total}">
				    	<li><a href="findGoodsByBuyer.do?index=${index+1 }">下一页 &raquo;</a></li>
				    </c:if>
				    <li><a href="findGoodsByBuyer.do?index=${total}">尾页</a></li>
				</ul>
				</div>
			 </c:when>
			<c:otherwise>
				<!-- <p>搜索</p> -->
				<div class="page-pos">
				<ul class="pagination">
				<li><a href="findGoodsLike2.do?find_id=${find_id }&find=${find }&index=1">首页</a></li>
					<c:if test="${index>1 }">
						<li><a href="findGoodsLike2.do?find_id=${find_id }&find=${find }&index=${index-1 }">&laquo; 上一页</a></li>
					</c:if>
				    <c:if test="${index<total}">
				    	<li><a href="findGoodsLike2.do?find_id=${find_id }&find=${find }&index=${index+1}">下一页 &raquo;</a></li>
				    </c:if>
				    <li><a href="findGoodsLike2.do?find_id=${find_id }&find=${find }&index=${total}">尾页</a></li>
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
<!-- 修改模态框（Modal） -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							发布评论
						</h4>
					</div>
					<div id="for"></div>
					
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
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