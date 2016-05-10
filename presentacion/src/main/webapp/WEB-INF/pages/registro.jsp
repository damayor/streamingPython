<%@include file="header.jsp"%> 
<!-- <section class="navbar main-menu"> -->
<!-- 	<div class="navbar-inner main-menu"> -->
<!-- 		<nav id="menu" class="pull-left"> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/presentacion/">Alojamiento</a></li> -->
<!-- 				<li><a href="/presentacion/transporte/">Transporte</a> -->
<!-- 				<li><a href="./products.html">Alimentacion</a></li> -->
<!-- 				<li><a href="/presentacion/paseos/paseos">Paseos Turisticos</a></li> -->
<!-- 				<li><a href="./products.html">Paquetes</a></li> -->
<!-- 			</ul> -->
<!-- 		</nav> -->
<!-- 	</div> -->
<!-- </section> -->

<br><br>
<section class="main-content" style="margin-top: -25px">
	<h4 class="title" align="left">
		<span class="text">Registro y Autenticación</span>
	</h4>
	<div class="row">
		<div class="span5">
			<h4 class="title">
				<span class="text"><strong>Formulario </strong> de
					Autenticación</span>
			</h4>
			<form action="video" method="post">
				<input type="hidden" name="next" value="/">
				<fieldset>
					<div class="control-group">
						<label class="control-label">Correo Electrónico</label>
						<div class="controls">
							<input type="text" placeholder="Ingresa tu email"
								id="username" name="email"class="input-xlarge" required="required" value="dfarfan10">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Contraseña</label>
						<div class="controls">
							<input type="password" placeholder="Ingresa tu contraseña"
								id="password" name="password" class="input-xlarge" required="required" value="password">
						</div>
					</div>
					<div class="control-group">
						<input tabindex="3" class="btn btn-inverse large" type="submit"
							value="Ingresar">
						<hr>
						
					</div>
				</fieldset>
			</form>
		</div>
		<div class="span7">
			<h4 class="title">
				<span class="text"><strong>Formulario</strong> de Registro</span>
			</h4>
			<form action="video" method="post" class="form-stacked">
				<fieldset>
					<div class="control-group">
						<label class="control-label">* Nombre</label>
						<div class="controls">
							<input type="text" name="name" placeholder="Ingresa tu nombre"
								class="input-xlarge" required="required" value="Diego">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">* Email:</label>
						<div class="controls">
							<input type="text" name="email" placeholder="Ingresa tu email"
								class="input-xlarge" required="required" value="dfarfan10">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">* Contraseña:</label>
						<div class="controls">
							<input type="password" name="password"
								placeholder="Ingresa tu contraseña" class="input-xlarge"
								required="required" value="password">
						</div>
					</div>
					<hr>
					<div class="actions">
						<input tabindex="9" class="btn btn-inverse large" type="submit"
							value="Crear tu cuenta">
					</div>
				</fieldset>
			</form>
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
				<h4 class="modal-title">Información de la compra</h4>
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