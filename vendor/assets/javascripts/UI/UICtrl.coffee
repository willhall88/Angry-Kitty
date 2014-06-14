'use strict';

angular.module('app.ui.ctrls', [])

.controller('NotifyCtrl', [
    '$scope', 'logger'
    ($scope, logger) ->
        $scope.notify = (type)->
            switch type
                when 'info' then logger.log("Heads up! This alert needs your attention, but it's not super important.") 
                when 'success' then logger.logSuccess("Well done! You successfully read this important alert message.")
                when 'warning' then logger.logWarning("Warning! Best check yo self, you're not looking too good.")
                when 'error' then logger.logError("Oh snap! Change a few things up and try submitting again.")
])

.controller('AlertDemoCtrl', [
    '$scope'
    ($scope) ->
        $scope.alerts = [
            { type: 'success', msg: 'Well done! You successfully read this important alert message.' }
            { type: 'info', msg: 'Heads up! This alert needs your attention, but it is not super important.' }
            { type: 'warning', msg: "Warning! Best check yo self, you're not looking too good." }
            { type: 'danger', msg: 'Oh snap! Change a few things up and try submitting again.' }
        ]

        $scope.addAlert = ->
            num = Math.ceil(Math.random() * 4)
            type = undefined
            switch num
                when 0 then type = 'info'
                when 1 then type = 'success'
                when 2 then type = 'info'
                when 3 then type = 'warning'
                when 4 then type = 'danger'
            $scope.alerts.push({type: type, msg: "Another alert!"})

        $scope.closeAlert = (index)->
            $scope.alerts.splice(index, 1)
])

.controller('ProgressDemoCtrl', [
    '$scope'
    ($scope) ->
        $scope.max = 200
        $scope.random = ->
            value = Math.floor((Math.random() * 100) + 10)
            type = undefined
            if value < 25
                type = "success"
            else if value < 50
                type = "info"
            else if value < 75
                type = "warning"
            else
                type = "danger"
            $scope.showWarning = (type is "danger" or type is "warning")
            $scope.dynamic = value
            $scope.type = type
            return

        $scope.random()
])

.controller('AccordionDemoCtrl', [
    '$scope'
    ($scope) ->
        $scope.oneAtATime = true
        $scope.groups = [
            {
                title: "Dynamic Group Header - 1"
                content: "Dynamic Group Body - 1"
            }
            {
                title: "Dynamic Group Header - 2"
                content: "Dynamic Group Body - 2"
            }
            {
                title: "Dynamic Group Header - 3"
                content: "Dynamic Group Body - 3"
            }
        ]
        $scope.items = [
            "Item 1"
            "Item 2"
            "Item 3"
        ]
        $scope.addItem = ->
            newItemNo = $scope.items.length + 1
            $scope.items.push "Item " + newItemNo
            return
        return
])

.controller('CollapseDemoCtrl', [
    '$scope'
    ($scope) ->
        $scope.isCollapsed = false
])

.controller('ModalDemoCtrl', [
    '$scope', '$modal', '$log'
    ($scope, $modal, $log) ->
        $scope.items = [
            "item1"
            "item2"
            "item3"
        ]
        $scope.open = ->
            modalInstance = $modal.open(
                templateUrl: "myModalContent.html"
                controller: 'ModalInstanceCtrl'
                resolve:
                    items: ->
                        $scope.items
            )
            modalInstance.result.then ((selectedItem) ->
                $scope.selected = selectedItem
                return
            ), ->
                $log.info "Modal dismissed at: " + new Date()
                return

            return

        return

])
.controller('ModalInstanceCtrl', [
    '$scope', '$modalInstance', 'items'
    ($scope, $modalInstance, items) ->
        $scope.items = items
        $scope.selected = item: $scope.items[0]
        $scope.ok = ->
            $modalInstance.close $scope.selected.item
            return

        $scope.cancel = ->
            $modalInstance.dismiss "cancel"
            return

        return
])

.controller('PaginationDemoCtrl', [
    '$scope'
    ($scope) ->
        $scope.totalItems = 64
        $scope.currentPage = 4
        $scope.maxSize = 5

        $scope.setPage = (pageNo) ->
            $scope.currentPage = pageNo

        $scope.bigTotalItems = 175
        $scope.bigCurrentPage = 1
])

# .controller('CarouselDemoCtrl', [
#     '$scope'
#     ($scope) ->
#         $scope.myInterval = 5000
#         $scope.slides = [
#             {image: 'images/slides/1.jpg', text: 'Content goes here'}
#             {image: 'images/slides/4.jpg', text: 'More content'}
#             {image: 'images/slides/3.jpg', text: 'Extra content'}
#         ]
# ])

.controller('TabsDemoCtrl', [
    '$scope'
    ($scope) ->
        $scope.tabs = [
          {
            title: "Dynamic Title 1"
            content: "Dynamic content 1.  Consectetur adipisicing elit. Nihil, quidem, officiis, et ex laudantium sed cupiditate voluptatum libero nobis sit illum voluptates beatae ab. Ad, repellendus non sequi et at."
          }
          {
            title: "Disabled"
            content: "Dynamic content 2.  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil, quidem, officiis, et ex laudantium sed cupiditate voluptatum libero nobis sit illum voluptates beatae ab. Ad, repellendus non sequi et at."
            disabled: true
          }
        ]

        $scope.navType = "pills"
])









