angular.module('sfdclogin.services')
  .factory 'Login',
  ($http,
    $q
  )->
    class Login
      constructor: (data)->
        @name = data.name
        @username = data.username
        @password = data.password
        @token = data.token
        @environment = data.environment
      payload: ->
        security_token = @password + (@token || '')
        { username: @username, security: security_token, environment: @environment }
      login: ->
        defer = $q.defer()
        $http.post('/api/v1/logins', info: @payload()).then (res)->
          console.log res
          defer.resolve res.data
        defer.promise
    Login