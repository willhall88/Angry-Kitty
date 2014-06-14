'use strict';

angular.module('app.controllers', [])

# overall control
.controller('AppCtrl', [
    '$scope', '$location'
    ($scope, $location) ->
        $scope.isSpecificPage = ->
            path = $location.path()
            return _.contains( ['/404', '/pages/500', '/pages/login', '/pages/signin', '/pages/signin1', '/pages/signin2', '/pages/signup', '/pages/signup1', '/pages/signup2', '/pages/lock-screen'], path )

        $scope.main =
            brand: 'Flatify'
            name: 'Lisa Doe' # those which uses i18n can not be replaced with two way binding var for now.

])

.controller('NavCtrl', [
    '$scope', 'taskStorage', 'filterFilter'
    ($scope, taskStorage, filterFilter) ->
        # init
        tasks = $scope.tasks = taskStorage.get()
        $scope.taskRemainingCount = filterFilter(tasks, {completed: false}).length

        $scope.$on('taskRemaining:changed', (event, count) ->
            $scope.taskRemainingCount = count
        )
])

.controller('DashboardCtrl', [
    '$scope'
    ($scope) ->

        $scope.comboChartData = [
            ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average']
            ['2014/05',  165,      938,         522,             998,           450,      614.6]
            ['2014/06',  135,      1120,        599,             1268,          288,      682]
            ['2014/07',  157,      1167,        587,             807,           397,      623]
            ['2014/08',  139,      1110,        615,             968,           215,      609.4]
            ['2014/09',  136,      691,         629,             1026,          366,      569.6]
        ]

        $scope.salesData = [
            ['Year', 'Sales', 'Expenses']
            ['2010',  1000,      400]
            ['2011',  1170,      460]
            ['2012',  660,       1120]
            ['2013',  1030,      540]
        ]

])
