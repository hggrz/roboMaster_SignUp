//折线图
var line = echarts.init(document.getElementById('line'));
line.setOption({
    color:["#32d2c9"],
    title: {
        x: 'left',
        text: '质询部门考核2018-1~2018-12统计',
        textStyle: {
            fontSize: '18',
            color: '#4c4c4c',
            fontWeight: 'bolder'
        }
    },
    tooltip: {
        trigger: 'axis'
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']}
        }
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['2018-1','2018-2','2018-3','2018-4','2018-5','2018-6','2018-7','2018-8','2018-9','2018-10','2018-11','2018-12'],
        axisLabel: {
            interval:0
        }
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name:'考核分',
            type:'line',
            data:[23, 42, 58, 45, 48, 49,100,23, 42, 50, 45, 100],
            markLine: {data: [{type: 'average', name: '平均考核分'}]}
        }
    ]
}) ;


