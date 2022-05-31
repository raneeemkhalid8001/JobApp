package jobAppProject

class Vacancy {
    Date year
    String description
    static hasMany = [vacancyPosition:VacancyPosition]
    static constraints = {
    }
}
