<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/statics/js/jQuery-core/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">

        //js获取项目根路径，如： http://localhost:8083/uimcardprj
        function getRootPath(){
            //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
            var curWwwPath=window.document.location.href;
            //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
            var pathName=window.document.location.pathname;
            var pos=curWwwPath.indexOf(pathName);
            //获取主机地址，如： http://localhost:8083
            var localhostPaht=curWwwPath.substring(0,pos);
            //获取带"/"的项目名，如：/uimcardprj
            var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
            return(localhostPaht+projectName);
        }

        $(function(){
            //按钮单击时执行,简单请求json串
            $("#testBtn").click(function(){

                $.post("${pageContext.request.contextPath}/testJsonController/test1.do", {name:"zhangSan" },
                        function (data){
                            $("#result1").html(data);
                        });
            });
        });

        $(function(){
            //按钮单击时执行,请求json,返回json
            $("#reqJson").click(function(){
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/testJsonController/test2.do",
                    contentType:"application/json;charset=utf-8",
                    data:'{"stuId":101,"stuPwd":"101"}',
                    success:function(data){
//                        $("#result2").html(data.stuName);
                        // alert(data);
                        var data1 = JSON.stringify(data);
                      window.location.href = getRootPath() + '/view/testJsonTo.jsp?aa=bb&student='+data1;
                    }

                });

            });
        });

        $(function(){
            //按钮单击时执行,请求key_value,返回json
            $("#reqKeyValue").click(function(){
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/testJsonController/test3.do",
                    data:'stuId=102&stuPwd=102',
                    success:function(data){
                        $("#result3").html(data.stuSex);
                    }

                });

            });
        });

    </script>
</head>
<body>
<input type="button" id="testBtn" value="简单请求json串" /><br>
<input type="button" id="reqJson" value="请求json,返回json" /><br>
<input type="button" id="reqKeyValue" value="请求key_value,返回json" /><br>
<a href="${pageContext.request.contextPath}/view/testJsonTo.jsp?stuId=101">学生详情</a> <br>
<span id="result1"></span><br>
<span id="result2"></span><br>
<span id="result3"></span><br>
</body>
</html>
