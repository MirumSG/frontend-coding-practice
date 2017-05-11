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

tsProject = ts.createProject('tsconfig.json', {
  typescript: require('typescript')
})

gulp.task('ts', () ->
  console.log(chalk.magenta.inverse('» Compiling ts...'))
  return gulp.src([config.path.src + '/assets/ts/**/*.ts'])
    .pipe(ts(tsProject))
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/js'))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
