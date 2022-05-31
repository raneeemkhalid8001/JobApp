package jobAppProject
class Contact {
    Long phone
    String email
    static belongsTo = [apply: Apply]
    ContactType type
    static constraints = {
        email email: true
        apply nullable: true
    }
}
