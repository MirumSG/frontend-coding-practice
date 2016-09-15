gulp = require 'gulp'
config = require '../config'
chalk = require 'chalk'
fs = require 'fs'
ts = require 'gulp-typescript'

tsProject = ts.createProject('tsconfig.json', {
  typescript: require('typescript')
})

gulp.task('copy', ['copy-fonts', 'copy-images', 'copy-nodemodule', 'compile-specs'])

gulp.task('copy-images', () ->
  console.log(chalk.magenta.inverse('Copying images'));
  gulp.src([config.path.assetspath + '/assets/images/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + '/images'))
)

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

gulp.task('compile-specs', ['copy-specs'], () ->
  gulp.src([config.path.assetspath + '/spec/**/*.ts'])
    .pipe(ts(tsProject))
    .pipe(gulp.dest(config.path.distpath + '/spec'));
)
gulp.task('copy-specs', () ->
  console.log(chalk.magenta.inverse('Copying specs'));

  gulp.src([config.path.assetspath + '/spec/**/*.*', '!' + config.path.assetspath + '/spec/**/*.ts', config.path.assetspath + '/node_modules/jasmine-core/lib/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + '/spec'))
)
