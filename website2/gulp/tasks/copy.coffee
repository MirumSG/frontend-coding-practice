gulp = require 'gulp'
config = require '../config'
chalk = require 'chalk'
fs = require 'fs'

gulp.task('copy', ['copy-fonts', 'copy-nodemodule', 'copy-specs'])

gulp.task('copy-fonts', () ->
  console.log(chalk.magenta.inverse('Copying fonts'));
  gulp.src([config.path.libspath + '/font-awesome/**/**/*-webfont.*'])
  .pipe(gulp.dest(config.path.distpath))
)

gulp.task('copy-nodemodule', () ->
  console.log(chalk.magenta.inverse('Copying node module'));
  gulp.src([config.path.assetspath + '/node_modules/zone.js/dist/zone.min.js'])
  .pipe(gulp.dest(config.path.distpath + '/js/vendors'))
)

gulp.task('copy-specs', () ->
  console.log(chalk.magenta.inverse('Copying specs'));
  gulp.src([config.path.assetspath + '/spec/**/*.*', config.path.assetspath + '/node_modules/jasmine-core/lib/**/*.*'])
  .pipe(gulp.dest(config.path.distpath + '/spec'))
)
