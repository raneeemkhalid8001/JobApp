package jobAppProject

class ApplyController {
def applyService
    def index() {
        redirect(action:'list')
    }
    def list(){
        def allApplicants = Apply.list()
        [allApplicants: allApplicants,positions:applyService.getPosition(params)]
    }
    def create(){
        println "from apply create "+ params
        Apply apply=new Apply()
        [apply: apply,contactType:applyService.getContactType(params),certificateType:applyService.getCertificateType(params),gender:applyService.getGender(params),skills:applyService.getSkills(params),vacancyPositionId:params.vacancyPositionId]
    }
    def save (){
        println "============================================="+params
        def result = applyService.save(params)
        println "=====result======"+result
        if(!result.hasErrors()){
            println "Apply no error"
            redirect(action:"show",id :result?.id)
        }
        else {
            redirect(action:"create")
            println "has errors "
        }
    }
    def show(){
        Apply applyInstance= Apply.get(params.id)

        [apply: applyInstance,gender:applyService.getGender(params)]
    }

}
