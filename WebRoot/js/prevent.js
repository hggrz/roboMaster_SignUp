//这段js要放在页面最下方
var h = window.innerHeight,w=window.innerWidth;
//禁用右键 （防止右键查看源代码）
window.oncontextmenu=function(){return false;}
//在本网页的任何键盘敲击事件都是无效操作 （防止F12和shift+ctrl+i调起开发者工具）
window.onkeydown = window.onkeyup = window.onkeypress = function () {
window.event.returnValue = false;
return false;
}
//如果用户在工具栏调起开发者工具，那么判断浏览器的可视高度和可视宽度是否有改变，如有改变则关闭本页面
window.onresize = function () {
if (h != window.innerHeight||w!=window.innerWidth){
window.close();
window.location = "about:blank";
}
}