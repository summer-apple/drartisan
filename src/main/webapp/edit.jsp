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


</head>
<body>

<div class="container-fluid">
   <div class="row">
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

    <div class="row">
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