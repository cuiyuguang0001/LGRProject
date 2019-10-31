
function tiJiao(){
    if($("#Yes").text() == "立即添加"){
       // var id =  $("#insert_id").val();
       // var name = $("#insert_name").val();
       // var age = $("#insert_age").val();
       // var sex = $("input[name='sex']:checked").val();

        form.on('submit(btnsubmit)'), function(data){
            //表单数据formdata
            var formData = data.field;
            console.log("==========================================")
            console.log(formData);
        }
            alert(8)


    }
}

// function update(){
//     layer.open({
//         type: 1,
//         title: '人员信息',
//         closeBtn: false,
//         shade: 0.5,
//         id: 'YuanGongUpdate', //设定一个id，防止重复弹出,
//         btnAlign: 'c',
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
//     var id = $("#id").val();
//     alert(id);
//     var name = $("#name").val();
//     var age = $("#age").val();
//     var sex = $("#sex").val();
//     var sal = $("#sal").val();
//     var post = $("#post").val();
//     req.post(myurl.userEdit, {name: name, age: age, sex: sex, sal: sal, post: post, id: id}, false)
// }
//
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
// function insertTrue(){
//     var name = $("#insert_name").val();
//     var age = $("#insert_age").val();
//     var sex = $("#insert_sex").val();
//     var sal = $("#insert_sal").val();
//     var post = $("#insert_post").val();
//     req.post(myurl.userAdd, {name: name, age: age, sex: sex, sal: sal, dataline: 1, post: post}, false)
// }