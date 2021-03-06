<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath%>">
<head>
    <title>服务商完成需求</title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_368076_we3l46nomcp7gb9.css">
    <link rel="stylesheet" href="./static/css/mydemand.css">
    <script src="/static/js/demandJS.js" ></script>
</head>
<body>
<!-- 头部开始 -->
<%@include file="./common/header.jsp"%>
<!-- 头部结束 -->

<!-- 导航开始 -->
<%@include file="./common/navigation.jsp"%>
<!-- 导航结束 -->

<!-- 当前位置 开始 -->
<div class="currnt">
    <div class="currnt-content">
        <p><span>当前位置:</span>首页>用户中心>我的需求</p>
    </div>
</div>
<!-- 当前位置 结束 -->

<!-- 大威平台 发布需求 开始 -->
<div class="platSafety">

    <%@include file="common/left.jsp"%>

    <div class="right">
        <div class="right_top">
            <ul>
                <li><a href="/demand/showMyDemand?status=999" class="active">全部</a></li>
                <li><a href="/demand/showMyDemand?status=0">草稿箱</a></li>
                <li><a href="/demand/showMyDemand?status=1">已发布的需求</a></li>
                <li><a href="/demand/showMyDemand?status=9">已完成的需求</a></li>
            </ul>
        </div>
        <div class="right_content">
            <ul>
                <li class="li1">
                    <span class="sp1">序号</span>
                    <span class="sp2">订单标题</span>
                    <span class="sp3">状态中</span>
                    <span class="sp4">操作</span>
                </li>
                <c:forEach items="${demand}" var="d" varStatus="i">
                    <li>
                        <span class="sp1">${i.index+1}</span>
                        <span class="sp2" ><a href="/demand/demandDteils?id=${d.demandId}" name="${d.demandName}" style="color: #2a2a2a">${d.demandName}</a></span>
                        <span class="sp3 sp33">${d.demandStatus}</span>
                        <span class="sp4">
                                    <a href="" class="xiugai">修改</a>
                                    <a href="" class="baocun">保存</a>
                                    <a href="" class="shancu">删除</a>
                                    <a href="" class="fabu">发布</a>
                                </span>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="page">
            <span class="active">1</span>
            <span>2</span>
            <span>4</span>
            <span>5</span>
            <span>...</span>
            <span>26</span>
            <span>26</span>
            <span>27</span>
            第<input type="text">页
        </div>
    </div>
</div>
<!-- 大威平台 发布需求 结束 -->

<!-- 底部开始 -->
<%@include file="./common/footer.jsp"%>
<!-- 底部结束 -->
</body>
</html>
