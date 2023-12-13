Provide visual feedbacks with fully customized AnimButton

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
  fancy_containers: ^latest_version
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


