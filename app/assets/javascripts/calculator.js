function show_result(data)
{
  var result = $('#result');

  if (data.type !== "String")
  {
    result.append("<hr/>Result : " + data.value.join(', ') + "<hr/><p>"+Date()+"</p>");
  }
  else
  {
    result.append("<hr/>" + data.value + "<tr/><p>" + Date() + "</p");
  }
}

$(document).ready(function()
{
 $("#calc_form").bind("ajax:success", function(xhr, data, status) { show_result(xhr.detail[0]) } )
})
