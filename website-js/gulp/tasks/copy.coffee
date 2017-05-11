gulp = require 'gulp'
config = require '../config'
chalk = require 'chalk'
fs = require 'fs'
ts = require 'gulp-typescript'

tsProject = ts.createProject('tsconfig.json', {
  typescript: require('typescript')
})

gulp.task('copy', ['copy-dummydata', 'copy-fonts', 'copy-images', 'copy-js', 'copy-nodemodule', 'compile-specs'])

gulp.task('copy-js', () ->
  console.log(chalk.magenta.inverse('Copying js'));
  gulp.src([config.path.assetspath + '/assets/js/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + config.path.jspath))
)

gulp.task('copy-dummydata', () ->
  console.log(chalk.magenta.inverse('Copying dummy data'));
  gulp.src([config.path.assetspath + '/dummy-data/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + '/dummy-data/'))
)

gulp.task('copy-images', () ->
  console.log(chalk.magenta.inverse('Copying images'));
  gulp.src([config.path.assetspath + '/assets/images/**/*.*'])
    .pipe(gulp.dest(config.path.distpath + config.path.copypath + 'images'))
)

gulp.task('copy-fonts', () ->
  console.log(chalk.magenta.inverse('Copying fonts'));
  gulp.src([config.path.libspath + '/font-awesome/**/**/*-webfont.*'])
    .pipe(gulp.dest(config.path.distpath + config.path.copypath))
  gulp.src([config.path.assetspath + '/assets/fonts/**/*'])
    .pipe(gulp.dest(config.path.distpath + config.path.copypath + 'fonts'))
)

gulp.task('copy-nodemodule', () ->
  console.log(chalk.magenta.inverse('Copying node module'));
  gulp.src([config.path.assetspath + '/node_modules/zone.js/dist/zone.min.js'])
    .pipe(gulp.dest(config.path.distpath + config.path.jspath + '/vendors'))
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
