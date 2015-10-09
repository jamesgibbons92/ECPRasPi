$(document).ready(function() {


	function create_chart (DataQA) {
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'QA Pieces'
        },
        xAxis: {
            categories: ['Mon', 'Tues', 'Wed', 'Thurs', 'Fri']
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Pieces'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'orange'
                }
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 25,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
   tooltip: {
            shared: true
        },
         plotOptions: {
            column: {
                grouping: false,
                shadow: false,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Visual Checked',
            data: [
			DataQA[0][1], 
			DataQA[1][1],
			DataQA[2][1],
			DataQA[3][1],
			DataQA[4][1]
			]
        }, {
            name: 'QA',
            data: [
			DataQA[0][2], 
			DataQA[1][2],
			DataQA[2][2],
			DataQA[3][2],
			DataQA[4][2]
			]
        }]
    });


}

$.ajax({
	url: "DataQA.php",
	cache: false,
	type: 'json'
}).success(function(data){
	console.log(data); //delete this in productio 
	create_chart(data);
}).error(function() {
	alert('Error retrieving infomation');
});

});
 