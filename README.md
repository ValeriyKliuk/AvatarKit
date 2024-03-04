# AvatarKit

## An example of the `AvatarView` from [Building Reusable SwiftUI Components](https://www.youtube.com/watch?v=YjSxPxT5V40) by _Peter Friese_

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

## Media

![AvatarViewList](https://github.com/ValeriyKliuk/AvatarKit/assets/750868/68209b19-8079-4d85-9efe-37167c6833f1)

![AvatarViewProfile](https://github.com/ValeriyKliuk/AvatarKit/assets/750868/755a4437-4107-4657-9504-7e6999415e87)
