<?php

session_start();

 include 'connect.php';
 
 error_reporting(0);

// 5 productos mas vendidos

$productos3 = "SELECT producto_vendido, SUM(cantidad) as total_ventas FROM ventas GROUP BY producto_vendido ORDER BY total_ventas DESC LIMIT 5";
$resultProductos = mysqli_query($conn, $productos3);

$productos = array();
$ventasTotales = array();

if ($resultProductos) {
    while ($row = mysqli_fetch_assoc($resultProductos)) {
        $productos[] = $row["producto_vendido"];
        $ventasTotales[] = $row["total_ventas"];
    }
}

$productos_json = json_encode($productos);
$ventasTotales_json = json_encode($ventasTotales);

// stock de cada producto

$stock = "SELECT nombre_producto, stock FROM productos";
$resultStock = mysqli_query($conn, $stock);

$producto2 = array();
$stock2 = array();

if ($resultStock) {
    while ($row = mysqli_fetch_assoc($resultStock)) {
        $producto2[] = $row["nombre_producto"];
        $stock2[] = $row["stock"];
    }
}

$producto2_json = json_encode($producto2);
$stock2_json = json_encode($stock2);

// inversion

$inversion = "SELECT SUM(precio_unitario * cantidad_adquirida) AS total FROM proveedor";
$resultInversion = mysqli_query($conn, $inversion);

// ganancia bruta

$gananciaBruta = "SELECT SUM(precio_unitario * cantidad) AS total2 FROM ventas";
$resultGananciaBruta = mysqli_query($conn, $gananciaBruta);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MySQL con PHP</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <?php
                    while($rowInversion = mysqli_fetch_array($resultInversion)){
                ?>
                <div class="bg-success text-white text-center m-1">
                    <div class="card-header">Total inversion</div>
                    <div class="card-body">
                        <h5 class="h1 card-title"><span id="idVendidos">$<?php $Inver = $rowInversion["total"]; echo $Inver; ?></span></h5>
                        <p class="card-text">Inversion en materia</p>
                    </div>
                </div>
                <?php
                    }
                ?>
            </div>
            <div class="col-md-4">
                <?php
                    while($rowGananciaBruta = mysqli_fetch_array($resultGananciaBruta)){
                ?>
                <div class="bg-warning text-white text-center m-1">
                    <div class="card-header">Ganancias brutas</div>
                        <div class="card-body">
                        <h5 class="h1 card-title"><span id="idAlmacen">$<?php $Gana = $rowGananciaBruta["total2"]; echo $Gana; ?></span></h5>
                        <p class="card-text">Ingreso total por ventas.</p>
                    </div>
                </div>
                <?php
                    }
                ?>
            </div>
            <div class="col-md-4">
                <div class="bg-info text-white text-center m-1">
                    <div class="card-header">Ganancias netas</div>
                        <div class="card-body">
                        <h5 class="h1 card-title"><span id="idIngreso">$<?php echo $Gana - $Inver; ?></span></h5>
                        <p class="card-text">Ganancia real.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                            Mas vendidos.
                    </div>
                    <div class="charts">
                        <div class="charts-card">
                            <canvas id="oilChart" width="150" height="100"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                            Cantidad de Stock por producto.
                    </div>
                    <div class="charts">
                        <div class="charts-card">
                            <div style="width: 80%; margin: 0 auto;">
                                <canvas id="myBarChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <!--<script src="js/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>-->
	<script>
            var productos = <?php echo $productos_json; ?>;
            var ventasTotales = <?php echo $ventasTotales_json; ?>;
            
            var producto2 = <?php echo $producto2_json; ?>;
            var stock2 = <?php echo $stock2_json; ?>;
        </script>
    <script src="js/scripts.js"></script>
    <script src="js/scripts2.js"></script>
</body>
</html>