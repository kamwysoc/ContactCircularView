//
// Created by Kamil Wysocki on 14/10/16.
// Copyright (c) 2016 CocoaPods. All rights reserved.
//

import Foundation

public protocol FormattedTextCreator {
    func formattedTextFromString(string: String) -> String
}
