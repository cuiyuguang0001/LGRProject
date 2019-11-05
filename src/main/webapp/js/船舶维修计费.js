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
            /**
             * 添加信息
             */
            common.form({
                form: 'insert',
                boat:{
                    title:'机器名',
                    type:'text',
                    verify:'required'
                }, people:{
                    title:'负责人',
                    type:'text',
                    verify:'required'
                },status:{
                    title:'维修状态',
                    type:'select',
                    data:{
                        已维修:'已维修',
                        未维修:'未维修'
                    }
                },money:{
                    title:'维修金额',
                    type:'text',
                    verify:'required'
                },button:{
                    submit:'立即添加',
                    submitFilter:'insert',
                    back:'取消',
                    backClick:'insertNo()'
                }
            })
            /**
             * 修改信息
             */
            common.form({
                form: 'update',
                id:{
                    title:'ID',
                    type:'text',
                    class:'layui-btn-disabled',
                    disable:true,
                    verify:'required'
                }, boat:{
                    title:'机器名',
                    type:'text',
                    verify:'required'
                }, people:{
                    title:'负责人',
                    type:'text',
                    verify:'required'
                },status:{
                    title:'维修状态',
                    disable: true,
                    class:'layui-btn-disabled',
                    type:'text',
                },dataline:{
                    title:'维修时间',
                    disable: true,
                    class:'layui-btn-disabled',
                    type:'text',
                }, money:{
                    title:'维修金额',
                    type:'text',
                    verify:'required'
                },button:{
                    submit:'立即添加',
                    submitFilter:'insert',
                    back:'取消',
                    backClick:'insertNo()'
                }
            })
        }
    });
    /**
     * 监听行工具事件
     */
    table.on('tool(test)', function(obj){
        var data = obj.data;
        //console.log(obj)
        if(obj.event === 'del'){
            layer.confirm('真的删除行么', function(index){
                req.post(myurl.weixiuDel, {id: data.id} , false)
                layer.close(index);
                table.reload('test');
            });
        } else if(obj.event === 'edit'){
            form.val('update', {
                id : data.id,
                boat: data.boat,
                money: data.money,
                people: data.people,
                status: data.stauts == 1 ? '已维修' : '未维修',
                dataline: data.dataline,
            });
        }
    })
    /**
     * 一键添加
     */
    form.on('submit(insert)', function(data){
        req.post(myurl.weixiuAdd, data.field, false)
    });
    /**
     * 一键修改
     //  */
    form.on('submit(update)', function(data){
        req.post(myurl.userEdit, data.field, false)
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
