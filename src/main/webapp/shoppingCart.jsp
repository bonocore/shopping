<!DOCTYPE html>
<!--[if IE 9]><html lang="en-us" class="ie9"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="en-us">
<!--<![endif]-->
<head>
<title>OpenShift Shopping</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="stylesheet" href="css/patternfly.min.css">
<link rel="stylesheet" href="css/patternfly-additions.min.css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.matchHeight/0.6.0/jquery.matchHeight-min.js"></script>
<script
	src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
<script src="js/patternfly.min.js"></script>
<script src="js/demo.js"></script>

</head>
<body>
	<nav class="navbar navbar-default navbar-pf" role="navigation">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
       <!--<img src="img/RH_logo_green.png"/> -->
          <img src="img/RH_logo.png"/>
        </a>
      </div>
      <div class="collapse navbar-collapse navbar-collapse-1">
        <ul class="nav navbar-nav navbar-primary">
          <li >
            <a href="./index.jsp" >Home</a>
          </li>
          <li class="active">
            <a href="./shoppingCart.jsp" class="active">Carrello</a>
          </li>
        </ul>
      </div>
    </nav>

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
					  url: "api/shoppingCart/",
					  cache: false,
				       contentType: "application/json",
				       success: function(data) {
							$.each(data, function(i,product){
								$( "#productListContainer" ).append( "<div id=\"item"+product.id+"\" class=\"list-group-item\">"+
										"	<div class=\"list-view-pf-actions\">"+
										"		<button class=\"btn btn-default\" data-id=\""+product.id+"\"\">Elimina dal carrello</button>"+
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
										"		</div>"+
										"	</div>"+
										"</div>" );

								});
							$('button').click(function() {
								var itemId = "#item"+$(this).data('id')
								$.ajax({
									  type: "DELETE",
									  url: "api/shoppingCart/"+$(this).data('id'),
									  cache: false,
								       contentType: "application/json",
								       success: function() {
									       
									       console.log(itemId);
								    	   $(itemId).hide();
								       }
									});
						    });				
					       }

					});	//.ajax
				 	
						
	 });
</script>
</html>
