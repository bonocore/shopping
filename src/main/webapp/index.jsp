<!DOCTYPE html>
<!--[if IE 9]><html lang="en-us" class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="en-us">
<!--<![endif]-->
<head>
	<jsp:include page="head.jsp" />
</head>
<body>
	<jsp:include page="navi.jsp" />

	<div class="container-fluid ">
		<div  id="productListContainer" class="list-group list-view-pf list-view-pf-view">
	</div>
	</div>
	<table class="datatable table table-striped table-bordered dataTable no-footer">
                  <tr role="row" class="odd">
                    <td>Pod Hostname</td>
                    <td><%= System.getenv("HOSTNAME") %></td>
                  </tr>
                  <tr role="row" class="even">
                    <td>Pod IP</td>
                    <td><%= System.getenv("MY_POD_IP") %></td>
                  </tr>
                  <tr role="row" class="odd">
                    <td>Used Memory</td>
                    <% int mb = 1024*1024; %>
                    <td><%= (Runtime.getRuntime().totalMemory()) / mb %> MB</td>
                  </tr>
                  <tr role="row" class="even">
                    <td>Session ID</td>
                    <td><%= session.getId() %></td>
                  </tr>
                </table>
</body>
<script>

	$(document).ready(function() {
//product list load
				$.ajax({
					  type: "GET",
					  url: "api/products/",
					  cache: false,
				       contentType: "application/json",
				       success: function(data) {
							$.each(data, function(i,product){
								$( "#productListContainer" ).append( "<div id=\"item"+product.id+"\" class=\"list-group-item\">"+
										"	<div class=\"list-view-pf-actions\">"+
										"		<button class=\"btn btn-default\" data-id=\""+product.id+"\"\">Add to cart</button>"+
										"	</div>"+
										"	<div class=\"list-view-pf-main-info\">"+
										"		<div class=\"list-view-pf-left\">"+
										"			<span class=\"fa "+product.icon+" list-view-pf-icon-sm\"></span>"+
										"		</div>"+
										"		<div class=\"list-view-pf-body\">"+
										"			<div class=\"list-view-pf-description\">"+
										"				<div class=\"list-group-item-heading\">"+product.description+"</div>"+
										"				<div class=\"list-group-item-text\">"+
										"					"+product.price+
										"				</div>"+
										"			</div>"+
										" 			<div class=\"list-view-pf-additional-info\">"+
								        "  				<div class=\"list-view-pf-additional-info-item\">"+
								        " 					<a href=\"#\">More infos...</a>."+
								        "				</div>"+
										"			</div>"+
										"		</div>"+
										"	</div>"+
										"</div>" );

								});
							$('button').click(function() {
								var itemId = "#item"+$(this).data('id')
								$.ajax({
									  type: "POST",
									  url: "api/shoppingCart/"+$(this).data('id'),
									  cache: false,
								       contentType: "application/json",
								       success: function() {
										$( "#alertContainer" ).append(
										   "<div class=\"alert alert-success alert-dismissable\">"+
											"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">"+
											"	<span class=\"pficon pficon-close\"></span>"+
											"</button>"+
												"<span class=\"pficon pficon-ok\"></span>"+
												"<strong>Success!</strong> Product added correctly to the cart "+
											"</div>");		

								       }
									});
						    });
					       }

					});	//.ajax


	 });
</script>
</html>
