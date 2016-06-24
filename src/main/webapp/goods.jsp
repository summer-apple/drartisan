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
    .goods-headimg img,.subgoods-headimg img{
        width: 100%;
    }
    table img {
      width: 50px;
    }
    .row-3,.row-4,.row-5{
      display: none;
    }
    .img-show img{
      width: 200px;
      margin: 10px;
      float: left;
    }
    nav{
      margin-bottom: 30px;
    }
    .container-fluid>.row{
      margin-bottom: 50px;
    }
    .uploadifive-button{
      color: #FFF;
      background-color: #000;
    }
</style>

</head>
<body>

<div class="container-fluid">

   <%@include file="nav.jsp" %>
  


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
                    <th>售价+运费</th>
                    <th>源链接</th>
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
                <input type="hidden" name="state" id="goods-state" value="0">

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
                          <option value="实物" selected>实物</option>
                          <option value="虚拟">虚拟</option>                  
                        </select>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="goods-clas" class="col-sm-2 form-control-label">类目</label>
                    <div class="col-sm-10">
                       <select class="c-select" name="clas" id="goods-clas">
                          <option value="手工艺品" selected>手工艺品</option>
                          <option value="珠宝首饰">珠宝首饰</option>
                          <option value="陶瓷陶器">陶瓷陶器</option>
                          <option value="服装服饰">服装服饰</option>
                          <option value="袜子帽子">袜子帽子</option>
                          <option value="3C数码">3C数码</option>
                          <option value="植物花卉">植物花卉</option>
                          <option value="日用百货">日用百货</option>
                          <option value="礼物礼品">礼物礼品</option>
                          <option value="户外运动">户外运动</option>
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
                          <option value="EUD">EUIR</option>
                        </select>
                      
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="brief" class="col-sm-2 form-control-label">简介</label>
                    <div class="col-sm-10">
                      <textarea type="text" name="brief" class="form-control" id="brief" placeholder="简介"></textarea>
                    </div>
                  </div>
                  
                  <div class="form-group row">
                    <label for="description" class="col-sm-2 form-control-label">描述</label>
                    <div class="col-sm-10">
                      <textarea type="text" name="description" class="form-control" id="description" placeholder="描述"></textarea>
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
             <div class="form-group row">
                    <label class="col-sm-2">首图</label>
                    <div class="col-sm-10">
                        <input type="hidden" name="headimg" id="goods-headimg">
                        <input id="file_upload" type="file" name="upload" style="display:none;" />
                        <div id="tip-queue" style="display:none;"></div>
                    </div>
             </div>
            <img>
         </div>
    </div>


    <div class="row row-4">
         <div class="col-xl-6 goods-form-warp">
             <form id="subgoods-form">
                <input type="hidden" name="id" id="subgoods-id" value="0">
                <input type="hidden" name="goodsid" id="subgoods-goodsid" value="0">
                  <div class="form-group row">
                    <label for="subgoods-name" class="col-sm-2 form-control-label">名称</label>
                    <div class="col-sm-10">
                      <input type="text" name="name" class="form-control" id="subgoods-name" placeholder="名称">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="subgoods-oprice" class="col-sm-2 form-control-label">原价</label>
                    <div class="col-sm-10">
                      <input type="number" name="oprice" class="form-control" id="subgoods-oprice" placeholder="原价">
                    </div>
                  </div>

                  <div class="form-group row">
                    <label for="subgoods-price" class="col-sm-2 form-control-label">售价</label>
                    <div class="col-sm-10">
                      <input type="number" name="price" class="form-control" id="subgoods-price" placeholder="售价">
                    </div>
                  </div>

                   <div class="form-group row">
                    <label for="subgoods-link" class="col-sm-2 form-control-label">源链接</label>
                    <div class="col-sm-10">
                      <input type="text" name="link" class="form-control" id="subgoods-link" placeholder="源链接">
                    </div>
                  </div>
                  
                  
                  
                  <div class="form-group row">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button id="save-subgoods-btn" type="submit" class="btn btn-secondary">保 存</button>
                    </div>
                  </div>
                </form>
         </div>
         <div class="col-xl-6 subgoods-headimg">
             <div class="form-group row">
                    <label class="col-sm-3">子商品首图</label>
                    <div class="col-sm-9">
                        <input type="hidden" name="headimg" id="subgoods-headimg">
                        <input id="file_upload_sub" type="file" name="upload" style="display:none;" />
                        <div id="tip-queue-sub" style="display:none;"></div>
                    </div>
             </div>
             <img>
         </div>
    </div>

    <div class="row row-5">
      <div class="form-group row">
                    <label class="col-sm-2">Images</label>
                    <div class="col-sm-10">
                        <input type="hidden" name="headimg" id="subgoods-headimg">
                        <input id="file_upload_imgs" type="file" name="upload" style="display:none;" />
                        <div id="tip-queue-imgs" style="display:none;"></div>
                    </div>
      </div>
      <div class="col-xl-12 img-show">
        
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
  $(".row-3,.row-4,.row-5").show();
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
                        '   <td>'+data.shipfee+' CNY</td>'+
                        '   <td>'+data.currency+'</td>'+
                        '   <td>'+data.type+'</td>'+
                        '   <td>'+data.clas+'</td>'+
                        '   <td>'+transTime(data.date,false)+'</td>'+
                       '   <td><a href="'+data.link+'" target="_blank">前往</a></td>'+
                        '</tr>'
                        );


        

                    $.each(data.subgoods, function(i, item) {
                        $(".subgoods-table tbody").append(
                            '<tr>'+
                            '   <td><a href="'+item.link+'"><img src="'+item.headimg+'"></a></td>'+
                            '   <td>'+item.id+'</td>'+
                            '   <td><a href="'+item.link+'">'+item.name+'</a></td>'+
                            '   <td>'+item.oprice+' '+data.currency+'</td>'+
                            '   <td>'+item.price+' CNY</td>'+
                            '   <td>'+(item.price *1 + data.shipfee*1) +' CNY</td>'+
                            '   <td><a href="'+item.link+'" target="_blank">前往</a></td>'+
                            '</tr>'
                         );
                    });


                    $("#subgoods-goodsid").val($id);


                }
            });
}




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
                                            $("#goods-id,#subgoods-goodsid").val(data);
                                            //添加goods-headimg       
                                            initUpload($("#file_upload"),data,1,"tip-queue");


                                        }else{
                                            alert("保存出错...");
                                        };
                                    }
                                });
                            }
                        });



//添加
    $("#subgoods-form").validate({
                         rules: {
                                name: {
                                    required: true
                                },
                                
                                oprice: {
                                    number:true,
                                    required:true
                                },
                                
                                price: {
                                    number:true,
                                    required:true
                                },
                                
                                link: {
                                    required:true
                                }
                            },
                            
                            messages: {
                                name: {
                                    required: '必填项目'
                                },
                                
                                oprice: {
                                    required: '必填项目',
                                    number:'必须为非负整数'
                                },
                                
                                price: {
                                    required: '必填项目',
                                    number:'必须为非负整数'
                                },
                                
                                link: {
                                    required: '必填项目'
                                }
                            },
                            
                            submitHandler: function(form)
                            {
                                var $url ='';

                                if ($("#subgoods-id").val()==0) {
                                    $url ='subgoods/add';
                                }else{
                                    $url ='subgoods/update';
                                }
                           

                                $("#subgoods-form").ajaxSubmit({
                                    url:$url,
                                    type:'post',
                                    dataType:'json',
                                    success:function(data){
                                        if (data!=0) {
                                            alert("保存成功...");
                                            $("#subgoods-id").val(0);
                                            //添加subgoods-headimg       
                                            initUpload($("#file_upload_sub"),data,2,"tip-queue-sub");
                                            //添加imgs 
                                            initUpload($("#file_upload_imgs"),data,3,"tip-queue-imgs");

                                        }else{
                                            alert("保存出错...");
                                        };
                                    }
                                });
                            }
                        });






function initUpload(obj,id,level,queue){

        obj.uploadifive({
            'width'           : 75,                 // The width of the button
            'height'          : 30,                 // The height of the button
            'auto' : true,   //取消自动上传 
            'uploadScript' : 'util/upload-image', //处理上传文件Action路径 
            'fileObjName'  : 'file',        //文件对象
            'buttonText'   : '上传图片',   //按钮显示文字 
            'queueID'      : queue, //drug and drop box's ID 
            'fileType'     : 'image/jpg,image/jpeg,image/png',   //允许上传文件类型 
            'fileSizeLimit'   : '20MB',                  // Maximum allowed size of files to upload
            'formData'     : {
                                "id":id,
                                "level":level
                              },//The other data want to send
            'queueSizeLimit'  : 100,                  //The maximum number of files in drup and drop box 
            'simUploadLimit'  : 100,                  // The maximum number of files to upload at once
            'uploadLimit'     : 100,                  // The maximum number of files you can upload
            'onUploadComplete' : function(file, data) { //文件上传成功后执行 
                     var url = $.parseJSON(data); 

                     if (level==1) {
                        $(".goods-headimg img").attr("src",url);

                         $.ajax({
                                url:'goods/qry-one?id='+id,
                                type:'post',
                                dataType:'json',
                                success:function(data){
                                $(".goods-table tbody").html(
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
                                            '   <td><a href="'+data.link+'" target="_blank">前往</a></td>'+
                                            '</tr>'
                                            );
                                 }
                         });
                     }else if (level==2) {
                        $(".subgoods-headimg img").attr("src",url);

                        $.ajax({
                                url:'subgoods/qry-one?id='+id,
                                type:'post',
                                dataType:'json',
                                success:function(data){
                                  $(".subgoods-table tbody").append(
                                      '<tr>'+
                                      '   <td><a href="'+data.link+'"><img src="'+data.headimg+'"></a></td>'+
                                      '   <td>'+data.id+'</td>'+
                                      '   <td><a href="'+data.link+'">'+data.name+'</a></td>'+
                                      '   <td>'+data.oprice+'</td>'+
                                      '   <td>'+data.price+'</td>'+
                                      '   <td><a href="'+data.link+'" target="_blank">前往</a></td>'+
                                      '</tr>'
                                   );
                                 }
                         });

                     }else{
                        $(".img-show").append('<img src="'+url+'">');
                     }
                     
                     
                    }

                }); 
}



                       




// //添加subgoods-headimg




// //添加subgoods-img




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