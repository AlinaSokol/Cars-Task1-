<html>
	<head>
		<title>Cars</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/jquery.maskedinput@1.4.1/src/jquery.maskedinput.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$( document ).ready(function () {
				$("#phone").mask("+375(99) 999-99-99");

				function selection(url, userData) {
					$.ajax({
	                	url: url,     
	                	method: 'get',   
	                	dataType: 'json',
	                	data: userData,
	                	success: function (data) {
                			if (data.id != 'undefined' && data != 1) {
                				data.map(function(item) {
									var opt = new Option(item.model, item.id);
									$('#models').append(opt);
								});
                			}
                			else if (data) {
                				alert('Ваш заказ принят в обработку!');
                			}
						}
					});
				}
		        $('#car_brands').on('change', function () {
		        	let param = $(this).val();
			        selection ('ajax.php', {'car_brands': param});
			    });

			    $("form").on('submit', function() {
					event.preventDefault();
					let coll = $(this).find('.form-control');
					let result = {};
					for (let element of coll) {
						result[element.name] = element.value;
				    }
					selection('ajax_create.php', result);
				});
			});
		</script>
	</head>

	<body>
		<?php  
			$address = 'localhost';
			$username = 'root';
			$password = '';
			$database = 'auto';
			$charset = 'utf8';

			try {
				$pdo = new PDO ("mysql:host=$address;dbname=$database", $username, $password);
				$pdo->setAttribute (PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			} catch (PDOException $e) {
				echo "Ошибка: " . $e->getMessage();
			} 
		?>
		<div class="row justify-content-center align-items-center">
			<div class="col-sm-6">
				<form id="autoshop" name="autoshop" action="/" method="get">
					<div class="form-group car-options"> 
						<div class="row">                
							<div class="col-sm-4">
								<select class="dropdown form-control" name="car_brands" id="car_brands">
									<option disabled selected value="">Choose car brand</option>
									<?php 
										$sql_select_car_brands = $pdo->query("SELECT * FROM `Car brands`");

										while ($row = $sql_select_car_brands->fetch(PDO::FETCH_ASSOC)) {
											echo "<option value={$row['id']}>{$row['car_brand']}</option>";
										} 
									?>
								</select>
							</div>
							<div class="col-sm-4">
								<select class="dropdown form-control" name="models" id="models">
									<option disabled selected value="">Choose model</option>
								</select>
							</div>
							<div class="col-sm-4">
								<select class="dropdown form-control" name="spare_part" id="spare_part">
									<option disabled selected value="">Choose spare part</option>
									<?php
										$sql_select_spare_parts = $pdo->query("SELECT * FROM `Spare parts`");

										while ($row = $sql_select_spare_parts->fetch(PDO::FETCH_ASSOC)) {
											echo "<option value={$row['id']}>{$row['spare_part']}</option>";
										} 
									?>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group text-field">
						<label for="username">Your name</label>
						<input type="text" id="username" name="username" class="form-control" placeholder="Your name" />
					</div>
					
					<div class="form-group text-field">
						<label for="phone">Phone</label>
						<input type="tel" id="phone" name="phone" class="form-control" placeholder="Phone" />
					</div>

					<div class="form-group submit">
						<button type="submit" name="send" class="btn btn-primary btn-sm form-control">Send</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
