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
<title>右半边网页</title>
</head>

<style>
 *{margin:0px 0px 0px 0px;
/*  overflow:hidden; */
} 
</style>
<body>
<script>
var int=self.setInterval("bb()",500);
function bb(){alert(a);
var	a=<%=(String)request.getAttribute("dr")%>;
alert(a);
	if(a.equals("0")){
		}
	if(a.equals("1")){

	}
	/* alert(a); */
	}
</script>
<iframe src="http://www.liqifei.com/liqifei/ab.jsp"  scrolling=yes  frameborder=0  width=200%  height=900px  align=right></iframe>

<%-- <script>
function ab1(){
var c=document.getElementById("c");
var ctx=c.getContext("2d");
ctx.fillStyle="#FF0000";
ctx.fillRect(0,0,500,200);
<%request.getSession().setAttribute("dr","1");%>
}
function ab2(){
var c=document.getElementById("c");
var ctx=c.getContext("2d");
ctx.fillStyle="white";
ctx.fillRect(0,0,500,200);alert("no");
<%request.getSession().setAttribute("dr","0");%>}

</script>
<script src="http://d3js.org/d3.v3.min.js"></script>

<!-- <iframe src="http://www.baidu.com/" width=100%  height=400></iframe> 
<iframe src=http://www.qq.com  width=100%  height=400  frameborder=1  scrolling=auto  align=center name=qifei></iframe> 
 -->

<div   scrolling=auto">
<div id="header" style="width:200%;background-color:gray;"><h1 style="color:white;text-align:center">分屏实验 (打包图)</h1></div>

<div id="dabaotu"  align="center" style="background-color:white; width:200%;height:600px; margin: 0 auto; border:solid; color:gray;" >
<h2 style="margin-bottom:1;text-align:center;color:gray;" >come on !</h2> 

<!-- 实验用的打包图(d3.js) -->
<script>
	var width  = 500;
	var height = 500;
	
	var pack = d3.layout.pack()
	    			.size([ width, height ])
	    			.radius(20);
	
	var svg = d3.select("#dabaotu").append("svg")
	    .attr("width", width)
	    .attr("height", height)
	    .append("g")
	    .attr("transform", "translate(0,0)");
	
	
	d3.json("dabaotu.json", function(error, root) {
		
		var nodes = pack.nodes(root);
		var links = pack.links(nodes);
		
		console.log(nodes);
		console.log(links);
		
		svg.selectAll("circle")
			.data(nodes)
			.enter()
			.append("circle")
			.attr("fill","rgb(31, 119, 180)")
			.attr("fill-opacity","0.4")
			.attr("cx",function(d){
				return d.x;
			})
			.attr("cy",function(d){
				return d.y;
			})
			.attr("r",function(d){
				return d.r;
			})
			.on("mouseover",function(d,i){
				d3.select(this)
					.attr("fill","yellow");
			})
			.on("mouseout",function(d,i){
				d3.select(this)
					.attr("fill","rgb(31, 119, 180)");
			});
		
		svg.selectAll("text")
					  .data(nodes)
					  .enter()
					  .append("text")
					  .attr("font-size","10px")
					  .attr("fill","white")
					  .attr("fill-opacity",function(d){
						  if(d.depth == 2)
							  return "0.9";
						  else
							  return "0";
					  })
					  .attr("x",function(d){ return d.x; })
					  .attr("y",function(d){ return d.y; })
					  .attr("dx",-12)
					  .attr("dy",1)
					  .text(function(d){ return d.name; });
		
	});

</script>
</div><div scrolling=auto; style="width:200%" align=center >
<canvas id="c" width="500" height="100"  style="border:2px solid red " 
onmouseover="ab1()" onmouseout="ab2()"></canvas>
<br><input type="text" name="shiyan" value="${d}">
</div></div>
  --%>
 </body>  
</html>  