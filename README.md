Flutter animated button package: Elegant UI interactions with smooth animations, customizable styles, and seamless integration across the platforms.

![demo](https://github.com/Pranav2918/AnimButton/assets/69794884/6c7d014e-1fd1-46e7-a746-ea283db4a78d)

### Features


- Gives visual feedbacks on tap 

- Higly customizable in any way

    - Height
    - Width
    - Color
    - Animation
    - TextStyle
    - BorderRadius 

- Various Animation on tap


## Getting started

Add the latest version of package to your pubspec.yaml (and run dart pub get):

```dart
dependencies:
  animbutton: ^latest_version
```

## Usage

```dart
class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimButton(
          buttonColor: Colors.black,
          height: 45.0,
          width: 120.0,
          label: 'Anim Button',
          onPressed: () {
            debugPrint("Button Tapped");
          }),
    );
  }
}
```


