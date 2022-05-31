package lockup
class Position {
    String positionName
    String description
    String positionSkills
    String requirements
    String category
    static constraints = {

    }
    static mapping = {
        table("position")
    }
}
