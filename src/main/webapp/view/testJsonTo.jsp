<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>testJsonTo</title>
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
    </script>

    <script type="text/javascript">
//        解析传过来的参数
        function parseUrl(){
            var url=location.href;
            var i=url.indexOf('?');
            if(i==-1)return;
            var querystr=url.substr(i+1);
            var arr1=querystr.split('&');
            var arr2=new Object();
            for  (i in arr1){
                var ta=arr1[i].split('=');
                arr2[ta[0]]=ta[1];
            }
            return arr2;
        }
        var value = parseUrl();
        function Look() {
            alert(value['stuId']);
        }
        stuId = value['stuId'];



          //该页面一加载时,请求json,返回json
            $(function(){
                $.ajax({
                    type:"post",
                    url:getRootPath() + "/testJsonController/test2.do",
                    contentType:"application/json;charset=utf-8",
                    data:'{"stuId":'+stuId+'}',
                    success:function(data){
                        alert("json数据" + data.stuName);
                    }
                });

            });

    </script>

</head>
<body>
<h1>呵呵</h1>
<button onclick="Look()">click</button>

</body>
</html>
