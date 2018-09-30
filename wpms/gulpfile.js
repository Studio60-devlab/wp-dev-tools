// studio60 - devlab
'use strict';

var gulp = require('gulp');
var browserSync = require('browser-sync').create();
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');
var csso = require('gulp-csso');
var concat = require('gulp-concat');

gulp.task('browser-sync', function() {
    browserSync.init({
        proxy: 'localhost/'+__dirname.split('/').pop()+'/app',
        notify: false
    });

    gulp.watch('./src/sass/**/*.scss', ['css-watch']);
    gulp.watch('./src/js/**/*.js', ['js-watch']);
});

gulp.task('css', function () {
    return gulp.src('./src/sass/**/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(autoprefixer())
        .pipe(csso())
        .pipe(gulp.dest('./app'));
});

gulp.task('css-watch', ['css'], function (done) {
    browserSync.reload();
    done();
});

gulp.task('js', function() {
    return gulp.src([
        './src/js/vendor/magnific-popup.min.js',
        './src/js/vendor/slick.min.js',
        './src/js/vendor/masonry.min.js',
        './src/js/vendor/blazy.min.js',
        './src/js/vendor/scrollreveal.min.js',
        './src/js/menu.js',
        './src/js/main.js'
    ])
    .pipe(concat('main.js'))
    .pipe(gulp.dest('./app'));
});

gulp.task('js-watch', ['js'], function (done) {
    browserSync.reload();
    done();
});
