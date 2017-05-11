gulp = require 'gulp'
bower = require 'main-bower-files'
config = require '../config'
flatten = require 'gulp-flatten'

gulp.task('bower', ['clean'], (cb) ->
  gulp.src(bower())
  .pipe(flatten())
  .pipe(gulp.dest(config.path.dist + config.path.etc_designs  + config.projName + config.path.vendors))
)
