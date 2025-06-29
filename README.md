<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Flutter Dial Code Picker

A responsive Flutter package for picking country dial codes that automatically adapts to different screen sizes with extensive customization options.

![Flutter Dial Code Picker](https://img.shields.io/badge/Flutter-3.8+-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## 🌟 Features

- 🌍 **Comprehensive Country List**: 200+ countries with flags, names, codes, and dial codes
- 📱 **Responsive Design**: Automatically adapts to mobile and desktop screen sizes
- 🎨 **Highly Customizable**: Extensive styling and layout options
- 🔍 **Smart Search**: Search by country name, code, or dial code
- 📍 **Positioned Popups**: Context-aware positioning on larger screens
- ✅ **Initial Country Selection**: Pre-select and highlight countries
- 🎯 **Multiple Display Modes**: Bottom sheet, dialog, and responsive modes
- ♿ **Accessibility**: Full keyboard navigation and screen reader support

## 📱 Responsive Behavior

The picker intelligently adapts to different screen sizes:

| Device Type | Screen Width | Display Method | Description |
|-------------|--------------|----------------|-------------|
| **Mobile** | < 600px | Bottom Sheet | Full-width modal from bottom |
| **Desktop/Tablet** | ≥ 600px | Positioned Popup | Appears below calling widget |
| **Desktop/Tablet** | ≥ 600px | Dialog | Centered dialog (fallback) |

## 🚀 Quick Start

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  fl_dial_code_picker: ^0.0.1
```

### Basic Usage

```dart
import 'package:fl_dial_code_picker/fl_dial_code_picker.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Country? selectedCountry;
  final GlobalKey buttonKey = GlobalKey();

  void _showPicker() async {
    final country = await FlDialCodePicker.show(
      context: context,
      pickerType: PickerType.responsive,
      anchorKey: buttonKey, // For positioned popup on larger screens
      initialCountry: selectedCountry, // Pre-select current country
    );
    
    if (country != null) {
      setState(() {
        selectedCountry = country;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: buttonKey,
      onPressed: _showPicker,
      child: Text(selectedCountry?.dial ?? 'Select Country'),
    );
  }
}
```

## 🎨 Customization Examples

### Basic Styling

```dart
final country = await FlDialCodePicker.show(
  context: context,
  title: "Choose Your Country",
  accentColor: Colors.blue,
  backgroundColor: Colors.white,
  searchPlaceholder: "Search countries...",
  maxWidth: 400,
  borderRadius: BorderRadius.circular(20),
);
```

### Advanced Customization

```dart
final country = await FlDialCodePicker.show(
  context: context,
  pickerType: PickerType.dialog,
  title: "🌍 Select Country",
  titleStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
    letterSpacing: 0.5,
  ),
  countryNameStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  dialCodeStyle: TextStyle(
    fontSize: 14,
    color: Colors.purple,
    fontWeight: FontWeight.w600,
  ),
  maxWidth: 450,
  maxHeight: 600,
  borderRadius: BorderRadius.circular(25),
  padding: EdgeInsets.all(24),
  boxShadow: [
    BoxShadow(
      color: Colors.purple.withValues(alpha: 0.2),
      blurRadius: 15,
      offset: Offset(0, 8),
    ),
  ],
  leadingWidget: Icon(Icons.public, color: Colors.purple),
  trailingWidget: Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.purple.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text("Required", style: TextStyle(fontSize: 12)),
  ),
);
```

### Initial Country Selection

```dart
// Pre-select a specific country
final usCountry = Country(
  name: "United States",
  flag: "🇺🇸",
  code: "US",
  dial: "+1",
);

final country = await FlDialCodePicker.show(
  context: context,
  initialCountry: usCountry, // This will highlight and scroll to US
  title: "Select Country",
);
```

## 📋 Available Parameters

### Basic Parameters
- `context` - The build context (required)
- `pickerType` - Type of picker to show (defaults to responsive)
- `accentColor` - Accent color for the picker
- `backgroundColor` - Background color for the picker
- `anchorKey` - GlobalKey for positioned popup on larger screens

### Content Customization
- `title` - Optional title to display in the picker header
- `showCloseButton` - Whether to show the close button (defaults to true)
- `showSearchField` - Whether to show the search field (defaults to true)
- `searchPlaceholder` - Placeholder text for the search field
- `searchDecoration` - Custom decoration for the search field
- `initialCountry` - Optional country to pre-select and highlight in the list

### Styling Parameters
- `titleStyle` - Custom style for the title text
- `countryNameStyle` - Custom style for country names in the list
- `dialCodeStyle` - Custom style for dial codes in the list
- `borderRadius` - Custom border radius for the picker
- `boxShadow` - Custom box shadow for the picker
- `padding` - Custom padding for the picker content

### Layout Parameters
- `maxWidth` - Maximum width of the picker
- `maxHeight` - Maximum height of the picker
- `leadingWidget` - Optional widget to show before the title
- `trailingWidget` - Optional widget to show after the title but before close button

## 🎯 Picker Types

### Responsive (Default)
```dart
// Automatically chooses the best display method
final country = await FlDialCodePicker.show(
  context: context,
  pickerType: PickerType.responsive,
);
```

### Bottom Sheet
```dart
// Always shows as a modal bottom sheet
final country = await FlDialCodePicker.show(
  context: context,
  pickerType: PickerType.bottomSheet,
);
```

### Dialog
```dart
// Always shows as a centered dialog
final country = await FlDialCodePicker.show(
  context: context,
  pickerType: PickerType.dialog,
);
```

## 📊 Country Model

The picker returns a `Country` object with the following properties:

```dart
class Country {
  final String name;      // Country name (e.g., "United States")
  final String flag;      // Country flag emoji (e.g., "🇺🇸")
  final String code;      // Country code (e.g., "US")
  final String dial;      // Dial code (e.g., "+1")
}
```

## 🖼️ Screenshots

### Dialog View
![Dialog View](screenshots/Screenshot%20From%202025-06-29%2012-32-09.png)

### Desktop View (Positioned Popup)
![Desktop Positioned Popup](screenshots/Screenshot%20From%202025-06-29%2012-32-22.png)

### Mobile Bottom Sheet
![Mobile Bottom Sheet](screenshots/Screenshot%20From%202025-06-29%2012-32-47.png)

## 🔧 Advanced Features

### Custom Title Styling
```dart
final country = await FlDialCodePicker.show(
  context: context,
  title: "🌍 Choose Your Country",
  titleStyle: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.green,
    letterSpacing: 0.5,
    shadows: [
      Shadow(
        color: Colors.green.withValues(alpha: 0.3),
        offset: Offset(1, 1),
        blurRadius: 2,
      ),
    ],
  ),
);
```

### Custom Search Field
```dart
final country = await FlDialCodePicker.show(
  context: context,
  searchDecoration: InputDecoration(
    labelText: "Find your country",
    prefixIcon: Icon(Icons.search, color: Colors.blue),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);
```

### Conditional Elements
```dart
final country = await FlDialCodePicker.show(
  context: context,
  showCloseButton: false, // Hide close button
  showSearchField: false, // Hide search field
  title: "Quick Select",
);
```

## 📱 Responsive Breakpoints

- **Mobile**: Screen width < 600px
- **Desktop/Tablet**: Screen width ≥ 600px

## 🧪 Example App

Run the included example app to see all features in action:

```bash
cd example
flutter run
```

The example demonstrates:
- ✅ Responsive behavior across different screen sizes
- ✅ All picker types (responsive, bottom sheet, dialog)
- ✅ Custom styling and theming
- ✅ Initial country selection
- ✅ Positioned popups on larger screens
- ✅ Search functionality
- ✅ Accessibility features

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Country data sourced from comprehensive international databases
- Icons provided by Material Design
- Built with Flutter framework

---

**Made with ❤️ for the Flutter community**
