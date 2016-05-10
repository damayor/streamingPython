<%@include file="header.jsp"%>
 
<section class="header_text sub">

	<section class="span col">
		<div class="row">
			<div class="block" style="text-align: left !important">
			<h4>Visualizacion del video</h4>
				<video width="320" height="240" controls>
					<source src="${pageContext.request.contextPath}/resources/themes/laCura.mp4" type="video/mp4">
					<source src="${pageContext.request.contextPath}/resources/themes/laCura.ogg" type="video/ogg">
				</video>

			</div>
		</div>
	</section>
	<section class="span0 col" style="margin-left:60px">
  	</section>
	<section class="span4 col">
	<div class="row">
		<div class="span8">
		
		<h4>Subir video</h4>
		
				<form action="subir"
					enctype="multipart/form-data" method="post">
					<p>
						Subir video<br>
						 <input type="file" name="datafile">
					</p>
					<div>
						<input type="submit" value="Send">
					</div>
				</form>
				
				<input type="button" onclick="location.href='/presentacion/streaming';" value="Streaming" />
				<a href="/presentacion/streaming"> Iniciar Streaming</a>


				<ul class="thumbnails listing-products">
				<c:forEach items="${servicios}" var="servicio" begin="0" end="1"> 
					<li class="span4">
						<div class="product-box">
							<span class="sale_tag"></span> 
							<a href="/presentacion/getAlojamiento/${servicio.idservicios}/">
								<img alt="${servicio.nombre}" src="${servicio.rutaGaleria}" style="height:230px; max-with:342px">
							</a>
							<br /> 
							<a href="/presentacion/getAlojamiento/${servicio.idservicios}/" class="title">${servicio.nombre}</a>
							<p class="name">${servicio.alojamiento.nombre}</p>
							<p class="title">$${servicio.precio}</p>
							<p><b>Descuento $${servicio.descuento}</b></p>
												
							
							<c:if test="${servicio.alojamiento.wifi}">
								<span class="title" title="Wifi"><img src="${pageContext.request.contextPath}/resources/themes/images/wifi.png" title="Internet Gratis" width="16px"/></span>
							</c:if>
							<c:if test="${servicio.alojamiento.piscina}">
								<span class="title" title="Piscina"><img src="${pageContext.request.contextPath}/resources/themes/images/pool.png" title="Piscina" width="16px"/></span>
							</c:if>
							<c:if test="${servicio.alojamiento.aire_acondicionado}">
							   <span class="title" title="Aire Acondicionado"><img src="${pageContext.request.contextPath}/resources/themes/images/winter.png" title="Aire Acondicionado"  width="16px"/></span>
							</c:if>
							<p class="category">${servicio.alojamiento.ciudad}</p>
							<p class="buttons center">	
								<a href="/presentacion/getAlojamiento/${servicio.idservicios}/">			
									<button class="btn" type="button" >Ver Detalle</button>
								</a>
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</section>
</section>

<section class="main-content">
	<div class="row">
		<div class="span12">
			<ul class="thumbnails listing-products">
				<c:forEach items="${servicios}" var="servicio" begin="2">
					<li class="span4">
						<div class="product-box">
							<span class="sale_tag"></span> 
							<a href="/presentacion/getAlojamiento/${servicio.idservicios}/">
								<img alt="${servicio.nombre}" src="${servicio.rutaGaleria}" style="height:230px; max-with:342px">
							</a>
							<br /> 
							<a href="/presentacion/getAlojamiento/${servicio.idservicios}/" class="title">${servicio.nombre}</a> 
							<p class="name">${servicio.alojamiento.nombre}</p>
							<p class="title">$${servicio.precio}</p>
							<p><b>Descuento $${servicio.descuento}</b></p>
							<c:if test="${servicio.alojamiento.wifi}">
								<span class="title" title="Wifi"><img src="${pageContext.request.contextPath}/resources/themes/images/wifi.png" title="Internet Gratis" width="16px"/></span>
							</c:if>
							<c:if test="${servicio.alojamiento.piscina}">
								<span class="title" title="Piscina"><img src="${pageContext.request.contextPath}/resources/themes/images/pool.png" title="Piscina" width="16px"/></span>
							</c:if>
							<c:if test="${servicio.alojamiento.aire_acondicionado}">
							   <span class="title" title="Aire Acondicionado"><img src="${pageContext.request.contextPath}/resources/themes/images/winter.png" title="Aire Acondicionado"  width="16px"/></span>
							</c:if>
							<p class="category">${servicio.alojamiento.ciudad}</p>
							<p class="buttons center">	
								<a href="/presentacion/getAlojamiento/${servicio.idservicios}/">			
									<button class="btn" type="button" >Ver Detalle</button>
								</a>
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</section>
<c:if test="${response != null}">
	<script type="text/javascript">
	    $(window).load(function(){
	        $('#myModal').modal('show');
	    });
	</script>
</c:if>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-sm">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					onclick="$('.modal').hide()">&times;</button>
				<h4 class="modal-title">Información de autenticación</h4>
			</div>
			<div class="modal-body">
				<h5><strong style="color:#eb4800;">${response}</strong></h5>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"
					onclick="$('.modal').hide()">Aceptar</button>
			</div>
		</div>

	</div>
</div>

<%@include file="footer.jsp"%>
