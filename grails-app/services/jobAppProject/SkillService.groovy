package jobAppProject

import grails.gorm.services.Service
import grails.web.servlet.mvc.GrailsParameterMap

import grails.gorm.transactions.Transactional

@Transactional
class SkillService {
    Skill save(GrailsParameterMap params) {
        println "save service params = " + params
        Skill skill
        if (params.id)//edit
            skill =Skill.get(params.id)
        else //create
        {
            skill=new Skill()
        }
        skill.properties=params
        skill.validate()
        println "validate = "+skill.validate()
        skill.save()
        return skill

    }


}