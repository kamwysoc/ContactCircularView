# ContactCircularView


<!-- [![CI Status](http://img.shields.io/travis/Kamil Wysocki/ContactCircularView.svg?style=flat)](https://travis-ci.org/Kamil Wysocki/ContactCircularView) -->
[![Version](https://img.shields.io/cocoapods/v/ContactCircularView.svg?style=flat)](http://cocoapods.org/pods/ContactCircularView)
[![License](https://img.shields.io/cocoapods/l/ContactCircularView.svg?style=flat)](http://cocoapods.org/pods/ContactCircularView)
[![Platform](https://img.shields.io/cocoapods/p/ContactCircularView.svg?style=flat)](http://cocoapods.org/pods/ContactCircularView)
[![Build](https://travis-ci.org/k8mil/ContactCircularView.svg?branch=master)](https://travis-ci.org/k8mil/ContactCircularView.svg?branch=master)


##Why to use

If you want to add some custom ContactsBook screen or you just need come circular view with some text or image inside, this pod is suitable for your app. 

##Demo

***Example app***

<img src="https://github.com/k8mil/ContactCircularView/blob/master/ContactCircularViewAnimation.gif" width="370" height="693">

***Contact screen***

![](https://github.com/k8mil/ContactCircularView/blob/master/contact_screen.gif)

## Examples

To run the example project, clone the repo, and run `pod install` from the Example directory first.

***Create, apply initials from name, set font and border***

![](https://github.com/k8mil/ContactCircularView/blob/master/example_circle.png)

```swift
let contactInitialsView = ContactCircularView()
contactInitialsView.backgroundColor = UIColor.redColor()
contactInitialsView.applyBorderWithColor(.greenColor(), andWidth: 1.0)
contactInitialsView.applyTextFont(.italicSystemFontOfSize(12), andColor: .greenColor())
contactInitialsView.applyInitialsFromName("John Doe")
```

***Create, apply image***

![](https://github.com/k8mil/ContactCircularView/blob/master/image_circle.png)

```swift
let contactInitialsView = ContactCircularView()
contactInitialsView.applyImage(UIImage(imageLiteral: "some_cool_image"))
```

***Create your custom TextFormatter, and initialize ContactCircularView with it***

![](https://github.com/k8mil/ContactCircularView/blob/master/one_letter_circle.png)


```swift
class FirstLetterFormatter: FormattedTextCreator {

    func formattedTextFromString(string: String) -> String {
        guard let firstLetter = string.characters.first else {
            return ""
        }
        return String(firstLetter)
    }

}
```

```swift
let contactInitialsView = ContactCircularView(textCreator: FirstLetterFormatter())
contactInitialsView.backgroundColor = UIColor.redColor()
contactInitialsView.applyTextColor(UIColor.whiteColor())
contactInitialsView.applyFormattedTextFromString("John Doe")

```

***Create an circularView and make the UIImage from it***
```swift
let contactInitialsView = ContactCircularView(textCreator: FirstLetterFormatter())
contactInitialsView.frame = CGRectMake(0,0,30,30)
contactInitialsView.backgroundColor = UIColor.redColor()
contactInitialsView.applyTextColor(UIColor.whiteColor())
contactInitialsView.applyFormattedTextFromString("John Doe")

let image = contactInitialsView.toImage()
```

## Requirements

version 1.1.0+ Swift 3.0, Xcode 8

version 1.0.2 Swift 2.2, Xcode 7

## Installation

ContactCircularView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ContactCircularView"
```

## Author

[k8mil](https://www.wysockikamil.com)
[twitterr](https://twitter.com/_k8mil)

## License

ContactCircularView is available under the MIT license. See the LICENSE file for more info.
