gulp = require 'gulp'
bower = require 'main-bower-files'
config = require '../config'
flatten = require 'gulp-flatten'

gulp.task('bower', ['clean'], (cb) ->
  gulp.src(bower())
  .pipe(flatten())
  .pipe(gulp.dest(config.path.distpath + config.path.jspath + '/vendors'))
)
