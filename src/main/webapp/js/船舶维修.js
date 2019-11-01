/**
 * 船舶信息
 */
layui.use('table', function() {
    var table = layui.table;
        layer = layui.layer,
        form = layui.form
    table.render({
        method: 'post',
        elem: '#test',
        contentType: 'application/json',
        dataType: 'json',
        url: user.defaultUrl + myurl.boatList,
        toolbar: '#toolbarDemo',
        title: '用户数据表',
        totalRow: true,
        initSort: {field: 'id', type: 'asc'},
        text: {none: '小小数据去哪了？'},
        size: 'lg',
        page: true,
        limit: 8,
        limits: [8, 10, 15],
        cols: [[
            {field: 'id', width: '8%', title: 'ID', sort: true, align: 'center', fixed: true}
            , {field: 'name', width: '10%', title: '船名', align: 'center'}
            , {field: 'money', width: '8%', title: '价格', sort: true, align: 'center'}
            , {field: 'people', width: '10%', title: '管理者', align: 'center'}
            , {field: 'dataline', width: '18%', title: '购买时间', align: 'center'}
            , {field: 'updatedata', width: '18%', title: '最后维修时间', align: 'center'}
            , {field: 'num', width: '8%', title: '出航次数', align: 'center'}
            , {field: 'status', width: '10%', title: '出航状态', align: 'center', templet: '#manager_status'}
            , {fixed: 'right', title: '操作', toolbar: '#barDemo', align: 'center'}
        ]],
        done: function (res, curr, count) {
            console.log(res);
            common.form({
               form: 'insert',
                name:{
                    title:'船名',
                    type:'text',
                    verify:'required'
                }, money:{
                    title:'价格',
                    type:'text',
                    verify:'required'
                }, people:{
                    title:'管理者',
                    type:'select',
                    data:{
                        黎明:'黎明',
                        白居易:'白居易',
                        涛哥:'涛哥',
                    }
                },num:{
                    title:'出航次数',
                    type:'text',
                    verify:'required'
                },
            });
        },
    });
    /**
     * 监听行工具事件
     */
    table.on('tool(test)', function(obj){
        var data = obj.data;
        //console.log(obj)
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                alert(data.id)
                req.post(myurl.boatDel, {id: data.id} , false)
                layer.close(index);
                table.reload('test');
            });
        } else if(obj.event === 'edit'){
            form = layui.form
            console.log(data.status)
            form.val('example', {
                "id": data.id,
                'name': data.name,
                'money': data.money,
                'people': data.people,
                'dataline': data.dataline,
                'updatedata': data.updatedata,
                'num': data.num,
                'status': (data.status == 1 ? '出航': '待出航'),
            });
            update();
        }
    })
});

// function update(){
//     layer.open({
//         type: 1,
//         title: '部门信息',
//         closeBtn: false,
//         shade: 0.5,
//         id: 'YuanGongUpdate', //设定一个id，防止重复弹出,
//         btnAlign: 'c',
//         offset: '80px',
//         anim: 5,
//         area: ['600px', '600px'],
//         cancel: function(index, layero) {
//             layer.close(index);
//             $(".update").css("display", "none");
//             return false;
//         },
//         content: $(".update").append(),
//         id: "alertcenterdiv",
//     });
// }
// function updateTrue(){
//     var id = $("#update_id").val();
//     console.log(id)
//     var name = $("#update_name").val();
//     console.log(name)
//     var money = $("#update_money").val();
//     console.log(money)
//     var people = $("#update_people").val();
//     console.log(people)
//     req.post(myurl.boatEdit, {name: name, money: money, people: people, id: id}, false)
//     alert("点击刷新页面")
// }
//
/**
 * 添加信息弹窗
 */
function insert(){
    layer.open({
        type: 1,
        title: '添加信息',
        closeBtn: false,
        shade: 0.5,
        id: 'YuanGongUpdate', //设定一个id，防止重复弹出,
        btnAlign: 'c',
        area: ['600px', '600px'],
        cancel: function(index, layero) {
            layer.close(index);
            $(".insert").css("display", "none");
            return false;
        },
        content: $(".insert").append(),
        id: "alertcenterdiv",
    });
}
/**
 * 修改信息弹窗
 */
function update(){
    layer.open({
        type: 1,
        title: '人员信息',
        closeBtn: false,
        shade: 0.5,
        id: 'YuanGongUpdate', //设定一个id，防止重复弹出,
        btnAlign: 'c',
        area: ['600px', '630px'],
        cancel: function(index, layero) {
            layer.close(index);
            $(".update").css("display", "none");
            return false;
        },
        content: $(".update").append(),
        id: "alertcenterdiv",
    });
}