<nav class="navbar navbar-default navbar-pf" role="navigation">
	<div class="navbar-header">
	  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-1">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	  </button>
	  <img src="img/RH_logo_bad.png"/> 
	  <!--<img src="img/RH_logo.png"/>-->
	  </a>
	</div>
	<script>
		var pathname = window.location.pathname; 
		console.log(pathname);
		if(pathname.indexOf("index") != -1)
		{
    	console.log("index found");
			$('#indexLink').addClass('active');
			$('#shoppingLink').removeClass('active')
		}	else
		{
			console.log("index not found");
			$('#shoppingLink').addClass('active');
			$('#indexLink').removeClass('active')
		}
	</script>

	<div class="collapse navbar-collapse navbar-collapse-1">
	  <ul class="nav navbar-nav navbar-primary">
		<li id="indexLink">
		  <a  href="./index.jsp" >Home</a>
		</li>
		<li id="shoppingLink" >
		  <a  href="./shoppingCart.jsp"> Carrello</a>
		</li>
	  </ul>
	</div>
  </nav>