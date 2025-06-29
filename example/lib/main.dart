import 'package:fl_dial_code_picker/fl_dial_code_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Country? _selectedCountry;
  final GlobalKey _buttonKey = GlobalKey();

  void _showResponsivePicker() async {
    final country = await FlDialCodePicker.show(
      context: context,
      pickerType: PickerType.responsive,
      anchorKey:
          _buttonKey, // This will enable positioned popup on larger screens
      title: "Choose Country",
      titleStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.blue,
      ),
      accentColor: Colors.blue,
      searchPlaceholder: "Search countries...",
      initialCountry: _selectedCountry, // Pre-select current country
    );
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showBottomSheetPicker() async {
    final country = await FlDialCodePicker.show(
      context: context,
      pickerType: PickerType.bottomSheet,
      backgroundColor: Colors.grey[50],
      title: "Select Country Code",
      borderRadius: BorderRadius.circular(20),
      padding: const EdgeInsets.all(20),
      initialCountry: _selectedCountry, // Pre-select current country
    );
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showDialogPicker() async {
    final country = await FlDialCodePicker.show(
      context: context,
      pickerType: PickerType.dialog,
      maxWidth: 350,
      maxHeight: 500,
      title: "Country Picker",
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.purple,
      ),
      countryNameStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      dialCodeStyle: const TextStyle(
        fontSize: 14,
        color: Colors.purple,
        fontWeight: FontWeight.w600,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.purple.withValues(alpha: 0.2),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
      initialCountry: _selectedCountry, // Pre-select current country
    );
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showCustomPicker() async {
    final country = await FlDialCodePicker.show(
      context: context,
      pickerType: PickerType.dialog,
      title: "🌍 Select Your Country",
      titleStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.green,
        letterSpacing: 0.5,
      ),
      showCloseButton: true,
      showSearchField: true,
      searchPlaceholder: "Type to search...",
      accentColor: Colors.green,
      backgroundColor: Colors.white,
      maxWidth: 450,
      borderRadius: BorderRadius.circular(25),
      padding: const EdgeInsets.all(24),
      leadingWidget: const Icon(Icons.public, color: Colors.green, size: 24),
      trailingWidget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.green.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "Required",
          style: TextStyle(
            fontSize: 12,
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      initialCountry: _selectedCountry, // Pre-select current country
    );
    setState(() {
      _selectedCountry = country;
    });
  }

  void _showPickerWithUSInitial() async {
    // Create a US country object for demonstration
    final usCountry = Country(
      name: "United States",
      flag: "🇺🇸",
      code: "US",
      dial: "+1",
    );

    final country = await FlDialCodePicker.show(
      context: context,
      pickerType: PickerType.dialog,
      title: "Select Country (US Pre-selected)",
      accentColor: Colors.red,
      initialCountry: usCountry, // Always start with US selected
    );
    setState(() {
      _selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dial Code Picker'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Screen Size: ${screenSize.width.toInt()} x ${screenSize.height.toInt()}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Device Type: ${isMobile ? "Mobile" : "Desktop/Tablet"}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Selected Country: ${_selectedCountry?.name ?? "None"}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (_selectedCountry != null) ...[
              Text('Flag: ${_selectedCountry!.flag}'),
              Text('Dial Code: ${_selectedCountry!.dial}'),
              Text('Country Code: ${_selectedCountry!.code}'),
            ],
            const SizedBox(height: 30),
            Text(
              'Picker Options:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  key: _buttonKey,
                  onPressed: _showResponsivePicker,
                  child: const Text('Responsive Picker'),
                ),
                ElevatedButton(
                  onPressed: _showBottomSheetPicker,
                  child: const Text('Bottom Sheet'),
                ),
                ElevatedButton(
                  onPressed: _showDialogPicker,
                  child: const Text('Dialog'),
                ),
                ElevatedButton(
                  onPressed: _showCustomPicker,
                  child: const Text('Custom Picker'),
                ),
                ElevatedButton(
                  onPressed: _showPickerWithUSInitial,
                  child: const Text('US Initial'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How it works:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Responsive: Automatically chooses bottom sheet on mobile and positioned popup on larger screens',
                  ),
                  Text('• Bottom Sheet: Always shows as modal bottom sheet'),
                  Text('• Dialog: Always shows as centered dialog'),
                  Text(
                    '• On larger screens, the responsive picker will appear below the button if anchorKey is provided',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
