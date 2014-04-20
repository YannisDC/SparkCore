$(document).ready(function(){
  $("#on").click(function(){
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
    //alert("You just turned me on!")
  });

$("#off").click(function(){
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
  });
});