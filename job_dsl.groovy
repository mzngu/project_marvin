job("First job") {
    steps {
        shell('pwd')
    }
}
 
job("Disk Space Check") {
    steps {
        shell('df')
    }
}
 
job("Daily Dose of Satisfaction") {
    parameters {
        stringParam('NAME', null, null)
    }
    steps {
        shell('echo, "Hello dear $NAME!"')
        shell('date')
        shell('echo, "Hello this is your DDos number $BUILD_NUMBER."')
    }
}