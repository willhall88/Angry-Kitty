'use strict'

angular.module('app.chart.directives', [])

.directive('gaugeChart', [ -> # The online docs seems outdate, i.e. not working
    return {
        restrict: 'A'
        scope:
            data: '='
            options: '='
        link: (scope, ele, attrs) ->
            data = scope.data
            options = scope.options

            gauge = new Gauge(ele[0]).setOptions(options)
            gauge.maxValue = data.maxValue
            gauge.animationSpeed = data.animationSpeed
            gauge.set(data.val)
    }
])
.directive('flotChart', [ ->
    return {
        restrict: 'A'
        scope:
            data: '='
            options: '='
        link: (scope, ele, attrs) ->
            data = scope.data
            options = scope.options
            
            # console.log data
            # console.log options

            plot = $.plot(ele[0], data, options);

    }
])
.directive('flotChartRealtime', [ ->
    return {
        restrict: 'A'
        link: (scope, ele, attrs) ->
            data = []
            totalPoints = 300
            getRandomData = ->
                data = data.slice(1)  if data.length > 0
                
                # Do a random walk
                while data.length < totalPoints
                    prev = (if data.length > 0 then data[data.length - 1] else 50)
                    y = prev + Math.random() * 10 - 5
                    if y < 0
                        y = 0
                    else y = 100  if y > 100
                    data.push y
                
                # Zip the generated y values with the x values
                res = []
                i = 0

                while i < data.length
                    res.push [
                        i
                        data[i]
                    ]
                    ++i
                res

            update = ->
                plot.setData [getRandomData()]
                
                # Since the axes don't change, we don't need to call plot.setupGrid()
                plot.draw()
                setTimeout update, updateInterval
                return
            data = []
            totalPoints = 300
            updateInterval = 200
            plot = $.plot(ele[0], [getRandomData()],
                series:
                    lines:
                        show: true
                        fill: true
                    shadowSize: 0
                yaxis:
                    min: 0
                    max: 100
                xaxis:
                    show: false
                grid:
                    hoverable: true
                    borderWidth: 1
                    borderColor: '#eeeeee'
                colors: ["#5BC0C4"]
            )
            update()

    }
])
.directive('sparkline', [ ->
    return {
        restrict: 'A'
        scope:
            data: '='
            options: '='
        link: (scope, ele, attrs) ->
            data = scope.data
            options = scope.options
            sparkResize = undefined

            sparklineDraw = ->
                ele.sparkline(data, options)

            $(window).resize( (e) ->
                clearTimeout(sparkResize)
                sparkResize = setTimeout(sparklineDraw, 200)
            )

            sparklineDraw()
    }
])
.directive('morrisChart', [ ->
    return {
        restrict: 'A'
        scope:
            data: '='
        link: (scope, ele, attrs) ->
            data = scope.data

            switch attrs.type
                when 'line'
                    if (attrs.lineColors == undefined || attrs.lineColors is '')
                        colors = null
                    else
                        colors = JSON.parse(attrs.lineColors)

                    options = {
                        element: ele[0]                     # required
                        data: data                          # required
                        xkey: attrs.xkey                    # required
                        ykeys: JSON.parse(attrs.ykeys)      # required
                        labels: JSON.parse(attrs.labels)    # required
                        lineWidth: attrs.lineWidth || 2
                        lineColors: colors || ['#0b62a4', '#7a92a3', '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
                        resize: true
                    }
                    new Morris.Line( options )

                when 'area'
                    if (attrs.lineColors == undefined || attrs.lineColors is '')
                        colors = null
                    else
                        colors = JSON.parse(attrs.lineColors)

                    options = {
                        element: ele[0]                     # required
                        data: data                          # required
                        xkey: attrs.xkey                    # required
                        ykeys: JSON.parse(attrs.ykeys)      # required
                        labels: JSON.parse(attrs.labels)    # required
                        lineWidth: attrs.lineWidth || 2
                        lineColors: colors || ['#0b62a4', '#7a92a3', '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
                        behaveLikeLine: attrs.behaveLikeLine || false
                        fillOpacity: attrs.fillOpacity || 'auto'
                        pointSize: attrs.pointSize || 4
                        resize: true
                    }
                    new Morris.Area( options )

                when 'bar'
                    if (attrs.barColors == undefined || attrs.barColors is '')
                        colors = null
                    else
                        colors = JSON.parse(attrs.barColors)

                    options = {
                        element: ele[0]                     # required
                        data: data                          # required
                        xkey: attrs.xkey                    # required
                        ykeys: JSON.parse(attrs.ykeys)      # required
                        labels: JSON.parse(attrs.labels)    # required
                        barColors: colors || ['#0b62a4', '#7a92a3', '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
                        stacked: attrs.stacked || null
                        resize: true
                    }
                    new Morris.Bar( options )

                when 'donut'
                    if (attrs.colors == undefined || attrs.colors is '')
                        colors = null
                    else
                        colors = JSON.parse(attrs.colors)

                    options = {
                        element: ele[0]                     # required
                        data: data                          # required
                        colors: colors || ['#0B62A4', '#3980B5', '#679DC6', '#95BBD7', '#B0CCE1', '#095791', '#095085', '#083E67', '#052C48', '#042135']
                        resize: true
                    }

                    if attrs.formatter
                        func = new Function('y', 'data', attrs.formatter)
                        options.formatter = func
                    new Morris.Donut( options )

    }
])