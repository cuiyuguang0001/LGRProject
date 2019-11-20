/**
 * layui数据表格
 * 进出航审查
 */
var index = 10;
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
        where: {
            "status": 1,
        },
        url: user.defaultUrl + myurl.planList,
        toolbar: '#toolbarDemo',
        title: '用户数据表',
        totalRow: true,
        initSort: {
            field: 'id' //排序字段，对应 cols 设定的各字段名
            , type: 'asc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
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
            // {type: 'checkbox', fixed: 'left'},
            {field: 'id', width: '8%', title: 'ID', sort: true, align: 'center', fixed: true}
            , {field: 'type', width: '10%', title: '出入状态', align: 'center', templet: '#manager_type'}
            , {field: 'dataline',title: '时间', width:'15%',align: 'center'}
            , {field: 'people',title: '申请人', align: 'center'}
            , {field: 'boat', title: '申请船只', minWidth: 100, align: 'center'}
            , {field: 'oil',title: '所需燃油', sort: true, align: 'center'}
            , {field: 'tuolun',title: '拖轮名称', sort: true, align: 'center'}
            , {field: 'status', title: '状态', sort: true, align: 'center', templet: '#manager_status'}
            , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 250, align:'center'}
        ]],
        /**
         * 回调函数
         * @param res
         * @param curr
         * @param count
         */
        done: function(res, curr, count) {
            console.log(res);
            common.form({
                form: 'tuolun',
                name:{
                    title:'拖轮名称',
                    type:'text',
                    verify:'required'
                },button:{
                    submit:'立即添加',
                    submitFilter:'tuolun',
                    back:'取消',
                    backClick:'insertNo()'
                }
            })
            common.form({
                form: 'insertsh',
                type:{
                    title:'出航状态',
                    verify:'required',
                    type:'select',
                    data:{
                        0:'出航',
                        1:'入航'
                    }
                },people:{
                    title:'申请人',
                    verify:'required',
                    type:'text',
                }, boat:{
                    title:'申请船只',
                    type:'text',
                    verify:'required'
                }, oil:{
                    title:'所需燃油',
                    type:'text',
                    verify:'required'
                },button:{
                    submit:'立即添加',
                    submitFilter:'insertsh',
                    back:'取消',
                    backClick:'insertNo()'
                }
            })
        },
    });
    common.reload('test', {status: 0})
    //工具栏事件
    table.on('tool(test)', function(obj){
        if(obj.event === 'getCheckData'){
            // 添加拖轮信息
            index = layer.open({
                type: 1,
                title: '拖轮名称',
                closeBtn: false,
                shade: 0.5,
                id: 'YuanGongUpdate', //设定一个id，防止重复弹出,
                btnAlign: 'c',
                // btn:['取消'],
                area: ['36%', '40%'],
                cancel: function(index, layero) {
                    layer.close(index);
                    $(".tuolun").css("display", "none");
                    return false;
                },
                content: $(".tuolun").append(),
            });
            var p = req.post(myurl.planEditStatus, {id: obj.data.id, status: 1, type: obj.data.type, tuolun: obj.data.tuolun}, false)
            console.log(obj.data.tuolun)
            table.reload('test');
        }else if(obj.event === "getCheckDataNo"){
             var q = req.post(myurl.planEditStatus, {id: obj.data.id, status: 2, type: obj.data.type}, false)
            alert("\" " + obj.data.boat + "\" " +  "已被拒绝通过");

            location.reload();
        }else if(obj.event === "insertsh"){
            index = layer.open({
                    type: 1,
                    title: '拖轮名称',
                    closeBtn: false,
                    shade: 0.5,
                    id: 'YuanGongUpdate', //设定一个id，防止重复弹出,
                    btnAlign: 'c',
                    // btn:['取消'],
                    area: ['36%', '88%'],
                    cancel: function(index, layero) {
                        layer.close(index);
                        $(".insertsh").css("display", "none");
                        return false;
                    },
                    content: $(".insertsh").append(),
            })

        }
    });
    form.on('submit(insertsh)', function(data) {
        var a = req.post(myurl.planAdd, data.field, false);
        console.log(a)
        return  false;
    })
    form.on('submit(tuolun)', function(data) {
        req.post(myurl.planEditStatus, data.field, false);
    })

});
function insertNo() {
    layer.close(index)
    table.reload('test');
}