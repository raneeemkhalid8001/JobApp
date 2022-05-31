package jobAppProject

import grails.converters.JSON

class VacancyController {
    def vacancyService

    def index() {
        redirect(action:'list')
    }
    def list(){
        def allvacancy = Vacancy.list()
        [allvacancy: allvacancy]
    }
    def showApplicant(){
        println params
        Vacancy vacancyInstance= Vacancy.get(params.id)
        def positionsVacancy =vacancyService.getPositions(params)
        [vacancy: vacancyInstance,positionsVacancy:positionsVacancy]
    }
    def getApplicant(){
//        print("from getApplicant:"+params)
        def applicant=vacancyService.getApplicants(params)
        render applicant as JSON
    }
    def create() {
        Vacancy vacancy = new Vacancy()
        [vacancy: vacancy, position: vacancyService.getPosition(params), jobType: vacancyService.getJobType(params), degree: vacancyService.getDegree(params)]
    }

    def show(){
        Vacancy vacancyInstance= Vacancy.get(params.id)
        [vacancy: vacancyInstance]
    }

    def save() {
        println "=============================================" + params
        def result = vacancyService.save(params)
        println "=====result======" + result
        if (!result.hasErrors()) {
            println "vacancy no error"
            flash.message = "suuceeesssss"
        }
        redirect(action: "create")
    }
}