<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DRARTISAN</title>
<link rel="stylesheet" type="text/css" href="resources/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.uploadifive.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.form.js"></script>
<script type="text/javascript" src="resources/js/jquery.validate.min.js"></script>
<style type="text/css">
    body{
        margin:50px;
    }
    select{
        width: 100%;
    }
    .goods-form-warp{
        padding: 20px;
    }
    .goods-headimg img{
        width: 100%;
    }
</style>

</head>
<body>

<div class="container-fluid">
   <div class="row row-1">
    <div class="col-xl-12">
    	<table class="goods-table table table-bordered table-hover">
		  <thead>
		    <tr>
		    	<th>首图</th>
		      	<th>ID</th>
		      	<th>名称</th>
		      	<th>站点</th>
		      	<th>地区</th>
		      	<th>运费</th>
		      	<th>货币</th>
		      	<th>类型</th>
		      	<th>类目</th>
		      	<th>日期</th>
		      	<th>操作</th>
		    </tr>
		  </thead>
		  <tbody>
		  </tbody>
		</table>
    </div>
  </div>

    <div class="row row-2">
        <div class="col-xl-12">
            <table class="subgoods-table table table-bordered table-hover">
              <thead>
                <tr>
                    <th>首图</th>
                    <th>Sub-ID</th>
                    <th>名称</th>
                    <th>原价</th>
                    <th>售价</th>
                    <th>操作</th>
                </tr>
              </thead>
              <tbody>
              </tbody>
            </table>
        </div>
    </div>

    <div class="row row-3">
         <div class="col-xl-6 goods-form-warp">
             <form id="goods-form">
                <input type="hidden" name="id" id="goods-id" value="0">

                  <div class="form-group row">
                    <label for="goods-name" class="col-sm-2 form-control-label">名称</label>
                    <div class="col-sm-10">
                      <input type="text" name="name" class="form-control" id="goods-name" placeholder="名称">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="goods-shipfee" class="col-sm-2 form-control-label">运费</label>
                    <div class="col-sm-10">
                      <input type="number" name="shipfee" class="form-control" id="goods-shipfee" placeholder="运费">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="goods-site" class="col-sm-2 form-control-label">站点</label>
                    <div class="col-sm-10">
                       <select class="c-select" name="site" id="goods-site">
                          <option value="Taobao" selected>Taobao</option>
                          <option value="Etsy">Etsy</option>
                          <option value="Fancy">Fancy</option>
                          <option value="Rakuten">Rakuten</option>
                          <option value="Nuandao">Nuandao</option>
                          <option value="KnewOne">KnewOne</option>
                        </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="goods-type" class="col-sm-2 form-control-label">类型</label>
                    <div class="col-sm-10">
                       <select class="c-select" name="type" id="goods-type">
                          <option value="虚拟" selected>虚拟</option>
                          <option value="实物">实物</option>
                        </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="goods-clas" class="col-sm-2 form-control-label">类目</label>
                    <div class="col-sm-10">
                       <select class="c-select" name="clas" id="goods-clas">
                          <option value="珠宝饰品" selected>珠宝饰品</option>
                          <option value="Fancy">Fancy</option>
                          <option value="Taobao">Taobao</option>
                          <option value="Rakuten">Rakuten</option>
                          <option value="Nuandao">Nuandao</option>
                          <option value="KnewOne">KnewOne</option>
                        </select>
                    </div>
                  </div>

                 <div class="form-group row">
                    <label class="col-sm-2">地区</label>
                    <div class="col-sm-10">
                        <select class="c-select" name="location" id="goods-location">
                          <option value="中国" selected>中国</option>
                          <option value="日本">日本</option>
                          <option value="美国">美国</option>
                          <option value="欧洲">欧洲</option>
                          <option value="非洲">非洲</option>
                          <option value="印度">印度</option>
                        </select>
                      
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2">货币</label>
                    <div class="col-sm-10">
                        <select class="c-select" name="currency" id="goods-currency">
                          <option value="CNY" selected>CNY</option>
                          <option value="USD">USD</option>
                          <option value="JPY">JPY</option>
                          <option value="EUD">EUD</option>
                        </select>
                      
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-sm-2">首图</label>
                    <div class="col-sm-10">
                        <input type="hidden" name="headimg" id="goods-headimg">
                        <input id="file_upload" type="file" name="upload" style="display:none;" />
                        <div id="tip-queue" style="display:none;"></div>
                    </div>
                  </div>

                  

                  
                  <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button id="save-goods-btn" type="submit" class="btn btn-secondary">保 存</button>
                    </div>
                  </div>
                </form>
         </div>
         <div class="col-xl-6 goods-headimg">
             <img src="resources/images/a.jpg">
         </div>
    </div>


</div>






<script type="text/javascript">
	$().ready(function(){

//获取地址栏参数 调用getUrlParam(name)方法
    
function getUrlParam(name) {
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r!=null) return unescape(r[2]); return null;
}
            
    var $id = getUrlParam("id");

if ($id==0) {//新建

}else{//查询
         $.ajax({
                url:'goods/qry-one?id='+$id,
                type:'post',
                dataType:'json',
                success:function(data){
                    $(".goods-table tbody").append(
                        '<tr>'+
                        '   <td><a href="'+data.link+'"><img src="'+data.headimg+'"></a></td>'+
                        '   <td>'+data.id+'</td>'+
                        '   <td><a href="'+data.link+'">'+data.name+'</a></td>'+
                        '   <td>'+data.site+'</td>'+
                        '   <td>'+data.location+'</td>'+
                        '   <td>'+data.shipfee+'</td>'+
                        '   <td>'+data.currency+'</td>'+
                        '   <td>'+data.type+'</td>'+
                        '   <td>'+data.clas+'</td>'+
                        '   <td>'+transTime(data.date,false)+'</td>'+
                        '   <td><a href="edit-goods.jsp?id='+data.id+'">编辑</a></td>'+
                        '</tr>'
                        );


        

                    $.each(data.subgoods, function(i, item) {
                        $(".subgoods-table tbody").append(
                            '<tr>'+
                            '   <td><a href="'+item.link+'"><img src="'+item.headimg+'"></a></td>'+
                            '   <td>'+item.id+'</td>'+
                            '   <td><a href="'+item.link+'">'+item.name+'</a></td>'+
                            '   <td>'+item.oprice+'</td>'+
                            '   <td>'+item.price+'</td>'+
                            '   <td><a href="edit-goods.jsp?id='+item.id+'">编辑</a></td>'+
                            '</tr>'
                         );
                    });


                }
            });
}


// //添加
//     $("#save-goods-btn").click(function(){
//          $("#goods-form").ajaxSubmit({
//                                     url:"goods/add",
//                                     type:'post',
//                                     dataType:'json',
//                                     success:function(data){
//                                         if (data!=0) {
//                                             alert("保存成功...");
//                                             $("#goods-form")[0].reset();
//                                             $("#id").val(0);
                                            
//                                         }else{
//                                             alert("保存出错...");
//                                         };
//                                     }
//                                 });
//     });
          




//添加
    $("#goods-form").validate({
                            rules: {
                                name: {
                                    required: true
                                },
                                
                                shipfee: {
                                    number:true,
                                    required:true
                                }
                            },
                            
                            messages: {
                                name: {
                                    required: '必填项目'
                                },
                                
                                shipfee: {
                                    required: '必填项目',
                                    number:'必须为非负整数'
                                }
                            },
                            
                            submitHandler: function(form)
                            {
                                var $url ='';

                                if ($("#goods-id").val()==0) {
                                    $url ='goods/add';
                                }else{
                                    $url ='goods/update';
                                }

                                $("#goods-form").ajaxSubmit({
                                    url:$url,
                                    type:'post',
                                    dataType:'json',
                                    success:function(data){
                                        if (data!=0) {
                                            alert("保存成功...");
                                            $(".row-3").hide();
                                            $("#id").val(data);
                                        }else{
                                            alert("保存出错...");
                                        };
                                    }
                                });
                            }
                        });











                       

//添加goods-headimg

        $('#file_upload').uploadifive({
            'width'           : 75,                 // The width of the button
            'height'          : 30,                 // The height of the button
            'auto' : true,   //取消自动上传 
            'uploadScript' : 'util/upload-image', //处理上传文件Action路径 
            'fileObjName'  : 'file',        //文件对象
            'buttonText'   : '上传首图',   //按钮显示文字 
            'queueID'      : 'tip-queue', //drug and drop box's ID 
            'fileType'     : 'image/jpg,image/jpeg,image/png',   //允许上传文件类型 
            'fileSizeLimit'   : '20MB',                  // Maximum allowed size of files to upload
            'formData'     : {
                                "goodname":$("#goods-name").val(),
                                "subgoodsname":"",
                                "goodsid":$("#goods-id").val(),
                                "subgoodsid":"",
                                "index":"",
                                "level":1

                              },//The other data want to send
            'queueSizeLimit'  : 100,                  //The maximum number of files in drup and drop box 
            'simUploadLimit'  : 100,                  // The maximum number of files to upload at once
            'uploadLimit'     : 100,                  // The maximum number of files you can upload
            'onUploadComplete' : function(file, data) { //文件上传成功后执行 
                     var url = $.parseJSON(data); 
                     $(".goods-headimg img").attr("src",url);
                     $("#goods-headimg").val(url);
                    }

                }); 


//添加subgoods-headimg

        $('#file_upload').uploadifive({
            'width'           : 75,                 // The width of the button
            'height'          : 30,                 // The height of the button
            'auto' : true,   //取消自动上传 
            'uploadScript' : 'util/upload-image', //处理上传文件Action路径 
            'fileObjName'  : 'file',        //文件对象
            'buttonText'   : '上传首图',   //按钮显示文字 
            'queueID'      : 'tip-queue', //drug and drop box's ID 
            'fileType'     : 'image/jpg,image/jpeg,image/png',   //允许上传文件类型 
            'fileSizeLimit'   : '20MB',                  // Maximum allowed size of files to upload
            'formData'     : {
                                "goodname":$(".goods-name").val(),
                                "subgoodsname":$(".subgoods-name").val(),
                                "goodsid":$(".goods-id").val(),
                                "subgoodsid":$(".subgoods-id").val(),
                                "index":"",
                                "level":2

                              },//The other data want to send
            'queueSizeLimit'  : 100,                  //The maximum number of files in drup and drop box 
            'simUploadLimit'  : 100,                  // The maximum number of files to upload at once
            'uploadLimit'     : 100,                  // The maximum number of files you can upload
            'onUploadComplete' : function(file, data) { //文件上传成功后执行 
                        var url = $.parseJSON(data); 
                        $(".subgoods-headimg img").attr("src",url);
                    }

                }); 


//添加subgoods-img

        $('#file_upload').uploadifive({
            'width'           : 75,                 // The width of the button
            'height'          : 30,                 // The height of the button
            'auto' : true,   //取消自动上传 
            'uploadScript' : 'util/upload-image', //处理上传文件Action路径 
            'fileObjName'  : 'file',        //文件对象
            'buttonText'   : '上传首图',   //按钮显示文字 
            'queueID'      : 'tip-queue', //drug and drop box's ID 
            'fileType'     : 'image/jpg,image/jpeg,image/png',   //允许上传文件类型 
            'fileSizeLimit'   : '20MB',                  // Maximum allowed size of files to upload
            'formData'     : {
                                "goodname":$(".goods-name").val(),
                                "subgoodsname":$(".subgoods-name").val(),
                                "goodsid":$(".goods-id").val(),
                                "subgoodsid":$(".subgoods-id").val(),
                                "index":$("#index").val(),
                                "level":3

                              },//The other data want to send
            'queueSizeLimit'  : 100,                  //The maximum number of files in drup and drop box 
            'simUploadLimit'  : 100,                  // The maximum number of files to upload at once
            'uploadLimit'     : 100,                  // The maximum number of files you can upload
            'onUploadComplete' : function(file, data) { //文件上传成功后执行 
                var url = $.parseJSON(data); 
                
                $("#index").val($("#index").val()+1);

                $(".img-show").append('<img src='+url+' style="width:200px;">');
                
                    }

                }); 



//日期转换方法
(function($) {
    $.extend({
        myTime: {
            /**
             * 当前时间戳
             * @return <int>        unix时间戳(秒)  
             */
            CurTime: function(){
                return Date.parse(new Date())/1000;
            },
            /**              
             * 日期 转换为 Unix时间戳
             * @param <string> 2014-01-01 20:20:20  日期格式              
             * @return <int>        unix时间戳(秒)              
             */
            DateToUnix: function(string) {
                var f = string.split(' ', 2);
                var d = (f[0] ? f[0] : '').split('-', 3);
                var t = (f[1] ? f[1] : '').split(':', 3);
                return (new Date(
                        parseInt(d[0], 10) || null,
                        (parseInt(d[1], 10) || 1) - 1,
                        parseInt(d[2], 10) || null,
                        parseInt(t[0], 10) || null,
                        parseInt(t[1], 10) || null,
                        parseInt(t[2], 10) || null
                        )).getTime() / 1000;
            },
            /**              
             * 时间戳转换日期              
             * @param <int> unixTime    待时间戳(秒)              
             * @param <bool> isFull    返回完整时间(Y-m-d 或者 Y-m-d H:i:s)              
             * @param <int>  timeZone   时区              
             */
            UnixToDate: function(unixTime, isFull, timeZone) {
                if (typeof (timeZone) == 'number')
                {
                    unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
                }
                var time = new Date(unixTime * 1000);
                var ymdhis = "";
                ymdhis += time.getUTCFullYear() + "-";
                ymdhis += (time.getUTCMonth()+1) + "-";
                ymdhis += time.getUTCDate();
                if (isFull === true)
                {
                    ymdhis += " " + time.getUTCHours() + ":";
                    ymdhis += time.getUTCMinutes() + ":";
                    ymdhis += time.getUTCSeconds();
                }
                return ymdhis;
            }
        }
    });
})(jQuery);


	function transTime(object,isFull){
		if (object!=null) {
			return $.myTime.UnixToDate(object/1000,isFull,8);
		}else{
			return "--";
		}
	}

	});
</script>
</body>
</html>