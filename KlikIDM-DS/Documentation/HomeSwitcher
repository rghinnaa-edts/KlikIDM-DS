# HomeSwitcher Component

`HomeSwitcher` is IOS UI component that provides a two-tab switcher with animations and delegate callbacks. It is designed to enhance UX by offering a smooth and visually appealing tab-switching experience.

---

## Features

- **Customizable Titles and Subtitles**: Update tab titles and subtitles dynamically.

- **Customizable Icons**: Set unique icons for each tab.

- **Smooth Animations**: Includes animations and color transitions for a polished user experience.

- **Delegate Support**: Notify listeners about tab-switch events.

## Preview
![Switcher](https://res.cloudinary.com/dr6cm6n5f/image/upload/v1737539055/ScreenRecording_01-22-202516-38-00_1-ezgif.com-video-to-gif-converter_olddu2.gif)

## Usage

### 1\. Setup in SwiftUI

Add the `HomeSwitcher` to your layout and configure it programmatically in your Activity or Fragment:

- Create state variable
``` @State private var isActive = true ```

- Use 'KlikIDMSwitcher' for use Switcher component
```SwiftUI
KlikIDMSwitcher(
  isActive: $isActive,
  action: {}
)
```

* * * * *

### 2\. Additional Attributes

You can configure titles, subtitles, and icons directly in XML using the following attributes:

| Attribute Name      | Description                 | Default Value                  |
|---------------------|-----------------------------|--------------------------------|
| `firstTitle`        | Title for the first tab     | `"Belanja Xpress"`             |
| `firstSubtitle`     | Subtitle for the first tab  | `"Estimasi Tiba hari ini"`     |
| `firstIcon`         | Icon for the first tab      | `xpress`                       |
| `secondTitle`       | Title for the second tab    | `"Belanja Xtra"`               |
| `secondSubtitle`    | Subtitle for the second tab | `"Estimasi Tiba 1-3 hari"`     |
| `secondIcon`        | Icon for the second tab     | `xtra`                         |

* * * * *

## Animation

The component includes a spring animation for smooth transitions. As for now, you cannot modify the stiffness and damping ratio in the `SpringForce` instance.
