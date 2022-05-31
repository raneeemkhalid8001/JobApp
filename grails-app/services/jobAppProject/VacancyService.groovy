package jobAppProject


import grails.web.servlet.mvc.GrailsParameterMap

import grails.gorm.transactions.Transactional
import groovy.sql.Sql
import lockup.CertificateType
import lockup.JobType
import lockup.Position
import org.grails.datastore.mapping.query.Query

import java.text.SimpleDateFormat

@Transactional
class VacancyService {
   def dataSource
   def getPosition(GrailsParameterMap params){
   return Position.list()
   }
   def getPositions(GrailsParameterMap parameterMap){
      Sql sql = new Sql(dataSource)
//      String query= "select p.id, p.position_name  from position p inner join vacancy_position vp on p.id = vp.position_id " +
//              "where vacancy_id = ${parameterMap?.id}"
//      String query= "select p.id , p.local_name , vp.position_id ,pos.position_name from person p inner join apply a on p.id = a.person_id "+
//              " inner join vacancy_position vp on vp.id = a.vacancy_position_id inner join position pos on vp.position_id = pos.id  "+
//              " where  vp.vacancy_id=${parameterMap?.id} "

    String query=" select count(p.id) as applicants,\n" +
            "       vp.position_id ,pos.position_name from position pos\n" +
            " left outer join vacancy_position vp on pos.id = vp.position_id\n" +
            " left outer join apply a on vp.id = a.vacancy_position_id\n" +
            " left outer join person p on a.person_id = p.id\n" +
            " where  vp.vacancy_id=${parameterMap?.id} group by position_name,vp.position_id"
      println(query)
      def data = sql.rows(query)
//      println "data : " + data
      return data
   }
   def getApplicants(GrailsParameterMap parameterMap){
      Sql sql = new Sql(dataSource)
      String query= "select p.id , p.local_name , vp.position_id ,pos.position_name from person p inner join apply a on p.id = a.person_id "+
      " inner join vacancy_position vp on vp.id = a.vacancy_position_id inner join position pos on vp.position_id = pos.id  "+
      " where vp.position_id=${parameterMap?.id} and vp.vacancy_id=${parameterMap?.vacancyId} "
      println(query)
      def data = sql.rows(query)
      println("data : " + data)
      return data
   }
   def getJobType(GrailsParameterMap params){
      return JobType.list()
   }
   def getDegree(GrailsParameterMap params){
      return Degree.values()
   }
   Vacancy save(GrailsParameterMap params) {
      println "save service params = " + params
      Vacancy vacancy
      if (params.id) {//edit
         vacancy = Vacancy.get(params.id)
      }
      else //create
      {
         vacancy=new Vacancy()

      }
      vacancy.properties=params

      if(vacancy?.vacancyPosition){
         vacancy?.vacancyPosition*.delete()
         vacancy?.vacancyPosition?.clear()
      }
      VacancyPosition vacancyPosition
      println params.list("valueOptionData")
      if(params.list("valueOptionData")){
         (params.list("valueOptionData")).each { it->
            vacancyPosition = new VacancyPosition()
            println "it " + it
            def text = it?.toString().split("_")[0]
            def number = Integer.parseInt(it?.toString().split("_")[1]?:"0")
            def place = it?.toString().split("_")[2]
//            println  " >>>>>>>>>>>> ${it?.toString().split("_")[3]}"
            def pattern = "yyyy-MM-dd"
            def lastOfDateToApply =new SimpleDateFormat(pattern).parse("${it?.toString().split("_")[3]}")
            println "********************* "+lastOfDateToApply
            def experience = it?.toString().split("_")[4]
            def typeOfJob = it?.toString().split("_")[5]
            def degree = it?.toString().split("_")[6]
            vacancyPosition.position=Position.findById(Long.parseLong(text))
            vacancyPosition.place = place
            vacancyPosition.number = number
            vacancyPosition.lastOfDateToApply =lastOfDateToApply
            vacancyPosition.experience = experience
            vacancyPosition.typeOfJob = JobType.findById(Long.parseLong(typeOfJob))
            vacancyPosition.degree = Degree.valueOf(degree)
//            vacancyPosition.save(failOnError:true,flush:true)
            vacancy.addToVacancyPosition(vacancyPosition)
         }
      }
      println "=============================vacancyPosition===================="+vacancy.vacancyPosition


      vacancy.validate()
      println "validate = "+vacancy.validate()
      vacancy.errors.each {
         println "error "+it
      }
      vacancy.save()
      return vacancy
   }

}