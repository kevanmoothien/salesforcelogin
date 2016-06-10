angular.module('sfdclogin.services')
  .factory 'User',
  ($http,
    $q
  )->
    class User
      constructor: (data, me)->
        @id = data.id
        @admin = data.admin
        @username = data.username
        @email = data.email
        @score = data.score
        @me = me
    User.current_user = ->
      defer = $q.defer()
      $http.get('/api/v1/user/me').then (res)->
        user = new User(res.data.user, true)
        defer.resolve user
      defer.promise
    User.find = (id)->
      defer = $q.defer()
      $http.get("/api/v1/users/#{id}").then (res)->
        user = new User(res.data.user, false)
        defer.resolve user
      defer.promise
    User.all = ->
      defer = $q.defer()
      $http.get('/api/v1/users').then (res)->
        users = []
        _.each res.data.users, (user)->
          users.push(new User(user))
        defer.resolve users
      defer.promise
    return User