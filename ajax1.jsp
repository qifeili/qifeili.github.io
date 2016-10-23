<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<script type="text/javascript" language="javascript" src="jquery.js"></script> <!-- 必须包含 jquery.js文件，否则将无法传值--> 
<%    String path = request.getContextPath();
     String basePath = request.getScheme() + "://"
             + request.getServerName() + ":" + request.getServerPort()
             + path + "/";
%>
<head> 
<script type="text/javascript"> 
function fun(){ 
var ss; 
var radio1=document.getElementsByName("radio1"); //读取单选按钮的值 
for(var i=0;i<radio1.length;i++){ 
if(radio1.item(i).checked){ 
ss=radio1.item(i).value; 
break; 
} 
} 
// var sendstr="sendstr1="+form1.text1.value+"&sendstr2="+ss; 
$.ajax({ 
type:"POST", 
url: "ajax2.jsp", 
async:false, 
// data:sendstr, //也可以用注释的这方式来进行传值操作 
data:{sendstr1:form1.text1.value,sendstr2:ss}, //也可以用 $("#text1").val()的方式读取text1中的元素值 
success:function(data){ 
alert(data); 
} 
}); 
} 
</script> 
</head> 
<body> 
<div align="center"> 
<form id="form1" name="form1" action="" method="post" > 
输入：<input type="text" name="text1" id="text1"><br> 
金球：<input type="radio" name="radio1" value="梅西">梅西 
<input type="radio" name="radio1" value="C罗">C罗<br> 
<input type="button" value="提交" onclick="fun()"> 
</form> 
</div> 
</body> 
</html> 