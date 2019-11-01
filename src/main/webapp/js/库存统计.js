/**
* 库存统计
* @type {((...tabularData: any[]) => void) | string | []}
*/
layui.use('table', function() {
    var table = layui.table;
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
        url: user.defaultUrl + myurl.kucunList ,
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
            ,{field:'name',title: '货物名', align: 'center'}
            ,{field:'num',title: '剩余数量', align: 'center'}
            ,{field:'util', title: '单位', align: 'center'}
            ,{field:'status', title: '存货状态', align: 'center', templet:'#manager_status'}
        ]],
        /**
         * 回调函数
         * @param res
         * @param curr
         * @param count
         */
        done: function(res, curr, count) {
            console.log(res);

        },
    });
});
