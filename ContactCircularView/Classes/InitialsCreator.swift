//
// Created by Kamil Wysocki on 26/06/16.
// Copyright (c) 2016 k8mil. All rights reserved.
//

import Foundation

public class InitialsCreator {

    public class func makeInitialsFromString(string: String) -> String {
        var wordsArray = string.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
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