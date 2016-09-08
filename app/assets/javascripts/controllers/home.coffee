angular.module('sfdclogin.controllers')
  .config ($stateProvider)->
    $stateProvider
    .state('home', {
      url: '/login?data',
      templateUrl: 'home.html',
      controller: 'homeController',
      resolve:
        Login: 'Login'
        login: ($stateParams, Login)->
          new Login(undefined, $stateParams.data)
    })
  .controller 'homeController', ($scope, $rootScope, $state, Login, login, localStorageService, Alert)->
    $scope.credential = login
    $scope.set_credential = (login_value)->
      resetAlert()
      $scope.output = {}
      $scope.credential = angular.copy login_value
      login(login_value)
    $scope.login = ->
      resetAlert()
      login($scope.credential)
    $scope.save = ->
      resetAlert()
      $scope.output = {}
      $scope.logins.push(angular.copy($scope.credential))
    $scope.delete = (item)->
      if(!confirm('Are you sure?'))
        return
      resetAlert()
      $scope.output = {}
      index = $scope.logins.indexOf(item)
      $scope.logins.splice(index, 1)
    login = (log)->
      resetAlert()
      log.login().then( (res)->
        $scope.output = res
      , (error)->
        $scope.output = error
        new Alert('danger', error.error, 5000)
      )

    resetAlert = ->
      $rootScope.alerts.length = 0
    
    $scope.copied = (e)->
      new Alert('info', 'Copied to clipboard', 2000)

    $scope.resetField = ->
      $scope.credential = {}

    $scope.logins = []
    logins = localStorageService.get('logins')
    if logins != null
      _.each logins, (login)->
        $scope.logins.push(new Login(login))

    $scope.$watch 'logins', ->
      localStorageService.set('logins', $scope.logins)
    , true