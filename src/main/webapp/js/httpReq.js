document.write("<script language=javascript src='static/jQuery/jquery-3.4.1.min.js'></script>");

var user = {
    url:'http://localhost:9001',
    sid:''
}

var req = {
    post: function (url,data,async) {
        r = null;
        $.ajax({
            url: user.url + url,
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