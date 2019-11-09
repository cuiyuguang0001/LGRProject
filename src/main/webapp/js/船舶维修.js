/**
 * 船舶信息
 */
var table = null;
layui.use('table', function() {
    table = layui.table;
    form = layui.form
    /**
     * 方法级渲染
     */
    table.render({
        method: 'post',
        elem: '#test',
        contentType: 'application/json',
        dataType: 'json',
        loading: 'true',
        url: user.defaultUrl + myurl.boatList ,
        toolbar: '#toolbarDemo',
        title: '用户数据表',
        totalRow: true,
        initSort: {
            field: 'id' //排序字段，对应 cols 设定的各字段名
            ,type: 'asc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
        },
        text: {
            none: '小小数据去哪了？'
        },
        autoSort: 'true',
        // skin: 'nob',//是否显示行列渲染
        even: true,
        size: 'lg',
        id: 'test',
        page: true,
        limit: 8,
        limits: [7, 10, 15],
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
            /**
             * 添加信息
             */
            common.form({
                form: 'insert',
                name:{
                    title:'船名',
                    type:'text',
                    verify:'required'
                },money:{
                    title:'价格',
                    type:'text',
                    verify:'required'
                },people:{
                    title:'管理者',
                    type:'select',
                    data:{
                        G1:'G1',
                        G2:'G2',
                        G3:'G3',
                        G4:'G4',
                        G5:'G5',
                        G7:'G7',
                        G6:'G6',
                    }
                },button:{
                    submit:'立即添加',
                    submitFilter:'insert',
                    back:'取消',
                    backClick:'insertNo()'
                }
            });
            /**
             * 修改信息
             */
            common.form({
                form: 'update',
                id:{
                    title:'ID',
                    type:'text',
                    class:'layui-btn-disabled',
                    disable :true,
                    verify:'required'
                },name:{
                    title:'船名',
                    type:'text',
                    verify:'required'
                },money:{
                    title:'价格',
                    type:'text',
                    verify:'required'
                },people:{
                    title:'管理者',
                    type:'select',
                    data:{
                        G1:'G1',
                        G2:'G2',
                        G3:'G3',
                        G4:'G4',
                        G5:'G5',
                        G7:'G7',
                        G6:'G6',
                    }
                },dataline: {
                    title: '购买时间',
                    type:'text',
                    class:'layui-btn-disabled',
                    disable :true,
                    verify:'required'
                },updatedata: {
                    title: '维修时间',
                    type:'text',
                    class:'layui-btn-disabled',
                    disable :true,
                    verify:'required'
                },num:{
                    title: '出航次数',
                    type:'text',
                    class:'layui-btn-disabled',
                    disable :true,
                    verify:'required'
                }, status:{
                    title: '处航状态',
                    type:'text',
                    class:'layui-btn-disabled',
                    disable :true,
                    verify:'required'
                }, button:{
                    submit:'立即添加',
                    submitFilter:'update',
                    back:'取消',
                    backClick:'updateNo()'
                }
            });
        },
    });
    /**
     * 监听行工具事件
     */
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                req.post(myurl.boatDel, {id: data.id}, false)
                layer.close(index);
                table.reload('test');
            });
        } else if(obj.event === 'edit'){
            form = layui.form
            console.log(data.status)
            form.val('update', {
                id: data.id,
                name: data.name,
                money: data.money,
                people: data.people,
                dataline: data.dataline,
                updatedata: data.updatedata,
                num: data.num,
                status: (data.status == 1 ? '已出航': '待出航'),
            });
        }
    })
    /**
     * 一键添加
     */
    form.on('submit(insert)', function (data) {
        req.post(myurl.boatAdd, data.field, false);
    });
    /**
     * 一键修改
     //  */
    form.on('submit(update)', function(data){
        req.post(myurl.boatEdit, data.field, false)
    });
});
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
        area: ['600px', '400px'],
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
/**
 * 取消——刷新页面
 */
function insertNo() {
    location.reload();
}
function updateNo() {
    location.reload();
}

/**
 * 模糊查询
 */
function findBoat() {
    var name = $("#find").val()
    common.reload('test', {name: name})
}