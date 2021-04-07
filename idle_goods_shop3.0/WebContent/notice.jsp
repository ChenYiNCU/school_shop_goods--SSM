<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css">
</head>
<script type="text/javascript">
	function del(n_id){
		if(confirm("确认是删除公告?")){
			location.href="delNotice.do?n_id="+n_id;
		}
	}
	
	function findLike(){
		var find=$("#find").val();
		location.href="findBycontent.do?n_content="+find;
	}
	
	function findByNoId(id){
		$.ajax({
			url:'findByNoId.do',
			data:'n_id='+id,
			dataType:'json',
			type:'post',
			success:function(result){
				var input="";
				input+="<p>编号：<input type='text' class='form-control' name='n_id' id='n_id' readOnly value='"+result.n_id+"'></p>";
				input+="<p>公告内容：<textarea rows='10' cols='67' class='form-control' name='n_content' id='n_content' value='"+result.n_content+"'></textarea></p>";
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
	<header>
		<p class="title">公告管理</p>
	</header>
	<div class="main">
		<div class="container main-top">
			<div class="row">
				<div class="col-md-4">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">添加发布</button>
				</div>
				<div class="col-md-8 search">
				<!-- 搜索表单 -->
				<form>
					<input class="search-find" type="text" name="find" id="find"> 
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
						<th>公告编号</th>
						<th>公告内容</th>
						<th>发布时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="n">
						<tr>
							<td>${n.n_id}</td>
							<td class="limit">${n.n_content}</td>
							<td>${n.time}</td>
							<td>
								<button type="button" class="btn btn-primary" onclick="del(${n.n_id})">删除公告</button>
								<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="findByNoId(${n.n_id})">修改公告</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		 <div class="page">
			<c:choose>
				<c:when test="${n_content==null || n_content==''}"> 
					<!-- <p>全部</p> -->
					<div class="page-pos">
					<ul class="pagination">
						<li><a href="findNoPage.do?index=1">首页</a></li>
						<c:if test="${index>1 }">
							<li><a href="findNoPage.do?index=${index-1 }">&laquo; 上一页</a></li>
						</c:if>
					    <c:if test="${index<total}">
					    	<li><a href="findNoPage.do?index=${index+1}">下一页 &raquo;</a></li>
					    </c:if>
					    <li><a href="findNoPage.do?index=${total }">尾页</a></li>
					</ul>
					</div>
				 </c:when>
				<c:otherwise>
					<!-- <p>搜索</p> -->
					<div class="page-pos">
					<ul class="pagination">
					<li><a href="findBycontent.do?index=1">首页</a></li>
						<c:if test="${index>1 }">
							<li><a href="findBycontent.do?index=${index-1 }&n_content=${n_content-1 }">&laquo; 上一页</a></li>
						</c:if>
					    <c:if test="${index<total}">
					    	<li><a href="findBycontent.do?index=${index-1 }&n_content=${n_content+1 }">下一页 &raquo;</a></li>
					    </c:if>
					    <li><a href="findBycontent.do?index=${total}">尾页</a></li>
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
							修改公告
						</h4>
					</div>
					<form action="updateNotice.do" method="post">
						<div class="modal-body" id="for">
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="submit" class="">
								修改
							</button>
						</div>
					</form>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
		
		<!-- 添加模态框（Modal） -->
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title" id="myModalLabel">
							发布公告
						</h4>
					</div>
					<form action="addNotice.do" method="post">
						<div class="modal-body" id="for">
							<h5>内容</h5>
							<textarea rows="10" cols="67" name="n_content" id="n_content"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="submit" class="">
								发布
							</button>
						</div>
					</form>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
</div>
</body>
</html>