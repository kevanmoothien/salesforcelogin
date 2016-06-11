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
  'LocalStorageModule'
])
  .config ($urlRouterProvider)->
    $urlRouterProvider.otherwise('/')
  .config (cfpLoadingBarProvider)->
    cfpLoadingBarProvider.includeSpinner = true
    cfpLoadingBarProvider.parentSelector = '#loading-bar-container'
    cfpLoadingBarProvider.spinnerTemplate = '<div class="sk-three-bounce"><div class="sk-child sk-bounce1"><i class="fa fa-futbol-o fa-2x" /></div><div class="sk-child sk-bounce2"><i class="fa fa-futbol-o fa-2x" /></div><div class="sk-child sk-bounce3"><i class="fa fa-futbol-o fa-2x" /></div></div>'
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