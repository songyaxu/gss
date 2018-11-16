$('input[id=attachment]').change(
		function() {  
			var name=$(this).val();
			var realname=name.split("\\");
			$('#photoCover').val(realname[realname.length-1]);  
}); 
function up(type,id){
	var formData = new FormData($( "#upForm" )[0]);  
    $.ajax({  
         url: '/topic/upload/topic='+id+'/'+type,  
         type: 'POST',  
         data: formData,  
         async: false,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (data) {  
       	  if(data.statusCode=="1")
       	  {
       		  layer.msg(data.message, {icon: 1});
	       		setTimeout(function () {
					window.location.reload();
	            }, 1500);
       	  }
       	  else{
       		  layer.msg(data.message, {icon: 5});
       	  }
         },  
         error: function (returndata) {  
       	  layer.msg(data.message, {icon: 5});
         }  
    });
}

function recordit(id){
	var record = $("#record").val();
    $.get("/topic/record/"+id,{ record:record},
		    function(data){
    		if(data.statusCode=="1"){
    			layer.msg(data.message, {icon: 1});
    			setTimeout(function () {
					window.location.reload();
	            }, 1500);
    		}
    		else{
    	        layer.msg(data.message, {icon: 5});
    		}
	    });
}