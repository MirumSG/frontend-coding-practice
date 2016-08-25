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
  console.log(chalk.magenta.inverse('» Image min images ans SVG...'+config.path.destPath + config.path.assetspath + '/img/**/*'))
  return gulp.src([config.path.servepath + config.path.assetspath + '/img/**/*', '!'+config.path.servepath + config.path.assetspath + '/img/svg/symbol-defs.svg'])
    .on('error', handleErrors)
    .pipe(imagemin({
      cache: false,
      progressive: true,
      svgoPlugins: [{removeViewBox: false}],
      use: [pngquant()]
    }))
    .pipe(gulp.dest(config.path.stagepath + config.path.assetspath + '/img')) # output directory
)
