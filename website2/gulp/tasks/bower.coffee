gulp = require 'gulp'
bower = require 'main-bower-files'
config = require '../config'
flatten = require 'gulp-flatten'

gulp.task('bower', ['del'], (cb) ->
  gulp.src(bower())
  .pipe(flatten())
  .pipe(gulp.dest(config.path.distpath + '/js/vendors'))
)
