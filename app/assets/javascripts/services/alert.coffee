angular.module('sfdclogin.services')
.factory 'Alert', ($rootScope, $timeout)->
  alerts = []
  $rootScope.alerts = alerts
  class Alert
    constructor: (@type, @message, timeout)->
      alerts.push this
      $timeout(@close, timeout) if timeout?
    close: ->
      $rootScope.$evalAsync ->
        alerts.splice(alerts.indexOf(alert), 1)
