node("docker") {
    docker.withRegistry('https://registry.hub.docker.com/v1') {
    
        git url: "https://github.com/seanmwinn/mqtt-build", credentialsId: 'seanmwinn'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "myTest"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}
