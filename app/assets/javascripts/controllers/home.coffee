angular.module('sfdclogin.controllers')
  .config ($stateProvider)->
    $stateProvider
    .state('home', {
      url: '/',
      templateUrl: 'home.html',
      controller: 'homeController'
    })
  .controller 'homeController', ($scope,$state)->
    console.log 'homepage'
    $scope.logins = [{
      username: 'test@test.com',
      password: 'testing',
      security_token: '12345679854651567616'
      environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      },
      {
        username: 'test@test.com',
        password: 'testing',
        security_token: '12345679854651567616'
        environment: 'production'
      }
    ];