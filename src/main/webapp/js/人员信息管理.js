/**
 * layui数据表格
 * 人员信息管理
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
        url: user.defaultUrl + myurl.userList ,
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
            {field:'id', width:'8%', title: 'ID', sort: true, align: 'center', fixed: true}
            ,{field:'name', width:'10%', title: '姓名', align: 'center'}
            ,{field:'age', width:'8%', title: '年龄', sort: true, align: 'center'}
            ,{field:'sex', width:'8%', title: '性别', align: 'center'}
            ,{field:'sal', title: '工资', width: '10%', minWidth: 100, align: 'center'}
            ,{field:'dataline',width: '20%', title: '入职时间', sort: true, align: 'center'}
            ,{field:'status',width: '15%', title: '状态', sort: true, align: 'center', templet:'#manager_status'}
            ,{field:'post', title: '职业', align: 'center'}
            ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
        ]],
        /**
         * 回调函数
         * @param res
         * @param curr
         * @param count
         */
        done: function(res, curr, count){
            console.log(res);
            /**
             * 添加信息
             */
            common.form({
                form: 'insert',
                name:{
                    title:'姓名',
                    type:'text',
                    verify:'required'
                }, age:{
                    title:'年龄',
                    type:'text',
                    verify:'required'
                }, sex:{
                    title:'性别',
                    type:'radio',
                    value:['男','女'],
                    name:'sex',
                    radioTitle:['男','女']
                },sal:{
                    title:'工资',
                    type:'text',
                    verify:'required'
                },post:{
                    title:'职位',
                    type:'select',
                    data:{
                        员工:'员工',
                        经理:'经理'
                    }
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
                }, name:{
                    title:'姓名',
                    type:'text',
                    verify:'required'
                }, age:{
                    title:'年龄',
                    type:'text',
                    verify:'required'
                }, sex:{
                    title:'性别',
                    type:'radio',
                    value:['男','女'],
                    radioTitle:['男','女']
                },sal:{
                    title:'工资',
                    type:'text',
                    verify:'required'
                },status:{
                    title:'状态',
                    type:'text',
                    class:'layui-btn-disabled',
                    disable:true,
                    verify:'required'
                },dataline:{
                    title:'日期',
                    class:'layui-btn-disabled',
                    disable:true,
                    type:'text',
                    verify:'required'
                }, post:{
                    title:'职位',
                    type:'select',
                    data:{
                        员工: '员工',
                        经理: '经理',
                    }
                },button:{
                    submit:'确认修改',
                    submitFilter:'update',
                    back:'取消',
                    backClick:'updateNo()'
                }
            })
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
                req.post(myurl.userDel, {id: data.id} , false)
                table.reload('test');
            });
        } else if(obj.event === 'edit'){
            form.val('update', {
                id : data.id,
                name: data.name,
                age: data.age,
                sex: data.sex == '男' ? '男' : '女',
                sal: data.sal,
                status: data.stauts == 1 ? '工作中' : '未工作',
                dataline: data.dataline,
                post: data.post,
            });
        }
    })
    /**
     * 一键添加
     */
    form.on('submit(insert)', function(data){
        req.post(myurl.userAdd, data.field, false)
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

/**
 * 模糊查询
 */
function findUserName(){
    var name = $("#find").val();

        common.reload('test', {name, name})
}



