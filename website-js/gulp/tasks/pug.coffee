gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
pug = require 'gulp-pug'
dummyData = require '../../dummy-data/data.json'

gulp.task('pug', ['pug-partials'], () ->
  console.log(chalk.magenta.inverse('processing pug files'))
  return gulp.src([config.path.assetspath + '/html/templates/*.pug', config.path.assetspath + '/index.pug'])
    .pipe(pug({
      pretty: true,
      data: dummyData,
      locals: dummyData
    }))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.distpath))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)

gulp.task('pug-partials', () ->
  console.log(chalk.magenta.inverse('compiling pug partial files'))
  return gulp.src([config.path.assetspath + '/html/components/*-partial.pug', config.path.assetspath + '/html/molecules/*-partial.pug'])
    .pipe(pug({
      debug: false,
      client: true,
      inlineRuntimeFunctions: true,
      pretty: true,
      #name: 'templateTest',
      data: {
        partial: true,
        analytics: dummyData.analytics
      }
    }))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.distpath + config.path.jspath + '/partials'))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
