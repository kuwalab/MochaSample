module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    connect:
      server:
        options:
          port: 8000
          hostname: '*'
    coffee:
      fileIcon:
        options:
          bare: true
          sourceMap: true
        files:
          'dest/jquery.fileTypeIcon.js': 'src/coffee/jquery.fileTypeIcon.coffee'
    uglify:
# TODO
# うまく調整できない。
# ビルドしてから、buid/filtTypeIcon.min.jsのソースマップのパスのbuildを消すと大丈夫
      options:
        sourceMap: true
        sourceMapName: 'dest/jquery.fileTypeIcon.min.js.map'
        sourceMapIncludeSources: true
        sourceMapIn: 'dest/jquery.fileTypeIcon.js.map'
#        sourceMapRoot: './'
#        sourceMapIn: 'dest/fileTypeIcon.js.map' # string
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' + '<%= grunt.template.today("yyyy-mm-dd") %> */'
      fileIcon:
        files: 
          'dest/jquery.fileTypeIcon.min.js': 'dest/jquery.fileTypeIcon.js'
    qunit:
      all: [
        'test/**/*Test.html'
      ]
    qunit_junit:
      options:
        dest: 'output/testresults'
    compass:
      dist:
        options:
          sassDir: 'scss'
          cssDir: 'css'
          environment: 'development'
    watch:
      scripts:
        files: ['**/*.coffee', '**/*.scss']
        tasks: ['coffee', 'uglify', 'compass']
        options:
          interrupt: true

  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-qunit')
  grunt.loadNpmTasks('grunt-qunit-junit')
  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('default', ['coffee', 'uglify', 'compass'])
