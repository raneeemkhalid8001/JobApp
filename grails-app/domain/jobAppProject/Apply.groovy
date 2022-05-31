package jobAppProject

class Apply {
    Date applicationDate
    Gender gender
    Attachment attachment
    static hasMany = [contacts:Contact, certificates:Certificate, skillJobApp:SkillJobApp,qualification:Qualifications]
    static belongsTo = [vacancyPosition:VacancyPosition, person:Person]
    static constraints = {
    }
}
