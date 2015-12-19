
function clockon(bgclock) {
	var now = new Date();
	var year = now.getYear();
	var month = now.getMonth();
	var date = now.getDate();
	var day = now.getDay();
	var hour = now.getHours();
	var minu = now.getMinutes();
	var sec = now.getSeconds();
	var week;
	month = month + 1;
	if (month < 10) {
		month = "0" + month;
	}
	if (date < 10) {
		date = "0" + date;
	}
	if (hour < 10) {
		hour = "0" + hour;
	}
	if (minu < 10) {
		minu = "0" + minu;
	}
	if (sec < 10) {
		sec = "0" + sec;
	}
	var arr_week = new Array("Mon", "Tues", "Wen", "Thur", "Fri", "Sat", "Sun");
	week = arr_week[day];
	var time = "";
	time = year + "year" + month + "month" + date + "day" + week + " " + hour + ":" + minu + ":" + sec;
	if (document.all) {
		bgclock.innerHTML = "" + time + "";
	}
	var timer = setTimeout("clockon(bgclock)", 200);
}
function reload() {
	document.checkCode.src = "image.jsp";
}
function checkemail(email) {
	var str = email;
	var Expression = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	var objExp = new RegExp(Expression);
	if (objExp.test(str) == true) {
		return true;
	} else {
		return false;
	}
}
function checkEmpty(form) {
	if (form.username.value == "") {
		window.alert("用户名不能为空！");
		return false;
	}
	if (form.password.value == "") {
		window.alert("密码不能为空！");
		return false;
	}
	if (form.code.value == "") {
		window.alert("验证码不能为空！");
		return false;
	}
}
function checkUser(form) {
	if (form.username.value == "") {
		window.alert("用户名不能为空！");
		return false;
	}
	if (form.password.value == "") {
		window.alert("密码不能为空！");
		return false;
	}
	if (form.repassword.value == "") {
		window.alert("密码不能为空！");
		return false;
	}
	if (form.password.value != form.repassword.value) {
		window.alert("两次输入密码不一致");
		return false;
	}
	if (form.realname.value == "") {
		window.alert("真实姓名不能为空！");
		return false;
	}
	if (form.email.value == "") {
		window.alert("邮箱不能为空！");
		return false;
	}
	if (!checkemail(form.email.value)) {
		window.alert("邮箱格式不正确！");
		return false;
	}
	if (form.result.value == "") {
		window.alert("验证问题不能为空！");
		return false;
	}
	if (form.code.value == "") {
		window.alert("验证码不能为空！");
		return false;
	}
}
function checkPhoto(form) {
	if (form.photoName.value == "") {
		alert("照片名不能为空！");
		return false;
	}
	if (form.file.value == "") {
		alert("请上传照片！");
		return false;
	}
	if (form.code.value == "") {
		alert("验证码不能为空！");
		return false;
	}
}
function checkUserInfo() {
	alert("登录后才能查看个人相册的哟~");	
}

function checkPhotoPrint(form) {
	if (form.information.value == "") {
		alert("photoPrint is empty");
		return false;
	}
}

function addMore(){
    var td = document.getElementById("more");
    var br= document.createElement("br");
    var input= document.createElement("input");
    var button= document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "移除...";
    
    
    button.onclick = function(){
      td.removeChild(br);
      td.removeChild(input);
      td.removeChild(button);
    }
   
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

function delPhoto(){
	
}