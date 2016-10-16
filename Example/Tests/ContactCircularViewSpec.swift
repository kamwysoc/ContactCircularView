//
// Created by Kamil Wysocki on 14/10/16.
// Copyright (c) 2016 CocoaPods. All rights reserved.
//
//
import Foundation
import Quick
import Nimble

class ContactCircularViewSpec: QuickSpec {

    override func spec() {
        describe("ContactCircularView_test", {
            var sut: ContactCircularView!

            beforeEach({
                sut = ContactCircularView()
            })

            it("setting frame should trigger circular shape", closure: {
                sut.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                expect(sut.layer.cornerRadius).to(equal(15.0))
            })

            it("apply text", closure: {
                let textToTest = "Test text"
                sut.applyText(textToTest)
                expect(sut.textLabel.text) == textToTest
            })

            it("applyInitialsFromName", closure: {
                let name = "John Doe"
                sut.applyInitialsFromName(name)
                expect(sut.textLabel.text) == "JD"
            })

            it("applyInitialsFromName empty name", closure: {
                let name = ""
                sut.applyInitialsFromName(name)
                expect(sut.textLabel.text) == ""
            })

            it("applyInitialsFromName complex name", closure: {
                let name = "John Mark Doe"
                sut.applyInitialsFromName(name)
                expect(sut.textLabel.text) == "JD"
            })

            it("after applyText imageView should be hidden, and textLabel should be visible", closure: {
                sut.applyText("Text")
                expect(sut.imageView.isHidden) == true
                expect(sut.textLabel.isHidden) == false
            })

            it("after applyInitials imageView should be hidden, and textLabel should be visible", closure: {
                sut.applyInitialsFromName("John Doe")
                expect(sut.imageView.isHidden) == true
                expect(sut.textLabel.isHidden) == false
            })

            it("applyBorder and remove it", closure: {
                sut.applyBorderWithColor(UIColor.red, andWidth: 2)
                expect(sut.layer.borderWidth) == 2
                if let cgColor = sut.layer.borderColor {
                    let borderColor = UIColor(cgColor: cgColor)
                    let result = UIColor.red.isEqual(borderColor)
                    expect(result) == true
                    sut.removeBorder()
                    expect(sut.layer.borderWidth) == 0
                } else {
                    fail("borderColor is nil")
                }
            })

            it("applyTextColor", closure: {
                sut.applyTextColor(UIColor.red)
                expect(sut.textLabel.textColor) == UIColor.red
            })

        })
    }

}
