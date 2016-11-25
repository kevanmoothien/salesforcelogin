angular.module('sfdclogin.controllers')
  .config ($stateProvider)->
    $stateProvider
    .state('download', {
      url: '/download',
      templateUrl: 'download.html',
      controller: 'downloadController',
    })
  .controller 'downloadController', ($scope, $rootScope, Login, localStorageService, Alert)->
    $scope.logins = []
    logins = localStorageService.get('logins')
    if logins != null
      _.each logins, (login)->
        $scope.logins.push(new Login(login))
      $scope.loginsText = JSON.stringify($scope.logins)
    $scope.data = ->
      JSON.stringify($scope.logins)
    $scope.fileContent = undefined
    $scope.import = ->
      $scope.logins = JSON.parse($scope.fileContent)
      localStorageService.set('logins', $scope.logins)
      $scope.loginsText = JSON.stringify($scope.logins)
    $scope.fileNameChanged = (ele)->
      reader = new FileReader()
      reader.onload = ->
        $scope.fileContent = reader.result
        $scope.$apply()
      reader.readAsText(ele.files[0])
    