// Studio60 - GULPFILE.js - hugo ssg
var gulp         = require("gulp"),
    sass         = require("gulp-sass"),
    autoprefixer = require("gulp-autoprefixer"),
    del          = require("del"),
    runSequence  = require('run-sequence'),
    cp           = require('child_process'),
    rimraf       = require('rimraf');

// Compilation du SCSS en CSS
gulp.task("scss", function () {
    //effacement des vieux fichiers css eventuels
    del.sync(["static/css/**/*"]);
    gulp.src("src/sass/**/*.scss")
        .pipe(sass({outputStyle : "compressed"}))
        .pipe(autoprefixer({browsers : ["last 20 versions"]}))
        .pipe(gulp.dest("static/css"))
        //Put the map in the data directory
        .pipe(gulp.dest("data/css"));
});

// Hash images compilation
gulp.task("images", function () {
    del(["static/images/**/*"])
    gulp.src("src/images/**/*")
        .pipe(gulp.dest("static/images"))
        .pipe(gulp.dest("data/images"));
});

// Hash javascript compilation
gulp.task("js", function () {
    del(["static/js/**/*"])
    gulp.src("src/js/**/*")
        .pipe(gulp.dest("static/js"))
        .pipe(gulp.dest("data/js"));
});

// Watch src folder for changes
gulp.task("watch", ["scss", "images", "js"], function () {
    gulp.watch("src/sass/**/*", ["scss"]);
    gulp.watch("src/images/**/*", ["images"]);
    gulp.watch("src/js/**/*", ["js"]);
});

gulp.task("build", () => {
    del.sync("public");
    runSequence(["scss", "images", "js"]);
});
