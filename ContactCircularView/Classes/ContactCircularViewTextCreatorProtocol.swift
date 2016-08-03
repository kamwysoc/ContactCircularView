import Foundation

@objc public protocol FormattedTextCreator {
    func formattedTextFromString(string: String) -> String
}
