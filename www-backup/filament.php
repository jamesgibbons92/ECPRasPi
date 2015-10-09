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
                    renderTo: 'container',
                    type: 'column',
              //      marginRight: 130,
            //        marginBottom: 25
                },
 title: {
            text: 'Pieces Printed',
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
                text: 'Amount'
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
            $.getJSON("test.php", function(json) {
		options.xAxis.categories = json[0]['data'];
                options.series[0] = json[1];
		options.series[0].color = "#3300FF";
		options.series[1] = json[2];
		options.series[1].color = "#FF3300";
		options.series[2] = json[3];
		options.series[2].color = "#FF6600";
		options.series[3] = json[4];
 		options.series[3].color = "#FF0000";
                chart = new Highcharts.Chart(options);
            });
        });
        </script>
<body>

<div id="container" style="width: 100%; height: 400px; margin: 0 auto"></div>
<div id="container2" style="width: 100%; height: 400px; margin: 0 auto"></div>

</body>
</html>
