<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>员工列表</title>
    <link href="/css/index.css" rel="stylesheet" type="text/css">
    <script language="JavaScript" src="/js/jquery-2.1.4.js"></script>
</head>
<body>
<span>欢迎光临,${userName},<a href="#">退出</a></span>
<div id="div_table">
    <table id="table" border="1" cellspacing="0" width="100%" bordercolorlight="#333333" bordercolordark="#efefef">
        <tr bgcolor="#cccccc">
            <td align="center">EMPNO</td>
            <td align="center">ENAME</td>
            <td align="center">JOB</td>
            <td align="center">MGR</td>
            <td align="center">HIREDATE</td>
            <td align="center">SAL</td>
            <td align="center">COMM</td>
            <td align="center">操作</td>
        </tr>
        <c:forEach var="list" items="${Emp}">
            <tr bgcolor="#cccccc">
                <td align="center">${list.empno}</td>
                <td align="center">${list.ename}</td>
                <td align="center">${list.job}</td>
                <td align="center">${list.mgr}</td>
                <td align="center"><fmt:formatDate value="${list.hiredate}" pattern="yyyy-MM-dd"/></td>
                <td align="center">${list.sal}</td>
                <td align="center">${list.comm}</td>
                <td align="center"><a href="#" onclick="javascript:deleteEmp('${list.empno}')">删除</a>
            </tr>
        </c:forEach>
    </table>
    <a href="/Emp/addEmp.do"><input type="button" value="新增"></a>
</div>
</body>
<script>
    function deleteEmp(empno) {
        if (confirm("你确定要删除员工信息吗？")) {
            $.ajax({
                url: '/Emp/deleteEmp.do?empno='+empno,
                type: 'post',
                date: {
                    empno: empno
                },
                success: function (data) {
                    if (data.result == "success") {
                        window.location.reload();
                        alert("删除成功!")
                    } else {
                        alert("删除失败!");
                    }
                },
                error: function () {
                    alert("网络错误!");
                }
            })
        }
    }

</script>
</html>
