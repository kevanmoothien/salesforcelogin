angular.module('sfdclogin.controllers')
  .config ($stateProvider)->
    $stateProvider
    .state('home', {
      url: '/login',
      templateUrl: 'home.html',
      controller: 'homeController'
    })
  .controller 'homeController', ($scope, $rootScope, $state, Login, localStorageService, Alert)->
    $scope.credential = new Login({ environment: 'production' })
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
        new Alert('danger', error.error)
      )

    resetAlert = ->
      $rootScope.alerts.length = 0 

#    logins = [{
#      name: 'engie test',
#      username: 'kevan.moothien@spoonconsulting.com.testengie',
#      password: 'welcome2016',
#      token: 'kPFQik2KibjCF9YV3zMJ2KcL',
#      environment: 'sandbox'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      },
#      {
#        username: 'test@test.com',
#        password: 'testing',
#        token: '12345679854651567616',
#        environment: 'production'
#      }
#    ]
#
#    $scope.logins = []
#    _.each logins, (login)->
#      $scope.logins.push(new Login(login))
#
#    localStorageService.set('logins', $scope.logins)
#    $scope.unbind = localStorageService.bind($scope, 'logins')

    $scope.logins = []
    logins = localStorageService.get('logins')
    if logins != null
      _.each logins, (login)->
        $scope.logins.push(new Login(login))

    $scope.$watch 'logins', ->
      localStorageService.set('logins', $scope.logins)
    , true