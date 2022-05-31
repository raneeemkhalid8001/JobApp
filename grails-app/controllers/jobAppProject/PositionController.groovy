package jobAppProject

import lockup.Position

class PositionController {
    def positionService
    def index() {
        redirect(action:'list')
    }
    def list(){
        def allPositions = Position.list()
        [allposition: allPositions]
    }
    def create(){
        Position position=new Position()
        position.properties = params

        [position: position]
    }
    def edit(){
        println params.id
        [position: Position.get(params.id)]
    }
    def save (){
        println "============================================="+params
        def result = positionService.save(params)
        println "=====result======"+result
        if(!result.hasErrors()){
            println "position no error"
            redirect(action:"show",id :result?.id)
        }
        else {
            redirect(action:"create")
            println "has errors "
        }
    }
    def show(){
        println "params from show : "+params
        Position position = Position.get(params.id)
        println "position : " + position
        def positionInfo =positionService.getInfoOfPosition(params)
        println "positionInfo  :"+positionInfo
        [position:position,positionInfo:positionInfo]
    }

    def deleteRow(){
        positionService.deleteRow(params)
        redirect(action:'list')
    }
}
