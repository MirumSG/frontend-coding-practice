#-- Plugins requires

gulp = require 'gulp'
gutil = require 'gulp-util'
config = require '../config'
browserSync = require 'browser-sync'

###
 * Start browsersync task and then watch files for changes
###

changeEvent = (evt) ->
  gutil.log('File', gutil.colors.cyan(evt.path.replace(new RegExp('/.*(?=/' + config.path.assetspath + ')/'), '')), 'was', gutil.colors.magenta(evt.type))

gulp.task('watch', ['browsersync'], () ->
  gulp.watch([config.path.servepath + config.path.assetspath + '/img/**/*']).on('change', (evt) ->
    changeEvent(evt)
    browserSync.reload()
  )

  gulp.watch([config.path.servepath + config.path.assetspath + '/css/**/*.css']).on('change', (evt) ->
    changeEvent(evt)
    browserSync.reload()
  )

  gulp.watch([config.path.servepath + config.path.assetspath + '/js/**/*.js']).on('change', (evt) ->
    changeEvent(evt)
    browserSync.reload()
  )
)
