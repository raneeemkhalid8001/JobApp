package jobAppProject

class SkillController {

    def skillService
    def index() {
        redirect(action:'list')
    }
    def list(){
        def allskills = Skill.list()
        [allskills: allskills]
    }
    def create(){
        Skill skill=new Skill()
        [skill: skill]
    }
    def save (){
        println "============================================="+params
        def result = skillService.save(params)
        println "=====result======"+result
        if(!result.hasErrors()){
            println "skill no error"
            redirect(action:"show",id :result?.id)
        }
        else {
            redirect(action:"create")
            println "has errors "
        }
    }
    def show(){
        Skill skill=Skill.get(params.id)
        [skill:skill]
    }
    def edit(){
        [skill: Skill.get(params.id)]
    }
}
