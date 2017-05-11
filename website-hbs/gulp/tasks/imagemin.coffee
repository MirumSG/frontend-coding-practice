gulp = require 'gulp'
config = require '../config'
imagemin = require 'gulp-imagemin'
pngquant = require 'imagemin-pngquant'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
browserSync = require('browser-sync').create()

gulp.task('imgOptimise', () ->
  console.log(chalk.magenta.inverse('» Start optimising images and SVG...'))
  runSequence 'imagemin'
)

gulp.task('imagemin', () ->

  console.log(chalk.magenta.inverse('» Image min images ans SVG...' + config.path.assetspath + 'images/**/*'))
  return gulp.src([config.path.dist + config.path.etc_designs + config.projName + '/assets/images/**/*.*', '!'+ config.path.dist + config.path.etc_designs + config.projName + '/assets/images/**/*.svg'])
    .on('error', handleErrors)
    .pipe(imagemin({
      cache: false,
      progressive: true,
      svgoPlugins: [{removeViewBox: false}],
      use: [pngquant()]
    }))
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/images/')) # output directory
)
