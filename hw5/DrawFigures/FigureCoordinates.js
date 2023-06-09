function getCoordinates(figure) {
    if (figure=="Hourglass"){
        return [[2,1],[4,1],[2,5],[4,5],[2,1]]
    } else if (figure=="Star"){
        return [[3,1],[4.3,5],[0.9,2.53],[5.1,2.53],[1.7,5],[3,1]]
    } else if (figure=="House"){
        return [[3,2],[4,3],[4,5],[2,5],[2,3],[4,3],[3,2],[2,3]]
    } else if (figure=="Circle"){
        return [[3,3],1]
    } else{
        throw "Non-existing figure"
    }
}
