#-- Plugins requires

gulp = require 'gulp'
gutil = require 'gulp-util'
config = require '../config'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'

###
 * Start browsersync task and then watch files for changes
###

changeEvent = (evt) ->
  gutil.log('File', gutil.colors.cyan(evt.path.replace(new RegExp('/.*(?=/' + config.path.src + ')/'), '')), 'was', gutil.colors.magenta(evt.type))


gulp.task('watch', ['browsersync'], () ->
  gulp.watch([config.path.src + '/assets/img/**/*']).on('change', (evt) ->
    changeEvent(evt)
    # browserSync.reload()
  )

  gulp.watch([config.path.src + '/html/**/*.pug']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('pug')
    # browserSync.reload()
  )

  gulp.watch([config.path.src + '/assets/sass/**/*.scss', config.path.src + '/assets/sass/**/*.sass']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('sass')
    # browserSync.reload()
  )

  gulp.watch([config.path.src + '/assets/ts/**/*.ts']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('ts')
    # browserSync.reload()
  )

  gulp.watch([config.path.src + '/spec/**/*.ts']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('compile-specs')
    # browserSync.reload()
  )

  gulp.watch([config.path.src + '/spec/unit/**/*.*']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('copy-specs')
    # browserSync.reload()
  )
)
