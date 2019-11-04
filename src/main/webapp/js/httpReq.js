document.write("<script language=javascript src='static/jQuery/jquery-3.4.1.min.js'></script>");
document.write("<script language=javascript src='static/layui/layui.js'></script>");

var user = {
    defaultUrl:'http://localhost:9010'
}

var myurl = {
    //user表操作
    userList: '/user/userList',//模糊查询参数 name(传不传都行)
    userAdd: '/user/userAdd',//添加 参数 name,age,sex,sal,post
    userEdit: '/user/userEdit',//修改 参数 id name age sex sal post
    userDel: '/user/userDel',//删除 参数 id
    userListName: '/user/userListName',//查询所有员工名字
    //登陆
    login: '/user/login', //参数 username pwd
    //boat表操作
    boatList: '/boat/boatList',
    boatAdd: '/boat/boatAdd',//添加 参数 name money people(int)
    boatEdit: '/boat/boatEdit',//修改 参数 name money people(int)
    boatDel: '/boat/boatDel',//删除 参数 id
    //dingdan表操作
    dingdanList: '/dingdan/dingdanList',
    dingdanAdd: '/dingdan/dingdanAdd',//添加 参数 type name num util
    dingdanDel: '/dingdan/dingdanDel',//删除 参数 id
    //kucun表操作
    kucunList: '/kucun/kucunList',
    //plan表操作
    planList: '/plan/planList',
    planAdd: '/plan/planAdd',//添加 参数 type people(int) boat(int) oil
    planEditStatus: '/plan/planEditStatus',//修改状态 参数 status id
    planDel: '/plan/planDel',//删除 参数 id
    //weixiu表操作
    weixiuList:'/weixiu/weixiuList',
    weixiuAdd:'/weixiu/weixiuAdd',
    weixiuEditStatus:'/weixiu/weixiuEditStatus',
    weixiuDel:'/weixiu/weixiuDel',
    //tuolun表操作
    tuolunList:'/tuolun/tuolunList',
    tuolunAdd:'/tuolun/tuolunAdd',
    tuolunEditStatus:'/tuolun/tuolunEditStatus',
    tuolunDel:'/tuolun/tuolunDel'
}

var req = {
    post: function (url,data,async) {
        r = null;
        $.ajax({
            url: user.defaultUrl + url,
            type: 'POST',
            data: JSON.stringify(data),
            // data: data,
            dataType: 'json',
            contentType: 'application/json',
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

var common = {
    //text语法
    //id(id标识名):{
    //      title:该行的名字
    //      type:text，
    //      verify:lay-verify的值，如果是required就是必填项
    // }

    //radio语法
    //id(id标识名):{
    //      title:该行的名字,
    //      type:radio
    //      value:[]数组，与radioTitle一一对应
    //      radioTitle:[]数组，与value一一对应
    // }

    //select语法
    //id(id标识名):{
    //      title:该行的名字,
    //      type:select
    //      data:{}json key(显示的行)-value(option中value的值)
    //      radioTitle:[]数组，与value一一对应
    //      verify:lay-verify的值，如果是required就是必填项
    // }
    form: data => {
        $('#' + data.form).empty()
        for(let key in data)
        {
            let myId = data.form + "_" + key
            switch (data[key].type) {
                case 'text':{
                    $('#' + data.form).append("<div class='layui-form-item'>\n" +
                        "<label class='layui-form-label'>"+ data[key].title +"</label>\n" +
                        "<div class='layui-input-inline '>\n" +
                        "<input type='"+ data[key].type +"' id='"+  myId +"' name='" + key + "' " +
                        "lay-verify='"+ data[key].verify +"' autocomplete='off' "+ (data[key].verify == "required" ? "required" : "") +"\n" +
                        "class='layui-input'/>" +
                        "</div>\n" + "</div>\n")
                    break;
                }
                case 'radio':{
                    $('#' + data.form).append("<div class='layui-form-item'>\n" +
                        "<label class='layui-form-label'>"+ data[key].title +"</label>\n" +
                        "<div class='layui-input-block' id='myRadio-"+  myId +"'>\n" +
                        "</div>\n" + "</div>\n")
                    for(let i = 0; i < data[key].value.length; i++)
                    {
                        $('#myRadio-'+  myId).append("<input type='"+ data[key].type +"' name='" + key + "' value='"+ data[key].value[i] +"' id='"+  data.form + "_" + key +"' title='" + data[key].radioTitle[i] + "'/>\n")
                    }
                    break;
                }
                case 'select':{
                    $('#' + data.form).append("<div class='layui-form-item'>\n" +
                        "<label class='layui-form-label'>"+ data[key].title +"</label>\n" +
                        "<div class='layui-input-inline '>\n" +
                        "<select id='"+  myId +"' name='" + key + "' lay-verify='" + data[key].verify + "'></select>" +
                        "</div>\n" + "</div>\n")
                    for(let key2 in data[key].data)
                    {
                        $('#' + myId).append("<option value='" + key2 + "'>" + data[key].data[key2] + "</option>")

                    }
                    break;
                }
            }
            $('#' + myId).addClass(data[key].class)
            if(data[key].disable == true)
                $('#' + myId).attr('disabled', "")
        }


        $('#' + data.form).append("<div class='layui-form-item'>\n" +
            "<button id='Yes' style='position: absolute; margin-left:80px; margin-bottom: 15px;' class='layui-btn' lay-submit \n" +
            "lay-filter='" + data.button.submitFilter + "' onclick='" + data.button.submitClick + "'>" + data.button.submit + "</button>\n" +
            "<button id='No' type='button' style='position: absolute; margin-left:360px; margin-bottom: 15px; background:red' class='layui-btn' onclick='" + data.button.backClick + "'>" + data.button.back + "</button>\n" +
            "</div>")
        form.render()
    },

    reload:(id, data) => {
        table.reload(id, {
            page:{
                curr:1
            },
            where:data,
        })
    }
}
