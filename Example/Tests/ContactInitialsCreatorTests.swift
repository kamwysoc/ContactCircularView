import Quick
import Nimble
import ContactCircularView

class ContactInitialsCreatorTests: QuickSpec {

    override func spec() {
        super.spec()

        describe("InitialsCreator", {

            it("empty initials from empty name", closure: {
                let name = ""
                let initials = InitialsCreator.makeInitialsFromString(name)
                expect(initials).to(equal(""))
            })

            it("first letter from name without last name", closure: {
                let name = "John"
                let initials = InitialsCreator.makeInitialsFromString(name)
                expect(initials).to(equal("J"))
            })

            it("only first name with additional spaces", closure: {
                let name = " John  "
                let initials = InitialsCreator.makeInitialsFromString(name)
                expect(initials).to(equal("J"))
            })

            it("simple full name", closure: {
                let fullName = "John Doe"
                let initials = InitialsCreator.makeInitialsFromString(fullName);
                expect(initials).to(equal("JD"))
            })

            it("complex name", closure: {
                let fullName = "John Mark Doe"
                let initials = InitialsCreator.makeInitialsFromString(fullName);
                expect(initials).to(equal("JD"))
            })

            it("complex name with additional spaces", closure: {
                let fullName = "John   Mark  Doe "
                let initials = InitialsCreator.makeInitialsFromString(fullName);
                expect(initials).to(equal("JD"))
            })
        })
    }
}
