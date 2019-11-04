/**
 * 库存统计
 * @type {((...tabularData: any[]) => void) | string | []}
 */
var table = null;
layui.use('table', function() {
    table = layui.table;
    form = layui.form
    /**
     * 数据表格
     */
    table.render({
        id: 'test',
        method: 'post',
        elem: '#test',
        contentType: 'application/json',
        dataType: 'json',
        loading: 'true',
        url: user.defaultUrl + myurl.dingdanList ,
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
        // even: true,
        size: 'lg',
        page: true,
        limit: 8,
        limits: [7, 10, 15],
        cols: [[
            {field:'id', title: 'ID', width:'10%', sort: true, align: 'center', fixed: true}
            , {field: 'type', title: '货物状态', align: 'center', templet: '#manager_type'}
            ,{field:'name',title: '货物名', align: 'center'}
            ,{field:'num', title: '数量', align: 'center'}
            ,{field:'util', title: '单位', align: 'center'}
            ,{field:'dataline', title: '订单创建日期', align: 'center'}
            ,{fixed: 'right', title:'操作',align: 'center', toolbar: '#barDemo', width:150}
        ]],
        /**
         * 回调函数
         * @param res
         * @param curr
         * @param count
         */
        done: function(res, curr, count) {
            console.log(res);
            /**
             * 添加信息
             */
            common.form({
                form: 'insert',
                type:{
                    title:'货物状态',
                    type:'select',
                    data:{
                        出库:0,
                        入库:1
                    }
                }, name:{
                    title:'货物名',
                    type:'select',
                    data:{
                        燃油:'燃油',
                        柴油:'柴油',
                        机油:'机油'
                    }
                },num:{
                    title:'数量',
                    type:'select',
                    data:{
                        10:10,
                        20:20,
                        30:30
                    }
                },util:{
                    title:'单位',
                    type:'select',
                    data:{
                        升:'升',
                        顿:'顿'
                    }
                },button:{
                    submit:'立即添加',
                    submitFilter:'insert',
                    back:'取消',
                    backClick:'insertNo()'
                }
            })
        },
    });
    common.reload('test', {type: 1})
    table.on('tool(test)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                req.post(myurl.dingdanDel, {id: data.id} , false)
                layer.close(index);
                table.reload('test');
            });
        }
    });
    /**
     * 一键添加
     */
    form.on('submit(insert)', function(data){
        // console.log(data.field.type)
        console.log(data.field)
        console.log(req.post(myurl.dingdanAdd, data.field, false))
        alert(data.field)
        req.post(myurl.dingdanAdd, data.field, false)
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
        area: ['600px', '500px'],
        cancel: function(index, layero) {
            layer.close(index);
            return false;
        },
        content: $(".insert").append(),
        id: "alertcenterdiv",
    });
}