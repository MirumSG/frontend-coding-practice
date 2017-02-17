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

gulp.task('sass', () ->
  console.log(chalk.magenta.inverse('processing sass files'))
  processors = [
    autoprefixer({browsers: ['last 1 version']}),
    gradientfixer
  ];

  return gulp.src([config.path.assetspath + '/assets/sass/brands-bootstrap.scss', config.path.assetspath + '/assets/vendors/Swiper/dist/css/swiper.min.css'])
      .pipe(sass.sync({ includePaths: [config.path.libspath + '/bootstrap-sass/assets/stylesheets'] }).on('error', handleErrors))
      .pipe(postcss(processors))
      .pipe(concat('all.css'))
      .pipe(gulp.dest(config.path.distpath + '/css'))
      .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
