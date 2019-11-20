function Login(){
    var password = $("#password").val();
    var username = $("#username").val();
    var s = req.post(myurl.login,{pwd: password, username: username} , false);
    if(s.ret == 200){
        alert("欢迎回来!")
        window.open("index.html")
    }else {
        alert("账号密码错误!")
    }
}