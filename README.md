# ZProgressCircle

[![CI Status](http://img.shields.io/travis/soucolline/ZProgressCircle.svg?style=flat)](https://travis-ci.org/soucolline/ZProgressCircle)
[![Version](https://img.shields.io/cocoapods/v/ZProgressCircle.svg?style=flat)](http://cocoapods.org/pods/ZProgressCircle)
[![License](https://img.shields.io/cocoapods/l/ZProgressCircle.svg?style=flat)](http://cocoapods.org/pods/ZProgressCircle)
[![Platform](https://img.shields.io/cocoapods/p/ZProgressCircle.svg?style=flat)](http://cocoapods.org/pods/ZProgressCircle)


ZProgressCircle is a simple, out of the box Swift component that represents a circle that fills up

## Installation

ZProgressCircle is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ZProgressCircle'
```

## How to use

- Drag a UIView in your storyboard
- Give the view a custom class of type ZProgressCircle <br />
![Progress circle custom class](http://progresscircle.zlat.fr/images/custom-class.png)

- The progress circle should now appear on your storyboard as follows <br />
![Default progress circle](http://progresscircle.zlat.fr/images/default-circle.png)

- You can now customise it through the @IBInspectable variables available : <br />
![@IBInscpectable variables](http://progresscircle.zlat.fr/images/custom-attributes.png)


## Customisation

The available customisations are the following :

- **Total count** : the total amount required to fill the circle
- **Completion count** : the actual amount
- **Percent complete** : a percentage of completion (same as completion count but in percentage)
- **Completion color** : the color of the circle when completed
- **Original color** : the color of the circle when at 0
- **Filling color** : the collor of the filling part of the circle

You also have access to `isCompleted` boolean attribute to check if the circle is completed or not

Availables methods :

- **increment()** : add step to the circle
- **setCompletion(to value: Int)** : set the circle to the desired value. If the value is > the total count required then the circle is set to completed

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Zlatan, guilleminot.thomas@gmail.com

## License

ZProgressCircle is available under the MIT license. See the LICENSE file for more info.

