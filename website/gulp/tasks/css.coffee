gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'

gulp.task('css', () ->
  console.log(chalk.magenta.inverse('» Image min images ans SVG...'))
  return gulp.src([config.path.assetspath + '/css/**/*.css'])
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.assetspath + '/css')) //output directory
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
