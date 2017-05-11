gulp = require 'gulp'
config = require '../config'
del = require 'del'
chalk = require 'chalk'
runSequence = require 'run-sequence'
fs = require 'fs'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'
cleanCss = require 'gulp-clean-css'

gulp.task('minify', ['minify-js', 'minify-css'], (cb) ->
  console.log(chalk.magenta.inverse('» Uglifying...'))
  if cb then cb()
)

gulp.task('minify-js', (cb) ->
  console.log(chalk.magenta.inverse('» Uglifying JS...'))
  return gulp.src([config.path.dist + config.path.etc_designs + '/**/js/**/*.js', '!' + config.path.dist + config.path.etc_designs + '/**/js/**/*.min.js'])
    .pipe(uglify())
    .pipe(rename (path) -> path.extname = '.min.js')
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName))
)

gulp.task('minify-css', (cb) ->
  console.log(chalk.magenta.inverse('» Uglifying CSSS...'))
  return gulp.src([config.path.dist + config.path.etc_designs + '/**/css/**/*.css', '!' + config.path.dist + config.path.etc_designs + '/**/css/**/*.min.css'])
    .pipe(cleanCss({
      processImport: false
      }))
    .pipe(rename (path) -> path.extname = '.min.css')
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName))
)

gulp.task('build', ['clean'], (cb) ->
  console.log(chalk.magenta.inverse('» Building...'))
  runSequence(['bower', 'copy', 'imagemin', 'pug', 'sass', 'ts'], 'minify', cb)
)
