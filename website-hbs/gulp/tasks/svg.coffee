gulp = require 'gulp'
config = require '../config'
path = require 'path'
chalk = require 'chalk'
runSequence = require 'run-sequence'
handleErrors = require '../util/handleErrors'
gulpIf = require 'gulp-if'
browserSync = require 'browser-sync'
svgstore = require 'gulp-svgstore'
svgmin = require 'gulp-svgmin'
rename = require 'gulp-rename'
xmlEdit = require 'gulp-edit-xml'

gulp.task('svg', () ->
  console.log(chalk.magenta.inverse('processing svg files'))
  #/Users/zkyaw/Downloads/icomoon_89_icons/SVG/icon-free-home-delivery.svg
  return gulp.src(['/Users/zkyaw/Desktop/icons/*.svg'])
    .pipe(xmlEdit (xml) ->
      if (xml && xml.svg && xml.svg.g && xml.svg.g.length > 0)
        # if(xml.svg.g[0].g && xml.svg.g[0].g[0] && (xml.svg.g[0].g[0].$.id == 'icon-kid' || xml.svg.g[0].g[0].$.id == 'icon-kid-white' || xml.svg.g[0].g[0].$.id == 'icon-free-home-delivery') )
        #   return xml;

        recursiveG = (g) ->
          if (g && typeof g != 'undefined' && g[0] && typeof g[0] != 'undefined' && g[0].$ && typeof g[0].$ != 'undefined') #&& g[0].$.stroke == 'none'
            g[0].$.stroke = '';
          if (g && typeof g != 'undefined' && g[0] && typeof g[0] != 'undefined' && g[0].$ && typeof g[0].$ != 'undefined') #&& g[0].$.fill == 'none'
            if(g[0].$.id == 'icon-kid' || g[0].$.id == 'icon-female' || g[0].$.id == 'icon-heart')
              g[0].$.fill = 'none';
            else if(g[0].$.id != 'icon-eye-protect-secondary' && g[0].$.id != 'icon-eye-rest-secondary' && g[0].$.id != 'icon-more-vit')
              g[0].$.fill = '';

          if (g && typeof g != 'undefined' && g[0] && typeof g[0] != 'undefined' && g[0].g && typeof g[0].g != 'undefined')
            if(typeof g[0] != 'undefined' && g[0].$ && typeof g[0].$ != 'undefined' && (g[0].$.id == 'icon-female' || g[0].$.id == 'icon-kid' || g[0].$.id == 'icon-eye-protect-secondary' || g[0].$.id == 'icon-eye-rest-secondary' || g[0].$.id == 'icon-more-vit') )
              return false;
            recursiveG(g[0].g);

        if (xml.svg.g && xml.svg.g[0])
          recursiveG(xml.svg.g);

        # if(xml.svg.g[0].$.stroke == 'none')
        #   xml.svg.g[0].$.stroke = '';
        # if(xml.svg.g[0].$.fill == 'none')
        #   xml.svg.g[0].$.fill = '';

        # if xml.svg.g[0].g[0].$.id == 'icon-green-banner'
        #   xml.svg.g[0].g[0].$.fill = '';
        # if xml.svg.g[0].g[0].$.id == 'icon-play'
        #   xml.svg.g[0].g[0].$.stroke = '';

      return xml;
    )
    .pipe(svgmin((file) ->
      prefix = path.basename(file.relative, path.extname(file.relative));
      return {
        plugins: [{
          cleanupIDs: {
            minify: true
          }
        }]
      }
    ))
    .pipe(svgstore())
    .pipe(rename((file) ->
      file.basename = 'symbol-defs'
    ))
    .on('error', handleErrors)
    .pipe(gulp.dest(config.path.src + '/assets/images/icons/')) # output directory
    .pipe(gulp.dest(config.path.dist + config.path.etc_designs + config.projName + '/assets/images/icons/')) # output directory
    .pipe(gulpIf(config.server.lrStarted, browserSync.reload({stream:true})));
)
