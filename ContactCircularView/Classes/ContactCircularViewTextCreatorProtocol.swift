//
// Created by Kamil Wysocki on 14/10/16.
// Copyright (c) 2016 CocoaPods. All rights reserved.
//

import Foundation

/**
	Protocol that you have to implement you want to create customTextFormatter and use it in ContactCircularView

*/

public protocol FormattedTextCreator {

	/**
		Implement this method to create formatted string in your class than responds to
		FormattedTextCreator protocol
	*/
    func formattedTextFromString(_ string: String) -> String
}
