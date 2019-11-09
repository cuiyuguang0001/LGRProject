/**
 * layui数据表格
 * 进出港信息
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
        even: true,
        size: 'lg',
        id: 'test',
        page: true,
        limit: 8,
        limits: [7, 10, 15],
        cols: [[
            {field: 'id', width: '8%', title: 'ID', sort: true, align: 'center', fixed: true}
            , {field: 'type', width: '10%', title: '出入状态', align: 'center', templet: '#manager_type'}
            , {field: 'dataline',title: '时间', width:'15%',align: 'center'}
            , {field: 'people',title: '申请人', align: 'center'}
            , {field: 'boat', title: '申请船只', minWidth: 100, align: 'center'}
            , {field: 'oil',title: '所需燃油', sort: true, align: 'center'}
            , {field: 'status', title: '状态', sort: true, align: 'center', templet: '#manager_status'}
        ]],
        /**
         * 回调函数
         * @param res
         * @param curr
         * @param count
         */
    });
});