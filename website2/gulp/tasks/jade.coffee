gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
jade = require 'gulp-jade'

gulp.task('jade', ['del'], () ->
  console.log(chalk.magenta.inverse('processing jade files'))
  return gulp.src([config.path.assetspath + '/templates/**/*.jade', config.path.assetspath + '/index.jade'])
    # .pipe(sass.sync().on('error', handleErrors))
    .pipe(jade())
    .pipe(gulp.dest(config.path.distpath))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
