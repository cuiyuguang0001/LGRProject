function update(){
    layer.open({
        type: 1,
        title: '部门信息',
        closeBtn: false,
        shade: 0.5,
        id: 'YuanGongUpdate', //设定一个id，防止重复弹出,
        btnAlign: 'c',
        offset: '80px',
        anim: 5,
        area: ['600px', '600px'],
        cancel: function(index, layero) {
            layer.close(index);
            $(".update").css("display", "none");
            return false;
        },
        content: $(".update").append(),
        id: "alertcenterdiv",
    });
}
function updateTrue(){
    var id = $("#update_id").val();
    console.log(id)
    var name = $("#update_name").val();
    console.log(name)
    var money = $("#update_money").val();
    console.log(money)
    var people = $("#update_people").val();
    console.log(people)
    req.post(myurl.boatEdit, {name: name, money: money, people: people, id: id}, false)
    alert("点击刷新页面")
}

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