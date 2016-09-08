# ./lib.js will be included here
#= require controllers/controllers.coffee
#= require services/services.coffee
angular.module('sfdclogin', [
  'ui.router',
  'templates',
  'sfdclogin.controllers',
  'sfdclogin.services',
  'ui.bootstrap',
  'ui.bootstrap.datetimepicker',
  'ngDialog',
  'angular.filter',
  'angular-loading-bar',
  'ngAnimate',
  'LocalStorageModule',
  'ngclipboard',
  'ab-base64',
  'angulartics',
  'angulartics.google.analytics'
])
  .config ($urlRouterProvider)->
    $urlRouterProvider.otherwise('/login')
  .config (cfpLoadingBarProvider)->
    cfpLoadingBarProvider.includeSpinner = false
  .config (localStorageServiceProvider)->
    localStorageServiceProvider.setPrefix('sfdc')
  .directive 'backToTop', ->
    restrict: 'E'
    replace: true
    template: '<div class="back-to-top"><a class=""><i class="fa fa-chevron-up fa-lg"></i></div>'
    link: ($scope, element, attrs) ->
      $(window).scroll ->
        if $(window).scrollTop() <= 0
          $(element).fadeOut()
        else
          $(element).fadeIn()
      $(element).on 'click', ->
        $('html, body').animate { scrollTop: 0 }, 'fast'
  .directive 'myDownload', ($compile)->
    restrict: 'E'
    scope:
      getUrlData: '&getData'
    link: (scope, elm, attrs)->
      blob = new Blob([scope.getUrlData()], { type: 'application/json' })
      url = URL.createObjectURL(blob)
      elm.append($compile("<a class='btn btn-primary' download='backup.json' href='#{url}'>Backup</a>")(scope))