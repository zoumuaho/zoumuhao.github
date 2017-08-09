<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017/8/4
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
    <title>用户注册</title>
    <script language="JavaScript" src="/js/jquery-2.1.4.js"></script>
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
    <div id="myDiv" class="easyui-panel" style="text-align: center;margin: auto" title="用户注册">
        <form id="signupForm" method="post" action="/user/addReg.do">
            <p>
                <label for="userName">用 户 名： </label>
                <input id="userName" name="userName" onblur="validateUsername()" value=""/><span id="errorContent"></span>
            </p>

            <p>
                <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                <input id="password" name="pwd" type="password" class="easyui-validatebox" required="true" value=""/><span id="pwdContent"></span>
            </p>

            <p>
                <label for="rePassWord">确认密码：</label>
                <input id="rePassWord" name="rePassWord" type="password" required="true" class="easyui-validatebox" value=""/><span id="regPwdContent"></span>
            </p>

            <p style="text-align:center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                <input class="submit" type="submit" value="注册" id="validate"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" value="重置">
            </p>
        </form>
    </div>
</div>
</body>
<script>
   function validateUsername() {

        var errorContent = $("#errorContent").html("");
       /* var pwdContent = $("#pwdContent").html("");
        var regPwdContent = $("#regPwdContent").html("");*/
        var userName = $("#userName").val();
        /*var password = $("#password").val();
        var rePassWord = $("#rePassWord").val();*/
       /* if(userName==""){
            pwdContent.html("<div style='color:limegreen'>"
                + "请填写用户名！" + "</div>");
        }
        if(password==""){
            pwdContent.html("<div style='color:limegreen'>"
                + "请填写密码！" + "</div>");
        }
        if(rePassWord==""){
            regPwdContent.html("<div style='color:limegreen'>"
                + "请再次输入密码！" + "</div>");
        }
        if(password!=rePassWord){
            errorContent.html("<div style='color:limegreen'>"
                + "两次密码输入不一致！" + "</div>");
        }*/
        $.ajax({
            url:'/user/validateUsername.do',
            type:'post',
            data:{
                userName:userName
            },
            success:function (data) {
                if(data.result=="success"){
                    errorContent.html("<div style='color:limegreen'>"
                        + "用户名已经存在，请换一个吧！" + "</div>");
                }else {
                    errorContent.html("<div style='color:limegreen'>"
                        + "用户名可以用，~-~！" + "</div>");
                }
            },
        });
   }
</script>
</html>
