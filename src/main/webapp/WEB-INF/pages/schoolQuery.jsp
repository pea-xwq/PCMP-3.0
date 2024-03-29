<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020/11/17
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="base.jsp"%>

<html>
<head>
    <title>按学校查询</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<h3 class="page-title" style="text-align: center">学校专业查询</h3><br>

<form class="form-inline" action="/class/schoolQueryResult" method="get">
    <div class="form-group">
        <label for="exampleInputName2">学校</label>
        <input name="schoolName" type="text" class="form-control" id="exampleInputName2" placeholder="请输入学校名称">
    </div>
    <div class="form-group">
        <label for="exampleInputEmail2">专业</label>
        <input name="majorName" type="text" class="form-control" id="exampleInputEmail2" placeholder="请输入专业名称">
    </div>
    <button type="submit" class="btn btn-default">查找</button>
</form>
<br>

<table class="table table-striped table-bordered">
    <thead>
    <tr>
        <th>课程名称</th>
        <th>学校名称</th>
        <th>专业名称</th>
        <th>课程详情</th>
        <th>参与课程</th>
    </tr>
    </thead>
    <tbody>

    <cc:choose>
        <cc:when test="${sessionScope.USER_SESSION.telephone==null}">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <strong>Warning!</strong> 请先登录再参与课程
            </div>
        </cc:when>
    </cc:choose>
    <cc:forEach var="course" items="${courses}">
    <tr>
        <th scope="row" name="cname">${course.cName}</th>
        <td name="school">${course.sName}</td>
        <td name="majors">${course.mName}</td>
        <td name="cinfo"><a href="${course.cInfo}"> 课程详情 </a></td>
        <cc:choose>
            <cc:when test="${sessionScope.USER_SESSION.telephone==null}">
                <form action="#" method="post">
                    <td>
                        <button class="btn btn-primary btn-block" disabled="disabled" title="参与课程请先登录！">
                            参与课程
                        </button>
                    </td>
                </form>
            </cc:when>
            <cc:otherwise>
                <form action="/class/attend?cid=${course.cId}" method="post">
                    <td>
                        <button class="btn btn-primary btn-block" id="btn" onclick=alert('参与课程成功，请到个人中心查看')>
                            参与课程
                        </button>
                    </td>
                </form>
            </cc:otherwise>
        </cc:choose>
    </tr>
    </cc:forEach>

    </tbody>
</table>

</body>
</html>
