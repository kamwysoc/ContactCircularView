import XCTest
@testable import ContactCircularView

class ContactCircularViewTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ContactCircularView().text, "Hello, World!")
    }


    static var allTests : [(String, (ContactCircularViewTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
