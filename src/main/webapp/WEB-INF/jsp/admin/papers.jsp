<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QuestionPage</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body>
<div>
    <div class="container" style="padding: 20px;">
        <div style="margin-bottom: 10px;">
            <button class="btn btn-success" onclick="window.location.href='${ctx}/addPaper'">新增试卷</button>
            <button class="btn btn-danger" type="button" onclick="deletePaper()">删除</button>
        </div>
        <form action="${ctx}/deletePaper" method="post">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th class="num"></th>
                    <th class="name">ID</th>
                    <th class="name">名称</th>
                    <th class="name">年段</th>
                    <th class="name">年级</th>
                    <th class="name">科目</th>
                    <th class="node">难度</th>
                    <th class="process">时长</th>
                    <th class="operate">操作</th>
                </tr>
                </thead>
                <tbody align="center">
                <c:forEach items="${papers}" var="paper">
                    <tr align="center">
                        <td><input type="checkbox" name="id" value="${paper.id}"/></td>
                        <td>${paper.id}</td>
                        <td>${paper.title}</td>
                        <td>
                            <c:if test="${paper.chapter==1}">小学</c:if>
                            <c:if test="${paper.chapter==2}">初中</c:if>
                            <c:if test="${paper.chapter==3}">高中</c:if>
                        </td>
                        <td>
                            <c:if test="${paper.section==1}">一</c:if>
                            <c:if test="${paper.section==2}">二</c:if>
                            <c:if test="${paper.section==3}">三</c:if>
                            <c:if test="${paper.section==4}">四</c:if>
                            <c:if test="${paper.section==5}">五</c:if>
                            <c:if test="${paper.section==6}">六</c:if>
                            年级
                        </td>
                        <td>
                            <c:if test="${paper.subject==1}">语文</c:if>
                            <c:if test="${paper.subject==2}">数学</c:if>
                            <c:if test="${paper.subject==3}">外语</c:if>
                            <c:if test="${paper.subject==4}">政治</c:if>
                            <c:if test="${paper.subject==5}">历史</c:if>
                            <c:if test="${paper.subject==6}">地理</c:if>
                            <c:if test="${paper.subject==7}">物理</c:if>
                            <c:if test="${paper.subject==8}">化学</c:if>
                            <c:if test="${paper.subject==9}">生物</c:if>
                        </td>
                        <td>
                            <c:if test="${paper.level==1}">简单</c:if>
                            <c:if test="${paper.level==2}">一般</c:if>
                            <c:if test="${paper.level==3}">中等</c:if>
                            <c:if test="${paper.level==4}">较难</c:if>
                            <c:if test="${paper.level==5}">巨难</c:if>
                        </td>
                        <td>${paper.time}</td>
                        <td class="operate">
                            <a href="${ctx}/deletePaper?id=${paper.id}" class="del">删除</a>
                            <a href="${ctx}/updatePaper?id=${paper.id}" class="del">编辑</a>
                            <a href="${ctx}/queryPaper?id=${paper.id}" class="del">查看</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</div>
<script src="${ctx}/resource/js/jquery-3.2.1.min.js"></script>
<script src="${ctx}/resource/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    function deletePaper() {
        var ids = "";
        $("input:checkbox[name='id']:checked").each(function() {
            ids += $(this).val() + ",";
        });
        //判断最后一个字符是否为逗号，若是截取
        var id = ids.substring(ids.length -1, ids.length);
        if(id === ","){
            ids = ids.substring(0, ids.length-1);
        }
        if(ids === ""){
            alert("请选择要删除的试卷！");
            return;
        }
        $("form").submit();
    }
</script>
</body>
</html>