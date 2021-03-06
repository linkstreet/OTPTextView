# OTPTextView

[![CI Status](https://img.shields.io/travis/ehsanomid/OTPTextView.svg?style=flat)](https://travis-ci.org/ehsanomid/OTPTextView)
[![Version](https://img.shields.io/cocoapods/v/OTPTextView.svg?style=flat)](https://cocoapods.org/pods/OTPTextView)
[![License](https://img.shields.io/cocoapods/l/OTPTextView.svg?style=flat)](https://cocoapods.org/pods/OTPTextView)
[![Platform](https://img.shields.io/cocoapods/p/OTPTextView.svg?style=flat)](https://cocoapods.org/pods/OTPTextView)

OTPTextView lets you manage OTP code very conveniently

## DEMO
<p align="center">
    <img src ="https://user-images.githubusercontent.com/35446003/70846345-acf18780-1e6d-11ea-928d-13992a59d968.gif" />
</p>



## Implementation
Open Wiki tap to see, you can use storyboard or implement it in your code! There is also an example project which you can see how to use OTPTextView

## Take a glance
```
onErrorBorderColor
onEnterBoarderColor
onLeaveBoarderColor
onFilledBorderColor
onSuccessBoarderColor
onAllFilledBoarderColor
onEnterBorderWidth
onLeaveBorderWidth

cursorColor
underLineIndicator
isPasswordProtected
borderColor
placeHolderColor
indicatorColor
IndicatorGapeFromTop
middleGape
forceCompletion
callOnCompleted
AutoArrange
isBorderHidden
borderSize
BorderRadius
BlocksNo
fontSize
placeHolder
getFromClipBoardAndFill
flash
flashAll
```
## Simple Implementation

```ruby
let myOTPTextView = OTPTextView(frame:CGRect(x: 10, y: 400, width: 300, height: 50)) 
view.addSubview(myOTPTextView)
print(myOTPTextView.getNumber())
```

## Installation

### SWIFT PACKAGE MANAGER :: Easy Installation ( Xcode 11 )
XCode 11 > File > Swift Packages > Add Package Dependency , copy and paste the link there and use it.
```ruby
https://github.com/ehsanomid/OTPTextView.git
```
### POD

```ruby
pod 'OTPTextView'
```

## Author

Ehsan Omid

## License

OTPTextView is available under the MIT license. See the LICENSE file for more info.
