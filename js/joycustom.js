    $(document).ready(function() {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });


/*判断浏览器是手机还是电脑,显示对应的黄金交易页面*/
    function browserRedirect() {


        //location.reload();
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        var iframesrc=document.getElementById("iframed");
        var change=document.getElementById('changePercentage');

        var wid=window.innerWidth
        if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)||wid<500) {
            change.innerHTML="<div id=\"changePercentage\" style=\"width:310px;height:490px; overflow:hidden;margin:0 auto;\" >\n" +
                "            <iframe id=\"iframed\" src=\"http://m.dyhjw.com/au9999.html/\"\n" +
                "                    scrolling=\"no\" frameborder=\"0\" style=\"position:relative;top:-70px;left:0px;width:550px;height:1200px;zoom:0.56;\" >\n" +
                "\n"
                "            </iframe>\n" +
                "        </div>";



        }else{
            change.innerHTML=" <div id=\"changePercentage\" style=\"width:820px;height:750px; overflow:hidden;margin: 0 auto; /*transform: scale(0.5,0.75);*/ \" >\n" +
                "            <iframe id=\"iframed\" src=\"http://www.dyhjw.com/au9999.html/\"\n" +
                "                    scrolling=\"no\" frameborder=\"0\" style=\"position:relative;top:-938px;left:-260px;width:1100px;height:1200px;\" >\n" +
                "\n" +
                "            </iframe>\n" +
                "        </div>";

        }
    }

    /*默认显示评论内容*/
    function  showComment(url) {

        var time=new Date().toLocaleString();
        var ul=document.getElementById("comment");

        var li="";

    $.ajax({

        type : "get",
        async:false,
        url : url,
        dataType : "json",//jsonp数据类型
        // dataType : "jsonp",//jsonp数据类型
        // jsonp: "jsonpCallback",//服务端用于接收callback调用的function名的参数
        success : function(data){
          // console.log(data);
            for(var i=0;i<data.length;i++){
                li +="<li style='position: relative'><p><span class='cname fl' > 昵称："+data[i].name+"</span><span class='msg'>"+data[i].comment+"</span><span class='datetime' style='float: right'>评论时间："+data[i].time+"</span></p></li>"

            }
            ul.innerHTML=li;

        },
        error:function(){
            console.log("ajax请求出错！");
        }

    });


    }

/*点击隐藏写评论区*/
 $("#show").click(function () {
 var showValue=document.getElementById("show").innerHTML;
     var showAllvalue=document.getElementById("showAll").innerHTML;
     //console.log(showValue);
     if(showValue=="显示评论"){
         document.getElementById("show").innerHTML="隐藏评论";
         $("#comment").toggle(2000);
     }else{
         document.getElementById("show").innerHTML="显示评论";
         $("#comment").toggle(2000);
     }

 });
 $("#showAll").click(function () {
     var showValue=document.getElementById("show").innerHTML;
     var showAllvalue=document.getElementById("showAll").innerHTML;
    // console.log(showValue);
     if(showAllvalue=="显示全部"){
         document.getElementById("showAll").innerHTML="显示最新";
        // $("#comment").toggle(2000);
         showComment("http://118.24.20.235:8888/gacgolder");

     }else{
         document.getElementById("showAll").innerHTML="显示全部";
       // $("#comment").toggle(2000);
         showComment("http://118.24.20.235:8888/gcgolder");
     }
 });


  $("#sunM").on('submit',function () {
      saveCommit();
      event.preventDefault();
  });
    function saveCommit() {
     var name=document.getElementById("Cname").value.replace(/\s+/g, '%20').replace('&','%26');
     var value=document.getElementById("Ccomment").value.replace(/\s+/g, '%20').replace('&','%26');
     var auth="pub";
     //var val=$("input:radio[name="authority"]:checked").val();
        var val= $('.cradio:checked').val();
     var authValue=document.getElementsByName("authority")[0].value;
     console.log(val);

     /*判断有没有选择仅主人可见，如果选择就将auth权限改为pri*/
       if(val=="pri"){
           auth="pri"
       }
       if(name==""){
        alert("昵称不能为空！")
       }else if(value==""){
           alert("评论不能为空！");

       }else {
           $.ajax({
               type:'get',
               url:"http://118.24.20.235:8888/acgolder",

               data:{
                   name:name,
                   comment:value,
                   authority:auth
               },
               dataType : "text",
               success:function (data) {
                   // console.log(data);
                   if(data.indexOf("success")!=-1){
                       alert("添加评论成功！");
                       /*添加评论成功以后从新加载显示新添加的评论*/
                       document.getElementById("Cname").value="";
                       document.getElementById("Ccomment").value="";
                       showComment("http://118.24.20.235:8888/gcgolder");
                   }else{
                       alert("添加评论失败！")
                   }


               },
               error:function () {
                   alert("添加评论区ajax请求出错！添加评论失败！");

               }


           })
       }



    }

function TradeIndex() {

    $.ajax({
        type:"get",
        async:"true",
        url:"http://118.24.20.235:8888/gtxgolder",
       /* dataType:"json",*/
        data:{},
        success:function (data) {
            console.log(data);
            if(data == "" || data == null || data == undefined ){
                console.log("黄金指数后台响应为空！")
            }else {
                document.getElementById("TradingIndexs").innerHTML = data;
            }
        },
        error:function () {
         console.log("ajax请求出错！")
        }
    })


}

//页面加载完成后执行方法
document.onreadystatechange = function(){
    browserRedirect();
    showComment("http://118.24.20.235:8888/gcgolder");
    TradeIndex();
}
