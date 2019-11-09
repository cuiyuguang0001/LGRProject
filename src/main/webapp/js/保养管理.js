/**
 * 船舶维修计费
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
        where: {'type': 1},
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
            {field: 'id', title: 'ID', sort: true, align: 'center', fixed: true}
            , {field: 'boat', title: '机器名', align: 'center'}
            , {field: 'people', title: '负责人', sort: true, align: 'center'}
            , {field: 'dataline', title: '维修时间', minWidth: 100, align: 'center'}
            , {field: 'money', title: '维修金额', sort: true, align: 'center'}
            , {field: 'type', title: '船舶状态', sort: true, align: 'center', templet: '#manager_type'}
        ]],
        /**
         * 回调函数
         * @param res
         * @param curr
         * @param count
         */
    });
});