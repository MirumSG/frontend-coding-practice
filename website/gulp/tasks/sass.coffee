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
    gulp.src([config.path.assetspath + '/assets/sass/brands-bootstrap.scss', config.path.assetspath + '/assets/vendors/Swiper/dist/css/swiper.min.css',
    config.path.assetspath + '/assets/vendors/intl-tel-input/build/css/intlTelInput.css', config.path.assetspath + '/assets/vendors/bootstrap-floating-labels/floating-labels.css',
    config.path.assetspath + '/assets/vendors/magnific-popup/dist/magnific-popup.css'])
      .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat('main.css'))
      .pipe(gulp.dest(config.path.distpath + config.path.csspath))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})))
    gulp.src([config.path.assetspath + '/assets/sass/brands-bootstrap.docs.scss', config.path.assetspath + '/assets/vendors/Swiper/dist/css/swiper.min.css',
    config.path.assetspath + '/assets/vendors/intl-tel-input/build/css/intlTelInput.css', config.path.assetspath + '/assets/vendors/bootstrap-floating-labels/floating-labels.css',
    config.path.assetspath + '/assets/vendors/magnific-popup/dist/magnific-popup.css'])
      .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat('main-docs.css'))
      .pipe(gulp.dest(config.path.distpath + config.path.csspath))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})))
    ]

  buildPromiseList = (lang) ->
    plist.push(gulp.src([config.path.assetspath + "/assets/sass/brands-bootstrap-#{lang}.scss", config.path.assetspath + '/assets/vendors/Swiper/dist/css/swiper.min.css',
      config.path.assetspath + '/assets/vendors/intl-tel-input/build/css/intlTelInput.css', config.path.assetspath + '/assets/vendors/bootstrap-floating-labels/floating-labels.css',
      config.path.assetspath + '/assets/vendors/magnific-popup/dist/magnific-popup.css'])
      .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat("main-#{lang}.css"))
      .pipe(gulp.dest(config.path.distpath + config.path.csspath))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));)

  buildPromiseList lang for lang in config.supportedLangs
    
  p.makePromises plist
)
