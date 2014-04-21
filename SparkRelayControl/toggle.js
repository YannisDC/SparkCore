$(document).ready(function(){
    $(function(){ // DOM ready

      $("#on, #off").click(function(){
        var io = this.io ^= 1;
        $(this).text(io?"ON":"OFF").prop('id', io?"on":"off");
        if(io){
          $.ajax({
              type: "POST",
              url: "https://api.spark.io/v1/devices/INSERT-YOUR-DEVICE-ID/led",
              data: {
	            access_token: "INSERT-YOUR-ACCESS-TOKEN",
	            params: "l1,HIGH"
              },
             success: function() { $("#result").text("Success"); } ,
              dataType: "json"
            });
          document.getElementById("on").innerHTML="<p class='but'>OFF</p>";
          document.getElementById("on").id="off";
        }else{
          $.ajax({
              type: "POST",
              url: "https://api.spark.io/v1/devices/INSERT-YOUR-DEVICE-ID/led",
              data: {
	            access_token: "INSERT-YOUR-ACCESS-TOKEN",
	            params: "l1,LOW"
              },
             success: function() { $("#result").text("Success"); } ,
              dataType: "json"
            });
          document.getElementById("off").innerHTML="<p class='but'>ON</p>";
          document.getElementById("off").id="on";
        }
      });  
        
    $("#button")
  .on('click', '#test', function(){
    $.getJSON("https://api.spark.io/v1/devices/INSERT-YOUR-DEVICE-ID/ledOne?access_token=INSERT-YOUR-ACCESS-TOKEN", function(person){

    var p = JSON.parse(person.result);
    document.getElementById("result").innerHTML=p;
});
  });

    });  
    
});
