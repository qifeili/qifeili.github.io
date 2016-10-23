<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String path = request.getContextPath();
     String basePath = request.getScheme() + "://"
             + request.getServerName() + ":" + request.getServerPort()
             + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>左半边网页</title>
</head>
<style>
 *{margin:0px 0px 0px 0px;
 overflow:hidden;
} 
</style>
<body>
<button onclick="chu()">chu</button>
<div id="flush1">
 <iframe id="ifr" src="ab.html" frameborder="0" width="200%"  height="900px" scrolling="yes"></iframe>
</div>

<script type="text/javascript">//数据交互
    var oIfr = document.getElementById("ifr");
    //设置domain，和谐跨域访问限制
    document.domain = "localhost";

    //iframe相关操作
    var getIframe = {
        //获取iframe的window对象
        getWin : function(obj){
            return obj.contentWindow;
        },
        //获取iframe的document
        getDoc : function(obj){
            //chrome and ff or ie
            return obj.contentDocument || obj.contentWindow.document;
        },
        //在iframe里获得父页面的window对象
        getParents : function(){
            return {
                parent : window.parent,
                top : window.top
            }
        },
        //当前环境是不是iframe
        isIframe : function(win){
            return win.frameElement;
        },
        //动态创建iframe，返回创建好的iframe标签html
        createIframe : function(src, fncallback){
            var ifr = document.createElement("iframe");
            ifr.src = src;
            if(ifr.attachEvent){
                ifr.attachEvent("onload", fncallback);
            }else{
                ifr.addEventListener("load", fncallback, false);
            }

            return ifr;
        }
    };

    //子页面执行的方法
    function showDemo(){
        alert("我是Demo页的方法，在iframe里触发：showDemo");
    }

    //获取iframe的document对象
    aBtns[1].onclick = function(){
        alert(getIframe.getDoc(oIfr).getElementById("oDiv").innerHTML);
    };
    //当前的window不是iframe
    aBtns[2].onclick = function(){
        alert(getIframe.isIframe(window));//null
    };
    //当前的window是iframe
    aBtns[3].onclick = function(){
        alert(getIframe.isIframe(getIframe.getWin(oIfr)));
    };
    //动态加载iframe
    aBtns[4].onclick = function(){
        var t = null;
        t = getIframe.createIframe("http://www.baidu.com/", (function(){
            alert("这个新创建的iframe元素load时发生");
        }()));
        document.getElementsByTagName("body")[0].appendChild(t);
    }

    //获取ab.html的window对象
    function chu(){ alert("3");
    getIframe.getWin(oIfr).showWindow();
     alert("成功");
    }

</script>
</body>  
</html> 