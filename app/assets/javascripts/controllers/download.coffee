angular.module('sfdclogin.controllers')
  .config ($stateProvider)->
    $stateProvider
    .state('download', {
      url: '/download',
      templateUrl: 'download.html',
      controller: 'downloadController',
    })
  .controller 'downloadController', ($scope, $rootScope, Login, localStorageService, Alert)->
    console.log 'test download'
    $scope.logins = []
    logins = localStorageService.get('logins')
    if logins != null
      _.each logins, (login)->
        $scope.logins.push(new Login(login))
    $scope.data = ->
      JSON.stringify($scope.logins)
    