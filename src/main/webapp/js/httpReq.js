document.write("<script language=javascript src='static/jQuery/jquery-3.4.1.min.js'></script>");
document.write("<script language=javascript src='static/layui/layui.js'></script>");

var user = {
    defaultUrl:'http://localhost:9010'
}

var myurl = {
    //显示所有用户
    userList: '/user/userList',
    //登陆
    login: '/user/login',
    //显示所有船只
    boatList: '/boat/boatList',
    //显示所有订单
    dingdanList: '/dingdan/dingdanList',
    //显示所有库存
    kucunList: '/kucun/kucunList',
}

var req = {
    post: function (url,data,async) {
        r = null;
        $.ajax({
            url: user.defaultUrl + url,
            type: 'POST',
            data: data,
            async: async == null ? false : async,
            success: function(data){
                r = data;
            }
        })
        if(r == null)
        {
            r == '404:数据请求失败'
        }
        return r;
    }
}
