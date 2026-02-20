# AnimButton

A highly customizable animated button for Flutter that provides elegant visual feedback with smooth scaling animations.

[![Pub Version](https://img.shields.io/pub/v/animbutton)](https://pub.dev/packages/animbutton)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<p align="center">
  <video src="assets/demo.webm" width="100%" loop muted autoplay></video>
</p>

## ✨ Features

- 🚀 **Smooth Scaling Animation**: Provides tactile feedback on tap.
- 🎨 **Highly Customizable**: Control everything From colors to gradients.
- 📦 **Flexible Content**: Use a simple text label or any custom widget as a child.
- 🛠️ **Developer Friendly**: Clean code, well-documented, and easy to integrate.
- 📱 **Cross Platform**: Works seamlessly on Android, iOS, Web, and Desktop.

## 🚀 Getting Started

Add `animbutton` to your `pubspec.yaml`:

```yaml
dependencies:
  animbutton: ^1.0.4
```

Then run:

```bash
flutter pub get
```

## 📖 Usage

### Basic Usage

```dart
import 'package:animbutton/animbutton.dart';

AnimButton(
  label: 'Tap Me',
  onPressed: () {
    print('Button Tapped!');
  },
)
```

### Advanced Customization

```dart
AnimButton(
  width: 200,
  height: 60,
  borderRadius: 30,
  buttonColor: Colors.deepPurple,
  gradient: LinearGradient(
    colors: [Colors.purple, Colors.blue],
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.purple.withOpacity(0.3),
      blurRadius: 10,
      offset: Offset(0, 5),
    ),
  ],
  textStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  label: 'Premium Button',
  onPressed: () {},
)
```

### Custom Child Widget

```dart
AnimButton(
  width: 150,
  onPressed: () {},
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.download, color: Colors.white),
      SVariable(width: 10),
      Text('Download', style: TextStyle(color: Colors.white)),
    ],
  ),
)
```

## 🛠️ Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `label` | `String?` | `null` | The text to display inside the button. |
| `child` | `Widget?` | `null` | A custom widget to display (overrides `label`). |
| `onPressed` | `VoidCallback` | **Required** | Callback when tapped. |
| `buttonColor`| `Color` | `Colors.lightBlueAccent` | Background color. |
| `gradient` | `Gradient?` | `null` | Background gradient (overrides `buttonColor`). |
| `width` | `double` | `100.0` | Button width. |
| `height` | `double` | `45.0` | Button height. |
| `borderRadius`| `double` | `8.0` | Border radius. |
| `duration` | `Duration` | `150ms` | Animation duration. |
| `boxShadow` | `List<BoxShadow>?`| `null` | List of shadows. |
| `animationBegin`| `double` | `1.0` | Start scale. |
| `animationEnd`| `double` | `0.75` | End scale when pressed. |

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


