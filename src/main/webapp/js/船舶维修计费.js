/**
 * 船舶维修计费
 */
layui.use('table', function() {
    var table = layui.table;
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
        url: user.defaultUrl + myurl.weixiuList,
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
            {field: 'id',title: 'ID', sort: true, align: 'center', fixed: true}
            , {field: 'boat', title: '机器名', align: 'center'}
            , {field: 'people', title: '负责人', sort: true, align: 'center'}
            , {field: 'status', title: '是否已维修', align: 'center', templet:'#manager_status'}
            , {field: 'dataline', title: '维修时间', minWidth: 100, align: 'center'}
            , {field: 'money', title: '维修金额', sort: true, align: 'center'}
            , {fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
        ]],
        /**
         * 回调函数
         * @param res
         * @param curr
         * @param count
         */
        done: function(res, curr, count) {
            console.log(res);
        }
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
/**
 * 取消——刷新页面
 */
function insertNo() {
    location.reload();
}
function updateNo() {
    location.reload();
}
