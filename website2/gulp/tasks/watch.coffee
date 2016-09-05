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
  gutil.log('File', gutil.colors.cyan(evt.path.replace(new RegExp('/.*(?=/' + config.path.assetspath + ')/'), '')), 'was', gutil.colors.magenta(evt.type))


gulp.task('watch', ['browsersync'], () ->
  gulp.watch([config.path.assetspath + '/img/**/*']).on('change', (evt) ->
    changeEvent(evt)
    browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/**/*.jade']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('jade')
    browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/css/**/*.scss']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('sass')
    browserSync.reload()
  )

  gulp.watch([config.path.assetspath + '/js/**/*.ts']).on('change', (evt) ->
    changeEvent(evt)
    runSequence('ts')
    browserSync.reload()
  )
)
