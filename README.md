# LicensePlistViewForSwiftUI

![Platform: macOS (shields.io)](https://img.shields.io/badge/platform-macOS-lightgrey)
![SwiftPM: Supported (shields.io)](https://img.shields.io/badge/SwiftPM-Supported-blue)
![license: MIT (shields.io)](https://img.shields.io/badge/license-MIT-green)

- `LicensePlistViewForSwiftUI` is a implementation of displaying LicensePlist `Settings.bundle` file on macos with SwiftUI.

<img width="600" alt="image" src="https://i.imgur.com/sixeD0U.png">

# Usage
- Create Settings.bundle. (ref: https://github.com/mono0926/LicensePlist )
- Directory structure example:

<img width="400" alt="image" src="https://i.imgur.com/GQnnXxP.png">

- Then, show `LicensePlistViewForSwiftUI`.

```swift
import SwiftUI
import LicensePlistViewForSwiftUI

@main
struct LicensePlistViewForSwiftUIDemoApp: App {
    
    @Environment(\.openWindow) private var openWindow
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .help) {
                Button("License") {
                    openWindow(id: WindowID.licensePlistWindow)
                }
            }
        }
                    
        Window("License", id: WindowID.licensePlistWindow) {
            LicensePlistView(bundle: Bundle(url: Bundle.main.url(forResource: "Settings", withExtension: "bundle")!)!)
                .frame(minWidth: 740, minHeight: 650)
        }        
    }
}

enum WindowID {
    static let licensePlistWindow = "license-plist-window"
}
```

# References
## [LicensePlistWindowController](https://github.com/cathandnya/LicensePlistWindowController)

```
Copyright (c) 2019 nya
Released under the MIT license
https://github.com/cathandnya/LicensePlistWindowController/blob/master/LICENSE
```
