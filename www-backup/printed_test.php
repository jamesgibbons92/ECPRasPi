<!DOCTYPE html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>  

<script type="text/javascript" src="Highcharts/js/jquery.min.js"></script>
<script type="text/javascript" src="Highcharts/js/highcharts.js" ></script>
<script type="text/javascript" src="Highcharts/js/themes/gray.js"></script>


<script type="text/javascript">
    var chart;
            $(document).ready(function() {
                var options = {
                    chart: {
                        renderTo: 'container',
                        defaultSeriesType: 'line',
                        marginRight: 130,
                        marginBottom: 25
                    },
                    title: {
                        text: 'Printed Piecs',
                        x: -20 //center
                    },
                    subtitle: {
                        text: '',
                        x: -20
                    },
                    xAxis: {
                        type: 'datetime',
                        tickInterval: 7 * 24 * 3600 * 1000, // one week
                        tickWidth: 0,
                        gridLineWidth: 1,
                        labels: {
                            align: 'center',
                            x: -3,
                            y: 20,
                            formatter: function() {
                                return Highcharts.dateFormat('%l%p', this.value);
                            }
                        }
                    },
                    yAxis: {
                        title: {
                            text: 'Number of pieces'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        formatter: function() {
                                return Highcharts.dateFormat('%l%p', this.x-(1000*3600)) +'-'+ Highcharts.dateFormat('%l%p', this.x) +': <b>'+ this.y + '</b>';
                        }
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'top',
                        x: -10,
                        y: 100,
                        borderWidth: 0
                    },
                    series: [{
                        name: 'Count'
		//	data: [<?php include 'test.php'; echo $acc; ?>]
                    }]
                }
               
            });
</script>


/head>
<body>

<div id="container" style="width: 100%; height: 400px; margin: 0 auto"></div>
					
</body>
</html>
