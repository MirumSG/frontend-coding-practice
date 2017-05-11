gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
sass = require 'gulp-sass'
concat = require 'gulp-concat'
autoprefixer = require 'autoprefixer'
postcss = require 'gulp-postcss'
gradientfixer = require 'postcss-gradientfixer'
promise = require 'gulp-promise'

gulp.task('sass', () ->
  console.log(chalk.magenta.inverse('processing sass files'))
  processors = [
    autoprefixer({browsers: ['last 1 version']}),
    gradientfixer
  ];

  p = new promise()

  plist = [
    gulp.src([config.path.src + '/assets/sass/project-bootstrap.scss'])
      .pipe(sass.sync({ includePaths: [config.path.vendors + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat('all.css'))
      .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/css'))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})))
    gulp.src([config.path.src + '/assets/sass/project-bootstrap.docs.scss'])
      .pipe(sass.sync({ includePaths: [config.path.libspath + '/project-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat('all-docs.css'))
      .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/css'))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})))
    ]

  p.makePromises plist
)
