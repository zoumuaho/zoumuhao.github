<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017/8/4
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>新增员工信息</title>
    <script src="/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js" type="text/javascript"></script>
    <link href="/js/jquery-easyui-1.2.6/themes/default/easyui.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="/js/jquery-easyui-1.2.6/themes/icon.css" type="text/css">
    <script type="text/javascript" src="/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.js"></script>
    <script type="text/javascript" src="/js/jquery.metadata.js"></script>
    <script type="text/javascript" src="/js/messages_cn.js"></script>
    <link href="/css/index.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="div_table">
    <form  method="post" action="/Emp/getAddEmp.do">

        <table id="add_table" style="text-align: right;margin: auto">
            <tr>
                <td>ENAME:</td>
                <td><input type="text" name="ename" id="ename"></td>
            </tr>
            <tr>
                <td>JOB:</td>
                <td><input type="text" name="job" id="job"></td>
            </tr>
            <tr>
                <td>MGR:</td>
                <td><input type="text" name="mgr" id="mgr"></td>
            </tr>
            <tr>
                <td>HIREDATE:</td>
                <td><input class="easyui-datebox" name="hiredate" id="hiredate"
                           data-options="formatter:myformatter,parser:myparser" style="width: 145%"></input></td>
            </tr>
            <tr>
                <td>SAL:</td>
                <td><input type="text" name="sal" id="sal"></td>
            </tr>
            <tr>
                <td>COMM:</td>
                <td><input type="text" name="comm" id="comm"></td>
            </tr>
        </table>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="确定">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="重置">
        </div>
    </form>
</div>
</body>
<script>
    $('#hiredate').datebox({
        closeText:'关闭',
        formatter:function(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            var h = date.getHours();
            var M = date.getMinutes();
            var s = date.getSeconds();
            function formatNumber(value){
                return (value < 10 ? '0' : '') + value;
            }

            return y+'/'+m+'/'+d/*+' '+ formatNumber(h)+':'+formatNumber(M)+':'+formatNumber(s)*/;
        },
        parser:function(s){
            var t = Date.parse(s);
            if (!isNaN(t)){
                return new Date(t);
            } else {
                return new Date();
            }
        }
    });
</script>
</html>
