/*layui-JS简单的通用方法 date:2017-11-22~至今 @Author:zf;@mailbox:546558392@qq.com;*/

//-----[文本框写入value](元素，value)
function TextBoxWrite(element, value) {
	element.val(value);
}
//-----[END][写入value]

//-----[写入html]
function HtmlWrite(element, value) {
	element.html(value);
}
//-----[END][写入html]

//-----[复选框选中元素](class_name[类名]，arr[数组])[2018-12-14]
function Selected_CheckBox(class_name, arr) {
	$('input:checkbox[class=' + class_name + ']').removeAttr("checked");
	$('input:checkbox[class=' + class_name+ ']').each(function(i) {
		for(j = 0; j < arr.length; j++) {
			if($(this).val() == arr[j]) {
				$(this).attr("checked", "checked");
				break;
			}
		}
	});
	layui.form.render('checkbox');
}
//-----[END][复选框选中元素]

//------[获取复选框值](传入class_Nmme,获取选中的数组)[2018-12-13]
function get_CheckBox_val(class_Nmme) {
	var arr=[];
	$('input:checkbox[class=' + class_Nmme + ']:checked').each(function(i) {
			arr.push($(this).val());
	});
	return arr;
}
//------[获取复选框值END]
//------[获取复选框未选中的值](传入class_Nmme,获取选中的数组)[2019-01-04]
function get_CheckBox_val_Reverse(class_Nmme) {
	var arr=[];
	$('input:checkbox[class=' + class_Nmme + ']:not(:checked)').each(function(i) {
			arr.push($(this).val());
	});
	return arr;
}
//------[获取复选框未选中的值END]
//-----[选中下拉框]
function SelectedDrop_DownBox(element, $val) {
	element.children("option[value='" + $val + "']").attr("selected", "true");
	layui.form.render('select');
}
//-----[END][选中下拉框]

/**
 * 选中下拉框
 * @param element
 * @param $text 
 * @returns
 */
function SelectedDrop_DownBox_text(element, $text) {
	element.find("option").each(function (data) {
	    var $this = $(this);
	    if($this.text() == $text) {
	        $this.attr("selected", true);
	    }
	});
	layui.form.render('select');
}
//-----[END][选中下拉框]


//-----[验证下拉框中是否选中值]
function VerificationsChoolIdOrclassId(element, $TS) {
	var $bool = false;
	if(element.val().trim() != "") {
		$bool = element.val().trim() >= 0;
		ShowPrompt(element, $bool, $TS);
	} else {
		ShowPrompt(element, $bool, "不能为空哦！");
	}

	return $bool;
}
//-----[END][验证下拉框中是否选中值]



//-----[清除特殊字符并提示element: 元素，df_val:默认值]2019-01-04
function KeyUP_Cler(element,df_val) {
	var $val = RegeMatch(element.val()) ? df_val: element.val();
	var $bool = RegeMatch(element.val()) ? false : true;
	if($bool!=true){FriendlyPrompt("不能有特殊字符哦~");}
	else{window["df_val"]=$val;}//赋值默认val
	element.val($val);
	return $val;
}
//-----[END][清除特殊字符并提示]

//-----[过滤特殊字符]
function RegeMatch($name) {
	var pattern = new RegExp("[-` ~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）—+|{}【】‘；：”“’。，、？]");
	if($name != "" && $name.length > 0) {
		if(pattern.test($name)) {
			return true;
		} else {
			return false;
		}
	}
}
//-----[END][过滤特殊字符]
//-----[验证文本框并提示]	
function VerificationsTextBox(element, $TS) {
	var $bool = false;
	$bool = element.val().trim() != "";
	ShowPrompt(element, $bool, $TS);
	return $bool;
}
//-----[END][验证文本框并提示]
//----[显示/隐藏.提示PS:$bool为false时显示,true：隐藏]
function ShowPrompt(element, $bool, $TShtml) {
	var $PromptName = element.attr("id");
	$("." + element.attr("id") + "Prompt").html($TShtml);
	var $bl = false;
	$bl = $bool ? $bl : true;
	if($bool == false) {
		$("." + $PromptName + "Prompt").show();
	} else {
		$("." + $PromptName + "Prompt").hide();
	}
	Notice(element, $bl);
}
//----[END][显示提示]

//-----[验证复选框是否选中（class_name:类名）]2018-12-19
function CheckBox_Sed(class_name) {
	var $bool = false;
	$('input:checkbox[class=' + class_name + ']:checked').each(function(i) {
			$bool=true;
			if($bool){
				return false;
			}
	});
	return $bool;
}
//-----[END][验证复选框是否选中]


//-----[验证复选框是否选中值并提示class_name:类名，$Ts：为空时提示]2018-12-19
function VerificationsCheckBox(class_name, $Ts) {
	 var $bool =CheckBox_Sed(class_name);
	 if($bool==false){FriendlyPrompt($Ts);}
	return $bool;
}
//-----[END][验证复选框是否选中值]	

//-----[警告框颜色]
function Notice(element, $bool) {
	if($bool) {
		element.addClass("Notice");
	} else {
		element.removeClass("Notice");
	};
}
//-----[END][警告框颜色]

//-----[弹出框提示]
function Laert_Prompt($TS) {
	layer.open({
		title: false,
		closeBtn: 0,
		anim: 6,
		content: '<i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe69c;</i>  ' + $TS + '',
		btnAlign: 'c',
		area: ['50'],
		scrollbar: false
	});
}
//-----[END][弹出框提示]

//-----[验证邮编]
function VerificationsZipCode(element, $TS) {
	var $bool = false;
	if(element.val().trim() != "") {
		var arg = /[1-9]\d{5}(?!\d)/;
		$bool = arg.test(element.val());
		ShowPrompt(element, $bool, $TS);
	} else {
		ShowPrompt(element, $bool, "不能为空哦！");
	}
	return $bool;
}
//-----[END][验证邮编]

//-----[单选按钮选中(class_name:类名，$val：值)]2018-12-18
function RadioBtnSelected(class_name, $val) {
	$('input:radio[class=' + class_name + ']').each(function(i) {
		if($(this).val() == $val) {
			$(this).attr("checked", "true");
		}
	})
	layui.form.render('radio');
}
//-----[单选按钮选中]
//----[验证单选按钮是否选择]
function VerificationsRadioBtn(element, $TS) {
	var $bool = false;
	if(element.val().trim() != "") {
		var $lxid = "";
		$('input:radio[name=' + element.attr("name") + ']:checked').each(function(i) {
			if(0 == i) {
				$lxid = $(this).val();
			} else {
				$lxid += ("," + $(this).val());
			}
		});
		$bool = $lxid != "" ? true : false;
		ShowPrompt(element, $bool, $TS);

	} else {
		ShowPrompt(element, $bool, "您还未选中哦！");
	}
	return $bool;
}
//----[验证单选按钮是否选择]
//------[获取单选按钮的值(class_name:类名)]2018-12-21
function Get_Radio_Val(class_name) {
	var $val = ""
	$('input:radio[Class=' +class_name + ']:checked').each(function(i) {
		$val += $(this).val().trim();
	})
	return $val;
}
//------[END][获取单选按钮的值]
//-----[验证手机号]
function VerificationPhon(element) {
	var $bool = false;
	var $TShtml = "";
	if(element.val().trim() != "") {
		var $testph = /^1(3|4|5|6|7|8|9)\d{9}$/;
		$bool = $testph.test(element.val());
		$TShtml = "您输入的手机号有误！";
	} else {
		$TShtml = "请输入手机号";
	}
	if($bool!=true){
		FriendlyPrompt($TShtml);
	}
	return $bool;
}
//-----[END][验证手机号]	

//-----[验证文本框内是否有非法字符,给与弹出框提示,$DefaultTS:默认提示(即为空是的提示),$ErrorTs:错误提示(包含有非法字符时的提示)]
function VerificationIllegalAndPrompt(element, $DefaultTS, $ErrorTs) {
	var $bool = false;
	var $bl = true;
	var DefaultTS = $DefaultTS;
	var ErrorTs = $ErrorTs;
	if(element.val() != "") {
		$bool = RegeMatch(element.val()) ? false : true;
		if($bool == false) {
			Laert_Prompt(ErrorTs);
		}
	} else {
		Laert_Prompt(DefaultTS);
	}
	$bl = $bool ? false : $bl;
	Notice(element, $bl);
	return $bool;
}
//-----[END][验证文本框内是否有非法字符,给与弹出框提示]

//-----[验证来两时间差]
function TimeDifference(element1, element2) {
	//console.log(element1.val()+" /"+element2.val());
	var $bool = false;
	$bool = element1.val() > element2.val() ? false : true;
	if($bool == false) {
		Laert_Prompt("开始时间和结束时间有错误哦！");
	}
	return $bool;
}
//-----[END][验证来两时间差]

//-------[验证邮箱并给与提示]
function VerificationEmail(element) {
	var $bool = false;
	var $TShtml = "";
	if(element.val() != "") {
		var re = /^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
		$bool = re.test(element.val().trim());
		$TShtml = "邮箱格式有误！";
	} else {
		$TShtml = "请填写邮箱！";
	}
	if($bool==false){
		FriendlyPrompt($TShtml);
	}
	return $bool;
}
//-----[END][验证邮箱并给与提示]

//----[验证密码]
function VerificationPwd(element1, element2) {
	var $bool = false;
	var $TShtml = "";
	if(element1.val().trim() != "" && element2.val().trim() != "") {

		if(element1.val().trim().length >= 6 && element2.val().trim().length >= 6) {
			$TShtml = "两次输入的密码不一致!";
			$bool = element1.val() == element2.val() ? true : false;
			if($bool!=true){FriendlyPrompt($TShtml);}
		} else {
			$TShtml = "密码长度需大于六位数~哦！";
			if(element1.val().trim().length < 6) {
				FriendlyPrompt($TShtml);
			}
			if(element2.val().trim().length < 6) {
				FriendlyPrompt($TShtml);
			}
		}

	} else {
		$TShtml = "请填写密码!";
		FriendlyPrompt($TShtml);
	}
	return $bool;
}
//----[END][验证密码]
//-----[验证元素不为空，过滤特殊字符]
function VerificationGuestName(element) {
	var $TShtml = "不能为空哦~！";
	var $bool = false;
	var $bl = true;
	if(element.val() != "") {
		var $val = RegeMatch(element.val()) ? "" : element.val();
		$bool = RegeMatch(element.val()) ? false : true;
		$TShtml = "不能有非法字符！";
	}
	ShowPrompt(element, $bool, $TShtml);
	$bl = $bool ? false : $bl;
	Notice(element, $bl);
	return $bool;
}
//-----[END][验证元素不为空，过滤特殊字符]
//-----[验证身份证]
function VerificationCardNo(element) {
	var $bool = false;
	var $bl = true;
	if(element.val().trim() != "") {
		var $testph = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/; //十八身份证正则表达式 
		$bool = $testph.test(element.val());
		if($bool == false) {
			Laert_Prompt("您的身份证号码好像有点问题~！");
		}
	} else {
		Laert_Prompt("身份证号码是不能为空的哦~！");
	}
	$bl = $bool ? false : $bl;
	Notice(element, $bl);
	return $bool;
}
//-----[END][验证身份证]
//-----[验证用户头像像是否选择]
function VerificationImgUrl(element) {
	var $bool = false;
	$bool = element.val() != "" ? true : false;
	ShowPrompt(element, $bool, "您还未选择头像哦~！");
	return $bool;
}
//-----[END][验证用户头像像是否选择]

//----[生成数字加法验证码](传入写入元素，返回验证码计算结果)
function productionVerificationCode(element) {
	var code = 9999;
	var ranColor = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6); //随机生成颜色
	// alert(ranColor)
	var ranColor2 = '#' + ('00000' + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6);
	var num1 = Math.floor(Math.random() * 100);
	var num2 = Math.floor(Math.random() * 100);
	//随机算法
	var tmparith = Math.floor(Math.random() * 3);
	var $html = "";
	switch(tmparith) {
		case 1:
			code = num1 + num2;
			$html = num1 + ' + ' + num2 + ' = ?';
			break;
		case 2:
			if(parseInt(num1) < parseInt(num2)) {
				var tmpnum = num1;
				num1 = num2;
				num2 = tmpnum;
			}
			code = num1 - num2;
			$html = num1 + ' - ' + num2 + ' = ?';
			break;
		default:
			code = num1 * num2;
			$html = num1 + ' × ' + num2 + ' = ?';
			break;
	}
	element.val($html); //写入验证码
	if(element.hasClass("nocode")) {
		element.removeClass("nocode");
		element.addClass("code");
	}
	element.css('background', ranColor);
	element.css('color', ranColor2);
	return code;
}
//----[END][生成数字加法验证码]

//-----[验证文本框不能有特殊字符&&不为空&&长度大于多少]
function VerificationTextBoxAndLeng(element, Len) {
	var $TShtml = "不能为空哦~！";
	var $bool = false;
	var $bl = true;
	//console.log(element.val().length+"/"+Len);
	if(element.val() != "" && element.val().length > Len) {
		var $val = RegeMatch(element.val()) ? "" : element.val();
		$bool = RegeMatch(element.val()) ? false : true;
		$TShtml = "不能有非法字符！";
	} else {
		if(element.val() != "") {
			ShowPrompt(element, $bool, "长度小于" + (Len + 1) + "位数");
		} else {
			ShowPrompt(element, $bool, $TShtml);
		}
	}
	$bl = $bool ? false : $bl;
	Notice(element, $bl);
	return $bool;
}
//-----[END][验证文本框不能有特殊字符&&不为空&&长度大于多少]

//-----[友好提示]
function FriendlyPrompt($TS) {
	layer.msg($TS, {
		time: 2000,
		btn: ['知道了'],
		btnAlign: 'c',
		offset: ['100px']
	})
}
//-----[END][友好提示]

//-----[计算时间差]
function GetDateDiff(startTime, endTime, diffType) {
	//将xxxx-xx-xx的时间格式，转换为 xxxx/xx/xx的格式 
	startTime = startTime.replace(/\-/g, "/");
	endTime = endTime.replace(/\-/g, "/");
	//将计算间隔类性字符转换为小写
	diffType = diffType.toLowerCase();
	var sTime = new Date(startTime); //开始时间
	var eTime = new Date(endTime); //结束时间
	//作为除数的数字
	var timeType = 1;
	switch(diffType) {
		case "second":
			timeType = 1000;
			break;
		case "minute":
			timeType = 1000 * 60;
			break;
		case "hour":
			timeType = 1000 * 3600;
			break;
		case "day":
			timeType = 1000 * 3600 * 24;
			break;
		default:
			break;
	}
	return parseInt((eTime.getTime() - sTime.getTime()) / parseInt(timeType));
}
//-----[END][计算时间差]

//-----[传入数组，值判断这个值是否在这个数组中true:在False:不在][2018-12-14]
function VerificationValIsArray($arr, $val) {
	var bool = false;
	for(i = 0; i < $arr.length; i++) {
		bool = $arr[i] == $val ? true : false;
		if(bool) {
			break;
		}
	}
	return bool;
}
//-----[END][传入数组，值判断这个值是否在这个数组中]

//-----[传入参照数组，选中值数组判断是否现在数组中]
function VerificationArrIsArrArg($argArr, $arr) {
	var bool = false;
	var $IsBool = false;
	var $newArr = $argArr.split(","); //切割参照数组
	var $val = $arr.split(","); //切割值数组
	var $TrueCount = ""; //记录==true的个数
	var $TRUE = $val.length; //全部在参数数组中返回true
	for(i = 0; i < $newArr.length; i++) {
		for(j = 0; j < $val.length; j++) {
			$IsBool = $newArr[i] == $val[j] ? true : false;
			if($IsBool) {
				$TrueCount++;
			}
		}
		if($TRUE == $TrueCount) {
			bool = true;
			break;
		} //全部匹配返回TRUE
	}
	return bool;
}
//-----[传入参照数组，选中值数组判断是否现在数组中]


//----[验证内容是否是纯数字]2019-01-04
function IS_number(val){
	var bool = false;
	var reg = /^[0-9]*$/;
		bool = reg.test(val);
	return bool;
}
function VerificationValIsNumber(element,df_val) {
	var $bool = IS_number(element.val());
	var $val = $bool==false? df_val: element.val();
	if($bool!=true){FriendlyPrompt("不能有特殊字符哦!");}
	else{window["df_val"]=$val;}//赋值默认val
	element.val($val);
	return $bool;
}
//----[验证内容是否是纯数字END]

//----[获取当前日期]
function gitData() {
	function p(s) {
		return s < 10 ? '0' + s : s;
	}
	var myDate = new Date();
	//获取当前年
	var year = myDate.getFullYear();
	//获取当前月
	var month = myDate.getMonth() + 1;
	//获取当前日
	var date = myDate.getDate();
	return(year + '-' + p(month) + "-" + p(date));
}
//----[获取当前日期End]

//-----[获取当前时间]
function getdatetime() {
	var myDate = new Date();
	//获取当前年
	var year = myDate.getFullYear();
	//获取当前月
	var month = myDate.getMonth() + 1;
	//获取当前日
	var date = myDate.getDate();
	var h = myDate.getHours(); //获取当前小时数(0-23)
	var m = myDate.getMinutes(); //获取当前分钟数(0-59)
	var s = myDate.getSeconds();
	var now = year + '-' + p(month) + "-" + p(date) + " " + p(h) + ':' + p(m) + ":" + p(s);

	return now;
}

function p(s) {
	return s < 10 ? '0' + s : s;
}
//-----[获取当前时间End]

//---[界面刷新]
function SX() {
	window.location.reload(); //刷新当前页面
}

//---[界面刷新End]
//-----[验证文本框弹框提示]
function VerificationTextBombBoxPrompt(element, $TS) {
	var bool = false;
	bool = element.val().trim() != "" ? true : false;
	if(bool == false) {
		FriendlyPrompt($TS)
	}
	return bool;
}
//-----[验证文本框弹框提示End]=======
//---[界面刷新End]

//----[多少毫秒后刷新界面]
function loadSX(s) {
	setTimeout(function() {
		window.location.reload();
	}, s);
}
//----[多少毫秒后刷新界面]
//-----[验证文本框弹框提示]
function VerificationTextBombBoxPrompt(element, $TS) {
	var bool = false;
	bool = element.val().trim() != "" ? true : false;
	if(bool == false) {
		FriendlyPrompt($TS)
	}
	return bool;
}
//-----[验证文本框弹框提示End]

//-----[比较时间大小]
function CompareTimeSize($StartTime, $EndTime) {
	var StartYear = Number($StartTime.split("-")[0]);
	var StartMonth = Number($StartTime.split("-")[1]);
	var EndYear = Number($EndTime.split("-")[0]);
	var EndMonth = Number($EndTime.split("-")[1]);
	var bool = false;
	var yearbool = false;
	bool = StartYear <= EndYear ? true : false;
	yearbool = StartYear < EndYear ? true : false;
	//console.log("StartYear="+StartYear+"、StartMonth="+StartMonth+"、EndYear="+EndYear+"、EndMonth="+EndMonth);
	if(yearbool == false) {
		bool = StartMonth <= EndMonth ? true : false;
	}
	return bool;
}
//-----[比较时间大小End]

//-----[全屏显示]
function Full_screen() {
	if(!document.fullscreenElement && // alternative standard method  
		!document.mozFullScreenElement && !document.webkitFullscreenElement) { // current working methods  
		if(document.documentElement.requestFullscreen) {
			document.documentElement.requestFullscreen();
		} else if(document.documentElement.mozRequestFullScreen) {
			document.documentElement.mozRequestFullScreen();
		} else if(document.documentElement.webkitRequestFullscreen) {
			document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
		}
	} else {
		if(document.cancelFullScreen) {
			document.cancelFullScreen();
		} else if(document.mozCancelFullScreen) {
			document.mozCancelFullScreen();
		} else if(document.webkitCancelFullScreen) {
			document.webkitCancelFullScreen();
		}
	}
}
//-----[全屏显示End]

//-- 获取两个日期之间所有日期
Date.prototype.format = function() {
	var s = '';
	var mouth = (this.getMonth() + 1) >= 10 ? (this.getMonth() + 1) : ('0' + (this.getMonth() + 1));
	var day = this.getDate() >= 10 ? this.getDate() : ('0' + this.getDate());
	s += this.getFullYear() + '-'; // 获取年份。
	s += mouth + "-"; // 获取月份。
	s += day; // 获取日。
	return(s); // 返回日期。
};

function getdateAll(begin, end) {
	var $resdata = [];
	var ab = begin.split("-");
	var ae = end.split("-");
	var db = new Date();
	db.setUTCFullYear(ab[0], ab[1] - 1, ab[2]);
	var de = new Date();
	de.setUTCFullYear(ae[0], ae[1] - 1, ae[2]);
	var unixDb = db.getTime();
	var unixDe = de.getTime();
	for(var k = unixDb; k <= unixDe;) {
		$resdata.push(new Date(parseInt(k)).format());
		k = k + 24 * 60 * 60 * 1000;
	}
	return $resdata;
}
//-----获取两个日期之间所有日期[END]
//------[获取两个日期中所有的月份中]
function getMonthBetween(start, end) {
	var result = [];
	var s = start.split("-");
	var e = end.split("-");
	var min = new Date();
	var max = new Date();
	min.setFullYear(s[0], s[1]);
	max.setFullYear(e[0], e[1]);
	var curr = min;
	while(curr <= max) {
		var month = curr.getMonth();
		var str = curr.getFullYear() + "-" + (month);
		var s = curr.getFullYear() + "-0";
		if(str == s) {
			str = curr.getFullYear() + "-12";
		} else {
			str = curr.getFullYear() + "-" + (month < 10 ? '0' + month : month)
		}
		result.push(str);
		curr.setMonth(month + 1);
	}
	return result;
}
//------[获取两个日期中所有的月份中END]

//-----[获取两个日期中的所有年份]
function getYear(start, end) {
	var result = [];
	var starts = start.split('-');
	var ends = end.split('-');
	var staYear = parseInt(starts[0]);
	var endYear = parseInt(ends[0]);
	while(staYear <= endYear) {
		staYear++;
		result.push(staYear+"");
	}
	return result;
}
//-----[获取两个日期中的所有年份END]

//-----[获取前n天的日期]
function getBeforeDate(n) {
	var n = n;
	var d = new Date();
	var year = d.getFullYear();
	var mon = d.getMonth() + 1;
	var day = d.getDate();
	if(day <= n) {
		if(mon > 1) {
			mon = mon - 1;
		} else {
			year = year - 1;
			mon = 12;
		}
	}
	d.setDate(d.getDate() - n);
	year = d.getFullYear();
	mon = d.getMonth() + 1;
	day = d.getDate();
	s = year + "-" + (mon < 10 ? ('0' + mon) : mon) + "-" + (day < 10 ? ('0' + day) : day);
	return s;
}
//-----[获取前n天的日期END]

//-----[判断当前日期在某个时间段之内]
function checkTime(stime, etime, thisDates) {   //开始时间
	  
	var arrs = stime.split("-");  
	var startTime = new Date(arrs[0], arrs[1], arrs[2]);  
	var startTimes = startTime.getTime();   //结束时间
	  
	var arre = etime.split("-");  
	var endTime = new Date(arre[0], arre[1], arre[2]);  
	var endTimes = endTime.getTime();   //当前时间
	  
	var arrn = thisDates.split("-");  
	var nowTime = new Date(arrn[0], arrn[1], arrn[2]);  
	var nowTimes = nowTime.getTime();  
	if(nowTimes < startTimes || nowTimes > endTimes) {    
		return false;  
	}  
	return true;
}
//-----[判断当前日期在某个时间段之内END]

//-----[setDate格式化日期]
function setDate(date) {
	y = date.getFullYear();
	m = date.getMonth() + 1;
	d = date.getDate();
	m = m < 10 ? "0" + m : m;
	d = d < 10 ? "0" + d : d;
	return y + "-" + m + "-" + d;
}
//-----[setDate格式化日期END]

//-----[获取当前月的第一天]
function getCurrentMonthFirst() {
	var date = new Date();
	date.setDate(1);
	return date;
}
//-----[获取当前月的第一天END]

//-----[获取当前月的最后一天]
function getCurrentMonthLast() {
	var date = new Date();
	var currentMonth = date.getMonth();
	var nextMonth = ++currentMonth;
	var nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
	var oneDay = 1000 * 60 * 60 * 24;
	return new Date(nextMonthFirstDay - oneDay);
}
//-----[获取当前月的最后一天END]

//-----[格式化日期AND时间]'Thu May 12 2017 08:00:00 GMT+0800 (中国标准时间)' 
function Formatting_time(time) {
	var date = new Date(time);
	return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
}
//-----[格式化日期]'Thu May 12 2017 08:00:00 GMT+0800 (中国标准时间)' 
function Formatting_Date(time) {
	var date = new Date(time);
	function p(s) {
		return s < 10 ? '0' + s : s;
	}
	return date.getFullYear() + '-' + p((date.getMonth() + 1)) + '-' + p(date.getDate());
}
//-----[END格式化日期END]'Thu May 12 2017 08:00:00 GMT+0800 (中国标准时间)'

//-------[Layui刷新父窗体]
function LayuiSXparents(){
	 window.parent.location.reload();
	 
	  var index = parent.layer.getFrameIndex(window.name);
	  parent.layer.close(index);
}
//-------[ENDLayui刷新父窗体]
//-------[验证元素的HTml是否为空]
function VerificationHtml(element, $TS) {
	var bool = false;
	bool = element.html().trim()!= "" ? true : false;
	if(bool == false) {
		FriendlyPrompt($TS)
	}
	return bool;
}
//-------[END验证元素的HTml是否为空]
//-------[验证元素的val是否为空]2018-12-17
function Verificationval(element, $TS) {
	var bool = false;
	bool =element.val()!=undefined  && element.val()!=null && element.val().trim()!= "" ? true : false;
	if(bool == false) {
		FriendlyPrompt($TS)
	}
	return bool;
}
//-------[END验证元素的val是否为空]

/**
 * 是否为空 或为 ''
 * @param val
 * @returns
 */
function IsNull(val){
	var bool = false;
	bool =val==null || val== "" ? false : true;
	return bool;
} 


//-------[通知类提示]
function msg($Ts,iconNub){
	layer.msg($Ts, {time: 2000, icon:iconNub});
}
//-------[END通知类提示]

//-------[特殊字符转义]
function escapeJquery(srcString) {
    // 转义之后的结果
    var escapseResult = srcString;

    // javascript正则表达式中的特殊字符
    var jsSpecialChars = ["\\", "^", "$", "*", "?", ".", "+", "(", ")", "[",
        "]", "|", "{", "}"];

    // jquery中的特殊字符,不是正则表达式中的特殊字符
    var jquerySpecialChars = ["~", "`", "@", "#", "%", "&", "=", "'", "\"",
        ":", ";", "<", ">", ",", "/"];

    for (var i = 0; i < jsSpecialChars.length; i++) {
        escapseResult = escapseResult.replace(new RegExp("\\"
            + jsSpecialChars[i], "g"), "\\"
            + jsSpecialChars[i]);
    }

    for (var i = 0; i < jquerySpecialChars.length; i++) {
        escapseResult = escapseResult.replace(new RegExp(jquerySpecialChars[i],
            "g"), "\\" + jquerySpecialChars[i]);
    }

    return escapseResult;
};
//-------[END特殊字符转义]

//----[获取当前年月]
function gitYearAndMonth() {
	function p(s) {
		return s < 10 ? '0' + s : s;
	}
	var myDate = new Date();
	//获取当前年
	var year = myDate.getFullYear();
	//获取当前月
	var month = myDate.getMonth() + 1;
	//获取当前日
	var date = myDate.getDate();
	return(year + '-' + p(month));
}
//----[获取当前年月End]

//----[checkbox全选] 2018-11-3
function checkbox_All($All_Name,$Sel_Name){
	layui.form.on('checkbox('+$All_Name+')', function(data){
		if(this.checked ){//全选
			$($Sel_Name).attr("checked", true);
		}else{
			$($Sel_Name).attr("checked", false);
		}
		layui.form.render('checkbox');//渲染checkbox
	});
}
//----[checkbox全选End]
//----[checkbox查看是否全选] 2018-11-5
function checkbox_All_selbool($Class_Name){
	var bool=true;
	$(""+$Class_Name+":input[type='checkbox']").each(function(i) {
		if($(this).is(':checked')!=true){
			bool=false;
		}  
	})
	return bool;
}
//----[checkbox查看是否全选End]

//-----[Layui表格编辑(<td class="My_edit"></td>)] 2018-11-13
function Layui_edit(){
	$(".My_edit").live("click",function(){
		$(this).toggle(function(){
			var text=$(this).html();
			$(this).html('<input type="text" style="min-height:40px;" class="layui-input layui-table-edit" value="'+text+'">');
	        $(this).children("input").val("").focus().val(text);
	        $(this).children("input").select();
		},function(){
			$(this).html($(this).children("input").val());
		})
	})
	
	
	//数据可编辑
	$(".My_edit").toggle(function(){
		var text=$(this).html();
		$(this).html('<input type="text" style="min-height:40px;" class="layui-input layui-table-edit" value="'+text+'">');
        $(this).children("input").val("").focus().val(text);
        $(this).children("input").select();
	},function(){
		$(this).html($(this).children("input").val());
	})
	//数据编辑失去焦点失效
	$(".layui-table-edit").live("blur",function(){
		var text=$(this).val();
		$(this).parent().html(text);
	})
}
//-----[Layui表格编辑END]

//-----[Layui动态[select]只读] 2018-11-20
function select_Readonly(){
	$('.layui-select-title .layui-input').live("focus",function(){
		$(this).blur();
	})
	$('.layui-select-title .layui-edge').live("click",function(){
		$(this).parents().children(".layui-input").blur();
	})
}


//-----[Layui动态[select]只读END]
/*
 * @Name: [Layui打开子窗体]
 * @param: map-子窗体传递数据
 * @param: $URL-打开界面URl访问路径
 * @param: title-窗口标题
 * @param: R_fn-子窗返回参数执行函数名函数(选填)
 * @param: area-窗口宽，高(选填，默认最大化)
 * @param: btn-按钮组如['确认','取消'](选填)
 * @param: btnAlign-按钮排序
 * @param: getParameter - 获取参数函数 (用于回调时获取父界面的执行函数参数获取 的函数)
 * @author zf
 * @date 2018-12-23
 * */
function OpenView(map,$URL,title,R_fn,area,btn,btnAlign,getParameter){
		area=area!=undefined && area!=null && area!=""?area:[''+$(window).width()+'px',''+$(window).height()+'px'];//默认宽高
		btn=area!=undefined && area!=null && area!=""?btn:[];//按钮默认无
		btnAlign=btnAlign!=undefined && btnAlign!=null && btnAlign!=""?btnAlign:"r";//按钮排列 l c r:左 中 右
	var Rmap={};
		layer.open({
	    type: 2, //此处以iframe举例
	    title: ''+title,
	    area: area,
	    shade: 0,
	    maxmin: true,
	    content: ''+$URL,
	    btn: btn,
	    btnAlign: btnAlign,
	    zIndex: layer.zIndex,//重点1
	    success: function(layero, index){
	    	// 获取子页面的iframe
	        var iframe = window['layui-layer-iframe' + index];
	        // 向子页面的全局函数child传参
	        Rmap=iframe.child(map);
	    }/*,cancel: function(){ //右上角关闭回调
	    	console.log("关闭")
	       //如果父窗体等待子界面传递参数，执行函数名R_fn不为空的请款下，执行函数并传递参数
	    	if(R_fn!=undefined && R_fn!=null && R_fn!=""){
	    		 if(getParameter!=undefined && getParameter!=null ){//父界面调函数时获取参数定义时，执行父界面执行函数参数获取
	    			 Rmap = Is_null(Rmap)==true?Rmap:getParameter();
	    		 }	
	    		 R_fn(Rmap);//执行父界面等待参数函数
	    	}
	    },yes: function(){//第一个按钮点击事件
	    	console.log("yes关闭")
	    	if(R_fn!=undefined && R_fn!=null && R_fn!=""){
	    		if(getParameter!=undefined && getParameter!=null ){//父界面调函数时获取参数定义时，执行父界面执行函数参数获取
	    			 Rmap = Is_null(Rmap)==true?Rmap:getParameter();
	    		 }	
	    		 R_fn(Rmap);//执行父界面等待参数函数
	    	}
	    	layer.closeAll();//关闭窗口
        }*/, end: function () {
        	if(R_fn!=undefined && R_fn!=null && R_fn!=""){
	    		if(getParameter!=undefined && getParameter!=null ){//父界面调函数时获取参数定义时，执行父界面执行函数参数获取
	    			 Rmap = Is_null(Rmap)==true?Rmap:getParameter();
	    		 }	
	    		 R_fn(Rmap);//执行父界面等待参数函数
	    	}
	    	layer.closeAll();//关闭窗口
        }
  });
}
//-----[打开子窗体(map:传递数据;$URL:打开界面;title:标题;)END]2018-12-13
//-----基于layui的表单初始赋值[map(赋值数组 key:赋值元素name,value:值)PS:<from lay-filter="example" >]2018-12-14
function compose(map){ 
	  layui.form.val('example', map)
}
//-----基于layui的表单初始赋值END


/**
 * [询问框]
 * @param parameter 确认 执行函数的参数
 * @param f_name 确认 执行函数
 * @param msg 提示
 * @param time 自动消失时间
 * @param btn_arr 按钮组
 * @param offset_px 弹出框位置数组
 * @param N_parameter 否 执行函数的参数
 * @param N_f_name 否 执行函数的参数
 * @returns 
 * @author zf
 * @date 2019-01-14
 */
function Mlayer_confirm(parameter,f_name,msg,time,btn_arr,offset_px,N_parameter,N_f_name){
	layer.msg(msg, {
		time: time, //time s后自动关闭1000为单位
		btn: btn_arr,
		btnAlign: 'c',
		offset: offset_px,
		yes: function() {
			layer.closeAll();
			f_name(parameter);//执行该函数
		},btn2: function(){
          if(N_parameter!=undefined && N_f_name!=undefined){
        	  layer.closeAll();
        	  N_f_name(N_parameter);
          }
        }
	});
}
//------[询问框END]
//------图片放大[ImageUrl:图片src,title：弹框标题，style，图框样式]2018-12-18
function imgMax(ImageUrl,title,style) {
	var title=title==null||title==""?false:title;//默认不显示标题栏
	var style=style==null||style==""?"width:80%;float: left;margin-left: 10%;margin-top: 15px;":style;//默认不显示标题栏
	layer.open({
				type : 1,
				title : title 
				,
				closeBtn : false,
				area : '600px;',
				shade : 0.8,
				id : 'LAY_layuipro' //设定一个id，防止重复弹出
				,
				btn : [ '关闭' ],
				btnAlign : 'c',
				moveType : 1 //拖拽模式，0或者1
				,
				content : '<div >\
					<img src='
						+ ImageUrl
						+ ' style="'+style+'" ></div>'
			});
}
//------图片放大[END]
/*------2018-12-20
 * @Name: [Layui分页控件]
 * @param: Count-数据总条数
 * @param: PageSize-显示条数
 * @param: limits_arr-每页条数的选择项集合如：默认值[10, 20, 30, 40, 50]
 * @param: Pu_id-分页控件DIV容器的id
 * @param: getParameter- 获取查询参数的函数名称
 * @param: Execution_function-执行查询函数的名称
 * @author zf
 * @date 2018-12-20
 * */
function initPageUtil(Count, Curr, PageSize,limits_arr,Pu_id,getParameter,Execution_function) {
	//完整分页功能
	var limits_arr=limits_arr!=null && limits_arr!=""?limits_arr:[10, 20, 30, 40, 50];
	layui.laypage.render({
		elem: Pu_id,
		count: Count ,//传入数据总数Count
		limit: PageSize, //显示条数
		curr: Curr ,//当前页
		layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip'],
		limits:limits_arr,//每页条数的选择项
		jump: function(obj, first) {
			var $curr = obj.curr;
			var $limit = obj.limit;
			/*window["Curr"]=$curr+"";
			window["PageSize"]=$limit+"";*/
			//首次不执行
			if (!first) {
				var map=getParameter();
		    	map.Curr=$curr+"";
		    	map.PageSize=$limit+"";
		    	Execution_function(map);//执行查询函数
			}
		}
	});
}
//-----[Layui分页控件END]
//-----[加法函数，用来得到精确的加法结果]2018-12-23 
function accAdd(arg1,arg2){ 

  var r1,r2,m;

  try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}

  try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}

  m=Math.pow(10,Math.max(r1,r2));

  return (accMul(arg1,m)+accMul(arg2,m))/m; 

}
//-----[加法函数，用来得到精确的加法结果END]
//-----[乘法]2018-12-23
function accMul(arg1,arg2){ 
  var m=0,s1=arg1.toString(),s2=arg2.toString(); 
  try{m+=s1.split(".")[1].length}catch(e){} 
  try{m+=s2.split(".")[1].length}catch(e){} 
  return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m) 
}
//-----[乘法end]

//-----[获取某月的最后一天(Time:yyyy-MM-dd)]2019-01-07
function getMonthLast(Time) {
	var date = new Date(Time);
	var currentMonth = date.getMonth();
	var nextMonth = ++currentMonth;
	var nextMonthFirstDay = new Date(date.getFullYear(), nextMonth, 1);
	var oneDay = 1000 * 60 * 60 * 24;
	return setDate(new Date(nextMonthFirstDay - oneDay));
}
//-----[获取当前月的最后一天END]

/**
 * [只能输入数字和两位小数方法]
 * 举例：<input type="text" onkeyup="num(this)" size="10"/>元
 * @param obj
 * @returns
 * @data 20019-01-08
 */
function num(obj){
    obj.value = num_value(obj.value)
} 
/**
 * 获取元素的值val 为空时获取null
 * @param e 元素
 * @returns
 */
function not_null_Get_val(e){
	return not_null_Get_value(e.val());
}
/**
 * 获取值 为空时获取null
 * @param val
 * @returns
 */
function not_null_Get_value(val){
	return val!=undefined && val!=null && val.trim()!=""?val.trim():null;
}
/**
 * 获取元素的值html 为空时获取null
 * @param e
 * @returns
 */
function not_null_Get_html(e){
	return not_null_Get_value(e.html());
}
/**
 * 图片高度自适应，居中显示
 * @param e_img
 * @param parents_h
 * @returns
 */
function img_Height_adapt(e_img,parents_h){
	e_img.attr("src", e_img.attr("src")).load(function() {
       	var realHeight = this.height;
    	if(realHeight<=parents_h){
    		var px=(parents_h-realHeight)/2;
           $(this).css("margin-top",px+"px");
        }
    });
}
/**
 * [只能输入数字和两位小数]
 * @param value
 * @returns
 * @data 2019-01-14
 */
function num_value(value){
	value = value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
	value = value.replace(/^\./g,""); //验证第一个字符是数字
	value = value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
    value = value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
    value = value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
    return value;
}

/**
 * 文本选中
 * @param e input元素
 * @returns
 */
function input_focus(e){
	e.select();
}
/**
 * 减法运算
 * @param num1
 * @param num2
 * @returns
 */
function numSub(num1, num2) {   
    var baseNum, baseNum1, baseNum2;   
    try {   
        baseNum1 = num1.toString().split(".")[1].length;   
    } catch (e) {   
        baseNum1 = 0;   
    }   
    try {   
        baseNum2 = num2.toString().split(".")[1].length;   
    } catch (e) {   
        baseNum2 = 0;   
    }   
    baseNum = Math.pow(10, Math.max(baseNum1, baseNum2));   
    var precision = (baseNum1 >= baseNum2) ? baseNum1 : baseNum2;   
    return ((num1 * baseNum - num2 * baseNum) / baseNum).toFixed(precision);   
};   

/**
 * 除法运算，避免数据相除小数点后产生多位数和计算精度损失。   
 * @param num1
 * @param num2
 * @data 2019-01-14
 * @returns
 */
function numDiv(num1, num2) {   
    var baseNum1 = 0, baseNum2 = 0;   
    var baseNum3, baseNum4;   
    try {   
        baseNum1 = num1.toString().split(".")[1].length;   
    } catch (e) {   
        baseNum1 = 0;   
    }   
    try {   
        baseNum2 = num2.toString().split(".")[1].length;   
    } catch (e) {   
        baseNum2 = 0;   
    }   
    with (Math) {   
        baseNum3 = Number(num1.toString().replace(".", ""));   
        baseNum4 = Number(num2.toString().replace(".", ""));   
        return (baseNum3 / baseNum4) * pow(10, baseNum2 - baseNum1);   
    }   
};   
/**
 * obj 判断是否是一个数（number）
 * @param obj
 * @returns
 */
function   isNumber(obj){
	return   typeof obj === 'number' && !isNaN(obj);
}

/**
 * toFixed(四舍五入重写)
 * @param number
 * @param decimal
 * @returns
 */
function toFixed(number, decimal) {
    decimal = decimal || 0;
    var s = String(number);
    var decimalIndex = s.indexOf('.');
    if (decimalIndex < 0) {
        var fraction = '';
        for (var i = 0; i < decimal; i++) {
            fraction += '0';
        }
        return s + '.' + fraction;
    }
    var numDigits = s.length - 1 - decimalIndex;
    if (numDigits <= decimal) {
        var fraction = '';
        for (var i = 0; i < decimal - numDigits; i++) {
            fraction += '0';
        }
        return s + fraction;
    }
    var digits = s.split('');
    var pos = decimalIndex + decimal;
    var roundDigit = digits[pos + 1];
    if (roundDigit > 4) {
        //跳过小数点
        if (pos == decimalIndex) {
            --pos;
        }
        digits[pos] = Number(digits[pos] || 0) + 1;
        //循环进位
        while (digits[pos] == 10) {
            digits[pos] = 0;
            --pos;
            if (pos == decimalIndex) {
                --pos;
            }
            digits[pos] = Number(digits[pos] || 0) + 1;
        }
    }
    //避免包含末尾的.符号
    if (decimal == 0) {
        decimal--;
    }
    return digits.slice(0, decimalIndex + decimal + 1).join('');
}


/**
 * 判断数组中所有的值是同一个值
 * @param arr
 * @returns
 */
function Isonly(arr){
	var bool=true,val=arr[0];
	$.each(arr,function(i,o){
		bool=val==o?bool:false;
		if(bool==false){
			return false;//结束循环
		}
	})
	return bool;
}	

/**
 * 判断所有值是否唯一
 * @param arr 数组
 * @param Ts 为空时的提示
 * @returns
 */
function Isonly_prompt(arr,Ts){
	var bool=Isonly(arr);
	if(bool==false){
		FriendlyPrompt(Ts);
	}
	return bool;
}
/**
 * 获取值 为空时获取""
 * @param val
 * @returns
 */
function Get_value(val){
	val=val+"";
	return val!=undefined && val!=null && val.trim()!="" && val!="undefined" && val!="null"?val.trim():"";
}



/**
 * 判断是否为空值
 * @param val
 * @returns
 */
function Is_null(val){
	val = isNumber(val)==true ?val+"":val;//如果是一个数字类型过滤成字符串
	return val!=undefined && val!=null && val.trim()!="" && val!="undefined" && val!="null"?true:false;
}


/**
 * 获取一个double值 
 * @param P_number 传入值【任意字符】
 * @param Defaults_val 【默认值】选参
 * @returns
 */
function set_double(val,Defaults_val){
	Defaults_val=Is_null(Defaults_val)==true?Defaults_val:1;//默认值为空时给 1
	var reg_Tow = /^(?!0{2,})(?:\d{1,9}(\.\d+)?|10{9})$/;
	var map={};
	if(val!=undefined && val!=null && val.trim()!=""){
		val=parseFloat(val);
		val=toFixed(val,2);//保留两位小数数据格式化
		val = reg_Tow.test(val)?val:Defaults_val;//单价
		val  = val =="0.00"? Defaults_val:val;
	}else{//默认单价
		val=Defaults_val;
	}
	return val;
}



/**
 * 获取一个整数值 
 * @param P_number 传入值【任意字符】
 * @param Defaults_val 【默认值】选参
 * @returns
 */
function set_number(P_number,Defaults_val){
	Defaults_val=Is_null(Defaults_val)==true?Defaults_val:1;//默认值为空时给 1
	var reg_Tow = /^(?!0{2,})(?:\d{1,9}(\.\d+)?|10{9})$/;
	if(P_number!=undefined && P_number!=null && P_number.trim()!=""){
		P_number =parseInt(P_number);
		P_number  = reg_Tow.test(P_number)?P_number:Defaults_val;//数量
		P_number  = P_number =="0"? Defaults_val:P_number;
	}else{//默认 值 赋值
		P_number=Defaults_val;
	}
	return P_number;
}

/**
 * 基于layui,Jquery 表格动态编辑 设置 编辑值为 int 或者 double 类型
 * @param e_name 【选取元素的方式】如：.a 或 #a
 * @param type 获取数类型 int or double 
 * @param Defaults_val 默认值 选填
 * @returns
 * PS：最大长度 为 9 位字符
 */
function val_number(e_name,type,Defaults_val){
	//焦时获取元素 当前行,当前td
	$(""+e_name+" input").live("focus",function(data){
		window["_parent"]=$(this).parent().parent();
		window["_e"]=$(this).parent();
	})
	
	// 键盘按下过滤
	$(""+e_name+" input").live("keyup",function(data){
		$(this).attr("maxlength","9");
		var value=num_value($(this).val());//只能输入两位数小数和整数
		$(this).val(value);
	})
	// 编辑文本框 失焦过滤
	$(""+e_name+" input").live("blur",function(data){
		var _parent=window["_parent"];
		var _this=window["_e"];
		var val=_this.html();
		if("int"==type.toLowerCase()){
			val=set_number(val,Defaults_val)
		}else if("double"==type.toLowerCase()){
			val=set_double(val,Defaults_val)
		}
		//延迟赋值 【解决动态编辑赋值的bug】
		setTimeout(function(){
			_this.html(val);
		 },10);
	})
	
}

/**
 * 获取 一组数据的和
 * @param arr 数据
 * @returns
 */
function get_arr_Sum(arr){
	var sum=0;
	$.each(arr,function(i,o){
		sum = accAdd(o,sum);
	})
	return sum
}

/**
 * 关闭当前layer窗口
 * @returns
 */
function close_layer(){
	var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
	parent.layer.close(index);
}

/**
 * 加载窗口 防止重复提交数据 
 * @returns
 */
function Loding(){
	layui.use(['layer' ], function() {
		var layer=layui.layer;
		layer.open({
	        type: 1
	        ,title: false //不显示标题栏
	        ,closeBtn: false
	        ,area: '200px;'
	        ,shade: 0.8
	        ,id: 'Loding' //设定一个id，防止重复弹出
	        ,moveType: 1 //拖拽模式，0或者1
	        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 100;">加载中……</div>'
        });
    });
}

//-----[获取当前时间]
function getTime() {
	var myDate = new Date();
	var h = myDate.getHours(); //获取当前小时数(0-23)
	var m = myDate.getMinutes(); //获取当前分钟数(0-59)
	var s = myDate.getSeconds();
	var now = p(h) + ':' + p(m) + ":" + p(s);
	return now;
}


