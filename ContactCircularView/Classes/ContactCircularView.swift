//
// Created by Kamil Wysocki on 14/10/16.
// Copyright (c) 2016 CocoaPods. All rights reserved.
//


import Foundation
import UIKit

/**
    View that allows you to represent people initials (like in Contact book) also it allows you to
    put some image instead using initials.

    Main inspiration was Contact circular views in iOS Contacts
*/

@objc open class ContactCircularView: UIView {
    fileprivate(set) var textLabel: UILabel!
    fileprivate(set) var imageView: UIImageView!
    fileprivate let initialsCreator: FormattedTextCreator = InitialsCreator()
    fileprivate var customTextCreator: FormattedTextCreator?


    /**
        Initializer with coder
        calls `commonInit` after `super.init`
    */
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    init() {
        super.init(frame: CGRect.zero)
        customTextCreator = InitialsCreator()
        commonInit()
    }

    /**
        Initializer with frame
        Sets frame and call `commonInit` method.
    */
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /**
        Initializer with textCreator.
        Sets a customTextCreator from parameter.
        After that init you can call `applyFormattedTextFromString` method.
    */
    public init(textCreator: FormattedTextCreator) {
        super.init(frame: CGRect.zero)
        self.customTextCreator = textCreator
        commonInit()
    }

    fileprivate func commonInit() {
        backgroundColor = UIColor.red
        createTextLabel()
        createImageView()
        applyConstraints()
    }

    /**
        Overrides bounds didSet event to make circular shape from view
    */
    open override var bounds: CGRect {
        didSet {
            applyCircleShareWithBounds(bounds)
        }
    }

    /**
        Overrides bounds didSet event to make circular shape from view
    */
    open override var frame: CGRect {
        didSet {
            applyCircleShareWithBounds(frame)
        }
    }

    fileprivate func applyCircleShareWithBounds(_ bounds: CGRect) {
        layer.cornerRadius = bounds.width / 2
        layer.masksToBounds = true
    }

    fileprivate func createTextLabel() {
        textLabel = UILabel()
        textLabel.numberOfLines = 1
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textAlignment = .center
        addSubview(textLabel)
    }

    fileprivate func createImageView() {
        imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        addSubview(imageView)
    }

    fileprivate func applyConstraints() {
        let padding = UIEdgeInsetsMake(0, 0, 0, 0)
        let textFieldTopConstraint = NSLayoutConstraint(item: textLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: padding.top)
        let textFieldLeftConstraint = NSLayoutConstraint(item: textLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: padding.left)
        let textFieldRightConstraint = NSLayoutConstraint(item: textLabel, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: padding.right)
        let textFieldBottomConstraint = NSLayoutConstraint(item: textLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: padding.bottom)

        let imageViewTopConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: padding.top)
        let imageViewLeftConstraint = NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: padding.left)
        let imageViewRightConstraint = NSLayoutConstraint(item: imageView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: padding.right)
        let imageViewBottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: padding.bottom)

        addConstraints([textFieldTopConstraint, textFieldLeftConstraint, textFieldRightConstraint, textFieldBottomConstraint,
                        imageViewTopConstraint, imageViewLeftConstraint, imageViewRightConstraint, imageViewBottomConstraint])

    }
}

extension ContactCircularView {

    /**
        Sets an initials from name passed in parameter.
        e.q. "John Doe" -> "JD"
             "Jonh" -> "J"
             "John Mark Doe" -> "JD"
        Makes imageView hidden.
        This method use the build in initialsCreator
    */
    public func applyInitialsFromName(_ name: String?) {
        imageView.isHidden = true
        textLabel.isHidden = false
        if let unwrappedName = name {
            let initials = initialsCreator.formattedTextFromString(unwrappedName)
            textLabel.text = initials
        } else {
            textLabel.text = ""
        }
    }

    /**
        Sets formatted text from string using customTextCreator.
        ConctactCircularView must be initialized by `initWithTextCreator` before using this method
    */
    public func applyFormattedTextFromString(_ string: String?) {
        if let unwrappedTextCreator = customTextCreator {
            imageView.isHidden = true
            textLabel.isHidden = false
            if let unwrappedName = string {
                let formattedText = unwrappedTextCreator.formattedTextFromString(unwrappedName)
                textLabel.text = formattedText
            } else {
                textLabel.text = ""
            }
        } else {
            print("[ContactCircularView] custom text creator is nil")
        }
    }

    /**
        Sets a borderColor and borderWidth fromParameters
    */
    public func applyBorderWithColor(_ color: UIColor, andWidth width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }

    /**
        Sets a text from parameter.
        If text is nil it will apply empty string.
        It makes imageView hidden.
    */
    public func applyText(_ text: String?) {
        imageView.isHidden = true
        textLabel.isHidden = false
        if let unwrappedText = text {
            textLabel.text = unwrappedText
        } else {
            textLabel.text = ""
        }
    }

    /**
        Sets a textLabel font and text color from parameters
    */
    public func applyTextFont(_ font: UIFont, andColor color: UIColor) {
        textLabel.font = font
        textLabel.textColor = color
    }

    /**
        Sets a textLabel text color from parameter
    */
    public func applyTextColor(_ color: UIColor) {
        textLabel.textColor = color
    }

    /**
        Apply image from parameter.
        It makes textLabel hidden
    */
    public func applyImage(_ image: UIImage) {
        imageView.isHidden = false
        textLabel.isHidden = true
        imageView.image = image
    }

    /**
        Apply border width to 0
    */
    public func removeBorder() {
        layer.borderWidth = 0
    }

    /**
        Making an UIImage from self
        Note : method should be called after bounds/frame are set in ContactCircularView
    */
    public func toImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }

}
