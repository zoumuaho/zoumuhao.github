<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017/8/3
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--<script language="JavaScript" src="js/jquery-2.1.4.js"></script>--%>
<script src="/js/jquery-easyui-1.2.6/jquery-1.7.2.min.js" type="text/javascript"></script>
<link href="/js/jquery-easyui-1.2.6/themes/default/easyui.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/js/jquery-easyui-1.2.6/themes/icon.css" type="text/css">
<script type="text/javascript" src="/js/jquery-easyui-1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/jquery-easyui-1.2.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/jquery.validate.js"></script>
<script type="text/javascript" src="/js/jquery.metadata.js"></script>
<script type="text/javascript" src="/js/messages_cn.js"></script>
<link href="/css/index.css" rel="stylesheet" type="text/css">

<html>
<head>
    <title>用户登录</title>
</head>
<style>
    #div {
        width: 40%;
        height: 30%;
        border: 1px solid royalblue;
        margin-left: 30%;
    }

    ._from {
        margin-left: 35%;
        margin-top: 10%;
    }

    ._submit {
        margin-left: 20%;
    }
</style>
<body>
<%--<div id="div">
    <div class="_from">
        <form method="post" action="/user/loginUser">
            <label>用&nbsp;户&nbsp;名&nbsp;:</label><input type="text" name="userName" id="userName"/><span id="_uname"></span><br/>
            <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码 :</label><input type="password" name="pwd" id="pwd"/><span id="_upwd"></span><br/>
            <div class="_submit">
                &lt;%&ndash;<input type="submit" name="submit" value="登录">&ndash;%&gt;
                <input type="button" name="btn" value="登录" onclick="login()">
                <a href="../user/reg"><input type="button" name="button" value="注册"></a>
            </div>
        </form>
        </form>
    </div>
</div>--%>
<div id="div_table">
    <div id="myDiv" class="easyui-panel" style="text-align: center;" title="用户注册">
        <form id="signupForm" method="post" action="/user/loginUser.do">
            <p>
                <label for="userName">用 户 名： </label>
                <input id="userName" name="userName" value=""/><span id="_uname"></span>
            </p>

            <p>
                <label for="pwd">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                <input id="pwd" name="pwd" type="password" class="easyui-validatebox" required="true" value=""/><span
                    id="_upwd"></span>
            </p>
            <p style="text-align:center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                <input type="button" name="btn" value="登录" onclick="login()">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" value="重置">
            </p>
        </form>
    </div>
</div>
</body>
<script>
    function login() {

        var userName = $("#userName").val();
        var pwd = $("#pwd").val();
        var _uname = $("#_uname");
        _uname.html("");
        var _pwd = $("#_upwd");
        _pwd.html("");
        var obj = {userName: userName, pwd: pwd}
        if (obj.userName == "" || obj.userName == null) {
            _uname.html("<span style='color:red'>*用户名不能为空</span>");
            return false;
        }
        if (obj.pwd == "" || obj.pwd == null) {
            _pwd.html("<span style='color:red'>*密码不能为空</span>");
            return false;
        }
        $.ajax({
            url: '/user/loginUser.do',
            type: 'post',
            data: {
                userName: userName,
                pwd: pwd
            },
            success: function (data) {
                if (data.result == "success") {
                    window.location.href = '../Emp/getEmp.do';
                } else {
                    alert("用户名或密码错误");
                }
            },
            error: function () {
                alert("网络错误!");
            }
        });
    }
</script>
</html>
