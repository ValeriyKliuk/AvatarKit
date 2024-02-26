# AvatarKit

## An example of the `AvatarView` from **Building Reusable SwiftUI Components** by _Peter Friese_

## Installation

Using Swift Package Manager

```
https://github.com/ValeriyKliuk/AvatarKit
```

## Example

### List

```swift
import SwiftUI
import AvatarKit

struct ContentView: View {
    var body: some View {
        List {
            AvatarView(
                title: "ABBA",
                subTitle: "Voyage",
                imageName: "ABBA-Voyage")
            .onTapAvatarView {
                // TODO: Add implementation
            }
        }
    }
}

#Preview {
    ContentView()
}
```

### Profile

```swift
import SwiftUI
import AvatarKit

struct ContentView: View {
    var body: some View {
        AvatarView(
            title: "ABBA",
            subTitle: "Voyage",
            imageName: "ABBA-Voyage")
        .avatarStyle(.profile)
    }
}

#Preview {
    ContentView()
}
```
