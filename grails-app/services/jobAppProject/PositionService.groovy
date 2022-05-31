package jobAppProject


import grails.web.servlet.mvc.GrailsParameterMap
import groovy.sql.Sql
import lockup.Position
import grails.gorm.transactions.Transactional
@Transactional
class PositionService {
    def dataSource
    def getInfoOfPosition(GrailsParameterMap parameterMap){
        Sql sql = new Sql(dataSource)
        String query= "select last_of_date_to_apply,degree,type_of_job_id,place,experience from vacancy_position " +
                "where position_id = ${parameterMap?.id} and id = ${parameterMap.vacancyPositionId}"
        def data = sql.rows(query)
        return data
    }
    Position save(GrailsParameterMap params) {
        println "save service params = " + params
        Position position
        if (params.id)//edit
            position =Position.get(params.id)
        else //create
        {
            position=new Position()
        }
        position.properties= params
        position.validate()
        println "validate = "+position.validate()
        position.save()
        return position
    }
    def deleteRow(GrailsParameterMap params) {
        Position p = Position.get(params.id)
        p.delete()

    }

}