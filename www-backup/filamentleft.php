<!DOCTYPE html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>  

<script type="text/javascript" src="Highcharts/js/jquery.min.js"></script>
<script type="text/javascript" src="Highcharts/js/highcharts.js" ></script>
<script type="text/javascript" src="Highcharts/js/themes/grid-light.js"></script>

      <script type="text/javascript">
        $(document).ready(function() {
            var options = {
                chart: {
                    renderTo: 'container2',
                    type: 'column',
              //      marginRight: 130,
            //        marginBottom: 25
                },
 title: {
            text: 'Filament Left on Printer',
            x: -20 //center
        },
        subtitle: {
            text: '',
            x: -20
        },
  xAxis: {
	categories: []
    },
        
        yAxis: {
            title: {
                text: 'Filament Left (g)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ''
        },

        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
                series: [],

  //plotOptions: {
     //   series: {
     // pointStart: Date.UTC(2015, 4, 20),  
  //  pointInterval: 24 * 3600 * 1000, //one day        
    //        pointInterval: 7 * 24 * 3600 * 1000
  //      }
    
//}

        }
            $.getJSON("filamentleft_data.php", function(json) {
		options.xAxis.categories = json[0]['data'];
                options.series[0] = json[1];
		options.series[0].color = "#3300FF";
                chart = new Highcharts.Chart(options);
         chart.renderer.path(['M' , 80, 300, 'h',1100])
            .attr({
                'stroke-width': 1,
                stroke: 'red',
                zIndex:1000
            })
            .add();
           
});
        });
        </script>
<body>

<div id="container" style="width: 100%; height: 400px; margin: 0 auto"></div>
<div id="container2" style="width: 100%; height: 400px; margin: 0 auto"></div>

</body>
</html>
