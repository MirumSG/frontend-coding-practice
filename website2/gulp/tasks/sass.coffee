gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
sass = require 'gulp-sass'
concat = require 'gulp-concat'

gulp.task('sass', () ->
  console.log(chalk.magenta.inverse('processing sass files'))
  return gulp.src([config.path.assetspath + '/assets/sass/**/*.scss'])
    .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
    .pipe(concat('all.css'))
    .pipe(gulp.dest(config.path.distpath + '/css'))
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
