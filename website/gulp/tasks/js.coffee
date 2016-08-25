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

gulp.task('js', (cb) ->
  console.log(chalk.magenta.inverse('» Optimise JS...'))
  return gulp.src([config.path.servepath + config.path.assetspath + '/js/*.js', '!'+config.path.servepath + config.path.assetspath + '/js/*.min.js'])
    .pipe(
      minify({
        ext:{
            min:'.min.js'
        },
        ignoreFiles: ['*.min.js']
      }))
      .on('error', handleErrors)
      .pipe(gulp.dest(config.path.stagepath + config.path.assetspath + '/js')) # output directory

)
