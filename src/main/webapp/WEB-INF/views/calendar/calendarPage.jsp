<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>Web Application | todo</title>
	<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<link rel="stylesheet" href="/css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="/css/animate.css" type="text/css" />
	<link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css" />
	<link rel="stylesheet" href="/css/font.css" type="text/css" cache="false" />
	<link rel="stylesheet" href="/css/fuelux/fuelux.css" type="text/css" />
	<link rel="stylesheet" href="/css/fullcalendar/fullcalendar.css" type="text/css" />
	<link rel="stylesheet" href="/css/plugin.css" type="text/css" />
	<link rel="stylesheet" href="/css/app.css" type="text/css" />
</head>
<body>
<section class="hbox stretch">
	<!-- .vbox -->
	<section id="content">
	  <section class="vbox">
		<section class="bg-light lter">
		  <section class="hbox stretch">
			<!-- .aside -->
			<aside>
			  <section class="vbox">
				<section class="scrollable">
				  <section class="panel">
					<header class="panel-heading bg-light header no-borders"></header>
					<div class="calendar" id="calendar">

					</div>
				  </section>
				</section>
			  </section>
			</aside>
			<!-- /.aside -->
			<!-- .aside -->
			<aside class="aside-lg b-l">
			  <div class="padder">
				<h5>Dragable events</h5>
				<div class="line"></div>
				<div id="myEvents" class="pillbox clearfix m-b no-border no-padder">
				  <ul>
					<li class="label bg-dark">Item One</li>
					<li class="label bg-success">Item Two</li>
					<li class="label bg-warning">Item Three</li>
					<li class="label bg-danger">Item Four</li>
					<li class="label bg-info">Item Five</li>
					<li class="label bg-primary">Item Six</li>
					<input type="text" placeholder="add an event">
				  </ul>
				</div>
				<div class="line"></div>
				<div class="checkbox">
				  <label class="checkbox-custom"><input type='checkbox' id='drop-remove' /><i class="fa fa-unchecked"></i> remove after drop</label>
				</div>
			  </div>
			</aside>
			<!-- /.aside -->
		  </section>
		</section>
	</section>
	</section>
	<!-- /.vbox -->
</section>
	<script src="/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	  <script src="/js/bootstrap.js"></script>
	<!-- App -->
	<script src="/js/app.js"></script>
	<script src="/js/app.plugin.js"></script>
	<script src="/js/app.data.js"></script>
	<!-- fuelux -->
	<script src="/js/fuelux/fuelux.js"></script>
	<!-- fullcalendar -->
	<script src="/js/jquery-ui-1.10.3.custom.min.js" cache="false"></script>
	<script src="/js/jquery.ui.touch-punch.min.js" cache="false"></script>
	<script src="/js/fullcalendar/fullcalendar.min.js" cache="false"></script>
</body>
</html>