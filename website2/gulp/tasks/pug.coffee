gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
pug = require 'gulp-pug'

gulp.task('pug', () ->
  console.log(chalk.magenta.inverse('processing pug files'))
  return gulp.src([config.path.assetspath + '/html/templates/*.pug', config.path.assetspath + '/index.pug'])
    # .pipe(sass.sync().on('error', handleErrors))
    .pipe(pug({
      pretty: true
    }))
    .pipe(gulp.dest(config.path.distpath))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
