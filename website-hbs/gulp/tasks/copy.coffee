gulp = require 'gulp'
config = require '../config'
chalk = require 'chalk'
fs = require 'fs'
ts = require 'gulp-typescript'

tsProject = ts.createProject('tsconfig.json', {
  typescript: require('typescript')
})

gulp.task('copy', ['copy-dummydata', 'copy-fonts', 'copy-images', 'copy-nodemodule', 'compile-specs'])

gulp.task('copy-dummydata', () ->
  console.log(chalk.magenta.inverse('Copying dummy data'));
  gulp.src([config.path.src + '/dummy-data/**/*.*'])
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/dummy-data/'))
)

gulp.task('copy-images', () ->
  console.log(chalk.magenta.inverse('Copying images'));
  gulp.src([config.path.src + '/assets/images/**/*.*'])
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/images'))
)

gulp.task('copy-fonts', () ->
  console.log(chalk.magenta.inverse('Copying fonts'));
  gulp.src([config.path.src + '/font-awesome/**/**/*-webfont.*'])
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets'))
  gulp.src([config.path.src + '/assets/fonts/**/*'])
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets' + '/fonts'))
)

gulp.task('copy-nodemodule', () ->
  console.log(chalk.magenta.inverse('Copying node module'));
  gulp.src([config.path.src + '/node_modules/zone.js/dist/zone.min.js'])
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + config.path.vendors + '/vendors'))
)

gulp.task('compile-specs', ['copy-specs'], () ->
  gulp.src([config.path.src + '/spec/**/*.ts'])
    .pipe(ts(tsProject))
    .pipe(gulp.dest(config.path.dist + '/spec'));
)
gulp.task('copy-specs', () ->
  console.log(chalk.magenta.inverse('Copying specs'));

  gulp.src([config.path.src + '/spec/**/*.*', '!' + config.path.src + '/spec/**/*.ts', config.path.src + '/node_modules/jasmine-core/lib/**/*.*'])
    .pipe(gulp.dest(config.path.dist + '/spec'))
)
