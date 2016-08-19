angular.module('sfdclogin.services')
  .factory 'Login',
  ($http,
    $q,
    base64
  )->
    class Login
      constructor: (data, encode=undefined)->
        if data?
          @name = data.name
          @username = data.username
          @password = data.password
          @token = data.token
          @environment = data.environment
        if encode?
          @decode(encode)
      payload: ->
        security_token = @password + (@token || '')
        { username: @username, security: security_token, environment: @environment }
      login: ->
        defer = $q.defer()
        $http.post('/api/v1/logins', info: @payload()).then (res)->
          if res.data.status == 200
            defer.resolve res.data
          else
            defer.reject res.data
        defer.promise
      url: ->
        "https://#{location.host}/#/login?data=#{@encode()}"
      encode: ->
        payload =
          name: @name
          username: @username
          password: @password
          token: @token
          environment: @environment
        str = JSON.stringify payload
        base64.urlencode(str)
      decode: (encode)->
        data = JSON.parse base64.urldecode(encode)
        @name = data.name
        @username = data.username
        @password = data.password
        @token = data.token
        @environment = data.environment
    Login