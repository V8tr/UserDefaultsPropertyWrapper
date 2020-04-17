## Article related to this project

- [The Advanced Guide to UserDefaults in Swift](https://www.vadimbulavin.com/advanced-guide-to-userdefaults-in-swift/).

---

# UserDefaultsPropertyWrapper

A sample project showing how to implement a `UserDefaults` property wrapper in Swift. The property wrapper has statically typed keyes and provides a conveniece to observe `UserDefaults` changes.

Usage:

```swift
// Create a new key
extension Key {
    static let isFirstLaunch: Key = "isFirstLaunch"
}

// Adapter on top of `UserDefaults`
struct Storage {
    // Use the property wrapper to add new value to `UserDefaults`
    @UserDefault(key: .isFirstLaunch)
    var isFirstLaunch: Bool?
}

var storage = Storage()

// Observe property changes
var observation = storage.$isFirstLaunch.observe { old, new in
    print("Changed from: \(old) to \(new)")
}

storage.isFirstLaunch = true
storage.isFirstLaunch?.toggle()
````

It will print:

```
Changed from: Optional(false) to Optional(true)
Changed from: Optional(true) to Optional(false)
```
