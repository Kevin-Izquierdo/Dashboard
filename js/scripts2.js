// Datos de ejemplo
        // Obtener el contexto del lienzo (canvas)
        var ctx = document.getElementById('myBarChart').getContext('2d');

        // Crear la gráfica de barras laterales
        var myBarChart = new Chart(ctx, {
            type: 'horizontalBar',
            data: {
                labels: producto2,
                datasets: [{
                    label: 'Valores',
                    data: stock2,
                    backgroundColor: [
                "#FF6384",
                "#63FF84",
                "#84FF63",
                "#8463FF",
                "#6384FF",
                "#62ff36"
            ]
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                title: {
                    display: true,
                    text: 'Gráfica de Barras Laterales'
                }
            }
        });