gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
minify = require 'gulp-minify'
rename = require 'rename'
uglify = require 'gulp-uglify'
browserSync = require 'browser-sync'
ts = require 'gulp-typescript'

tsProject = ts.createProject('tsconfig.json')

gulp.task('ts', ['del'], (cb) ->
  console.log(chalk.magenta.inverse('» Compiling ts...'))
  return gulp.src([config.path.assetspath + '/js/**/*.ts'])
    .pipe(ts(tsProject))
    .pipe(gulp.dest(config.path.distpath + '/js'))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
