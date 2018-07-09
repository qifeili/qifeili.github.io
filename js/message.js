/*保存留言到localStroe*/

var data='';var dataHtml='';
function save() {
   //var messsage= document.querySelector("#post textarea").value;
   //var messsage=document.getElementById('transition').value;
   var messsage=document.getElementById('transition').value;
   var time=new Date().toLocaleString();

   localStorage.setItem(time,messsage+"|"+time);
  // console.log(localStorage.length);
    dataHtml="";
    document.getElementById('comment').innerHTML="";

   for(var i=localStorage.length-1;i>=0;i--){

      data=localStorage.getItem(localStorage.key(i)).split("|");
        //console.log(data);
        dataHtml+="<p ><span class='msg'>"+data[0]+"</span><span class='datetime' style='float: right'>"+data[1]+"</span></p>"
        document.getElementById('comment').innerHTML=dataHtml;

   }
    document.getElementById('transition').value="";

  // console.log(messsage);
}


function clearD() {
   if(localStorage.length>0){
     if( window.confirm("是否确认清空？")){
         localStorage.clear();
         dataHtml="";
         document.getElementById('comment').innerHTML="";
     }

   }

}
//$('#detail').animate({scrollTop: $("tr#"+id).offset().top}, 500);
//点击黄金交易定位到对应位置
function ScrollTop() {
   // console.log($('#detail').offset().top);
    $('html, body').animate({scrollTop: $('#detail').offset().top}, 1000)
    /*scroolTop:设置匹配元素的滚动条的垂直位置;$('#detail').offset().top获取元素相对于页面顶部的高度*/

}

/*function changeFrameHeight(){
    var ifm= document.getElementById("main");
    ifm.height=document.documentElement.clientHeight;

}

window.onresize=function(){
    changeFrameHeight();
    console.log('hahha');

}
changeFrameHeight();*/
