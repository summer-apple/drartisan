<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DRARTISAN</title>
<link rel="stylesheet" type="text/css" href="resources/js/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.pagination.js"></script>
<style type="text/css">
    body{
        margin:50px;
    }
    table img {
      width: 50px;
    }
        nav{
      margin-bottom: 30px;
    }
</style>

</head>
<body>

<div class="container-fluid">


<%@include file="nav.jsp" %>


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
		<div class="col-sm-12">
			<div class="pagination"></div>
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

			var $state = getUrlParam("state");
			if($state == null){$state=0}
		
//第一次载入标志

var $firstLoadFlag = true;

qry(0,true);

//查询方法
		function qry(pageNo,initPageFlag){


            $.ajax({
                url:'goods/qry-by-state',
                data: {'state':$state,'pageNo':pageNo,'pageSize':20},
                type:'post',
                dataType:'json',
                success:function(data){
                    $(".goods-table tbody").empty();
                    
                	$.each(data.list, function(i, item) {
                    	$operation = ""
                    	if(item.state == 1){//已上架
                    		$operation = '<a onclick="changeState('+item.id+',2)">下架</a>';
                        }else{
                        	$operation = '<a onclick="changeState('+item.id+',1)">上架</a>';
                        }
                		 $(".goods-table tbody").append(
                		'<tr id="goods-'+item.id+'">'+
						
						'	<td><a href="'+item.link+'"><img src="'+item.headimg+'"></a></td>'+
						'	<td>'+item.id+'</td>'+
						'	<td><a href="'+item.link+'">'+item.name+'</a></td>'+
						'	<td>'+item.site+'</td>'+
						'	<td>'+item.location+'</td>'+
						'	<td>'+item.shipfee+' CNY</td>'+
						'	<td>'+item.currency+'</td>'+
						'	<td>'+item.type+'</td>'+
						'	<td>'+item.clas+'</td>'+
						'	<td>'+transTime(item.date,false)+'</td>'+
						'	<td><a href="goods.jsp?id='+item.id+'" target="_blank">查看</a>  '+$operation+'</td>'+
						'</tr>'
                		 );
	
                  	});

                    if(initPageFlag){
                        $(".pagination").pagination(data.amount, { 
                          prev_text: '&laquo;', 
                          next_text: '&raquo;',
                          ellipse_text:"...", 
                          items_per_page: 1, 
                          num_display_entries: 6, 
                          current_page: 0, 
                          num_edge_entries: 2,
                          link_to:"javascript:void(0);",
                          callback:pageSelectCallback
                            
                        });
                    }
                }
            });
            
            
		}


//点击页码查询

		function pageSelectCallback(current_page, aa){
			 qry(current_page+1,false);
		}
//更改状态
		window.changeState = function(id,state){
			
			$.ajax({
                url:'goods/change-state',
                data: {'id':id,'state':state},
                type:'post',
                dataType:'json',
                success:function(data){
                	if (data==true) {
                    	alert("操作成功...");
                   		$("#goods-"+id).remove();
                    }else{
                    	alert("操作失败...");

                    }
                   
                }
            });	
		}

//删除

	window.del = function(id){
		$(".del-id").html(id);
		jQuery('#modal-1').modal('show', {backdrop: 'fade'});
	}

	$(".del-confirm-btn").click(function(){
		var $id = $(".del-id").html();
			$.ajax({
                url:'news/del?id='+$id,
                type:'post',
                dataType:'json',
                success:function(data){
                	if (data==true) {
                    	alert("删除成功...");
                   		qry(true);
                    }else{
                    	alert("无法删除...");

                    }
                   
                }
            });		
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