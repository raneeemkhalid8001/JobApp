package jobAppProject

import lockup.JobType
import lockup.Position

class VacancyPosition {
    String place
    int number
    Date lastOfDateToApply
    String experience
    JobType typeOfJob
    Degree degree
static belongsTo = [vacancy:Vacancy,position: Position]
    static constraints = {
    }
    static mapping = {
//        table("vacancy_position")
    }
}
