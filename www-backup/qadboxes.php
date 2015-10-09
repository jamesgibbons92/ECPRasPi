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
                        defaultSeriesType: 'column',
                        marginRight: 130,
                        marginBottom: 25
                    },
                    title: {
                        text: 'QAd pieces and boxes',
                        x: -20 //center
                    },
                    subtitle: {
                        text: '',
                        x: -20
                    },
                    xAxis: {
                        type: 'datetime',
                        tickInterval: 3600 * 1000, // one hour
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
                            text: ''
                        },
                         min: 0,
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
                    }]
                }
                // Load data asynchronously using jQuery. On success, add the data
                // to the options and initiate the chart.
                // This data is obtained by exporting a GA custom report to TSV.
                // http://api.jquery.com/jQuery.get/
                jQuery.get('dataQA.php', null, function(tsv) {
                    var lines = [];
                    traffic = [];
                    try {
                        // split the data return into lines and parse them
                        tsv = tsv.split(/\n/g);
                        jQuery.each(tsv, function(i, line) {
                            line = line.split(/\t/);
                            date = Date.parse(line[0] +' UTC');
                            traffic.push([
                                date,
                                parseInt(line[1].replace(',', ''), 10)
                            ]);
                        });
                    } catch (e) {  }
                    options.series[0].data = traffic;
                    chart = new Highcharts.Chart(options);
                });
            });
</script>


/head>
<body>

<div id="container" style="width: 100%; height: 400px; margin: 0 auto"></div>
					
</body>
</html>
