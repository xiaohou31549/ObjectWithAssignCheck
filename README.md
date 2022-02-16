# ObjectWithAssignCheck

[![CI Status](https://img.shields.io/travis/8047768/ObjectWithAssignCheck.svg?style=flat)](https://travis-ci.org/8047768/ObjectWithAssignCheck)
[![Version](https://img.shields.io/cocoapods/v/ObjectWithAssignCheck.svg?style=flat)](https://cocoapods.org/pods/ObjectWithAssignCheck)
[![License](https://img.shields.io/cocoapods/l/ObjectWithAssignCheck.svg?style=flat)](https://cocoapods.org/pods/ObjectWithAssignCheck)
[![Platform](https://img.shields.io/cocoapods/p/ObjectWithAssignCheck.svg?style=flat)](https://cocoapods.org/pods/ObjectWithAssignCheck)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

```ruby
pod 'ObjectWithAssignCheck', :configurations => ['Debug']
```

## Usage

建议只在Debug下开启该功能，同时在函数调用参数里需要传入项目类前缀，保证只检查该前缀的类，支持数组传入，如不传，其他第三方或者系统类使用了assign来修饰对象，也会走断言。

```oc
#ifdef DEBUG
    [ObjectWithAssignCheck checkWithClassPrefixes:@[@"BL", @"BC"]];
#endif
```

## Author

tough913@gmail.com

## License

ObjectWithAssignCheck is available under the MIT license. See the LICENSE file for more info.
