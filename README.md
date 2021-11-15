# SwiftUIDragMenu

<p>
Easily create dragabble menu <br>
The gifs are not very good quality. Content is fluid. Sorry for this :(
</p>

## How to install this package 

+ Open your project on Xcode
+ Go to Project Tab and select "Package Dependencies"
+ Click "+" and search this package with use git clone url
+ Don't change anything and click Add Package
+ The package will be attached to the targeted application

# LeftDraggableMenu

## How to use this package

```swift
import SwiftUIDragMenu

struct DemoView: View {
    var body: some View {
        LeftDraggableMenu {
                // Your main screenView
            } seconContent: {
                // Your dragmenuView
            }
    }
}
```

<img src="https://github.com/devmehmetates/SwiftUIDragMenu/blob/main/Sources/Resources/Ekran-Kayd%C4%B1-2021-11-15-17.08.22.gif">

## Variables Usage

| Variable | Type | Recommend Usage |
| -------- | ---- | --------------- |
| content | View | Use with padding |
| secondContent | View | Use with padding |

# LeftAnimatedMenu

Button configuration will be added

```swift
import SwiftUIDragMenu

struct DemoView: View {
    var body: some View {
        LeftAnimatedMenu {
                // Your main screenView
            } seconContent: {
                // Your dragmenuView
            }
    }
}
```

<img src="https://github.com/devmehmetates/SwiftUIDragMenu/blob/main/Sources/Resources/Ekran%20Kayd%C4%B1%202021-11-15%2019.41.00.gif">

## Variables Usage

| Variable | Type | Recommend Usage |
| -------- | ---- | --------------- |
| content | View | Use with padding |
| secondContent | View | Use with padding |

