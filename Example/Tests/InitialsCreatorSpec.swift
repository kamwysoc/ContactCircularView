// https://github.com/Quick/Quick

import Quick
import Nimble
import ContactCircularView

class InitialsCreatorSpec: QuickSpec {
    override func spec() {
        super.spec()

        describe("InitialsCreator", {
            let initialsCreator = InitialsCreator()
            it("empty initials from empty name", closure: {
                let name = ""
                let initials = initialsCreator.formattedTextFromString(name)
                expect(initials).to(equal(""))
            })

            it("first letter from name without last name", closure: {
                let name = "John"
                let initials = initialsCreator.formattedTextFromString(name)
                expect(initials).to(equal("J"))
            })

            it("only first name with additional spaces", closure: {
                let name = " John  "
                let initials = initialsCreator.formattedTextFromString(name)
                expect(initials).to(equal("J"))
            })

            it("simple full name", closure: {
                let fullName = "John Doe"
                let initials = initialsCreator.formattedTextFromString(fullName);
                expect(initials).to(equal("JD"))
            })

            it("complex name", closure: {
                let fullName = "John Mark Doe"
                let initials = initialsCreator.formattedTextFromString(fullName);
                expect(initials).to(equal("JD"))
            })

            it("complex name with additional spaces", closure: {
                let fullName = "John   Mark  Doe "
                let initials = initialsCreator.formattedTextFromString(fullName);
                expect(initials).to(equal("JD"))
            })
        })
    }
}
