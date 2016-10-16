//
// Created by Kamil Wysocki on 14/10/16.
// Copyright (c) 2016 CocoaPods. All rights reserved.
//


import Foundation

/**
    Class than implement FormattedTextCreator protocol
*/

@objc open class InitialsCreator: NSObject, FormattedTextCreator {

    /**
        Method that allows you to create initials from name using `formattedTextFromString` method.

        Exaples :
        "John" -> "J"
        "John Doe" -> "JD"
        "John Mark Doe" -> "JD"
    */
    open func formattedTextFromString(_ string: String) -> String {
        var wordsArray = string.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        wordsArray = wordsArray.filter({
            (word: String) -> Bool in
            return !(word.isEmpty)
        })
        if (wordsArray.count == 1) {
            if let oneLetter = wordsArray.first?.characters.first {
                return String(oneLetter)
            }
        }
        if (wordsArray.count >= 2) {
            if let firstLetter = wordsArray.first?.characters.first, let secondLetter = wordsArray.last?.characters.first {
                return String(firstLetter) + String(secondLetter)
            }
        }
        return ""
    }
}
