gulp = require('gulp')
concat = require('gulp-concat')
include = require('gulp-include')
coffee = require('gulp-coffee')
debug = require('gulp-debug')
ngAnnotate = require('gulp-ng-annotate')
templateCache = require('gulp-angular-templatecache')
slim = require('gulp-slim')
merge = require('gulp-merge')
modernizr = require('gulp-modernizr')

gulp.task 'default', [ 'modernizr' ]

paths =
  app: ['./app/assets/javascripts/app.coffee']
  templates: ['./app/views/angular/**/*.slim']

gulp.task 'templates', ->
  gulp
    .src(paths.templates)
    .pipe(slim())
    .pipe(templateCache(standalone: true))
    .pipe(gulp.dest('./tmp/angular/'))

gulp.task 'app', ->
  merge(
    gulp.src('./app/assets/javascripts/lib.js')
        .pipe(include())
    , gulp.src(paths.app)
          .pipe(include())
          .pipe(coffee(bare: true))
          .pipe(ngAnnotate()))
          .pipe(concat('angular-app.js'))
  .pipe(gulp.dest('./app/assets/javascripts/'))

gulp.task 'modernizr', ['app'], ->
  gulp.src('./app/assets/javascripts/angular-app.js')
    .pipe(modernizr())
    .pipe(gulp.dest('./app/assets/javascripts/'))

gulp.task 'watch', ['default'], ->
  gulp.watch ['./app/assets/javascripts/lib.js', './app/assets/javascripts/**/*.coffee']
  , ['modernizr']
