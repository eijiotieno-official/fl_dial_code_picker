/// A responsive Flutter package for picking country dial codes.
///
/// This package provides a comprehensive country dial code picker that automatically
/// adapts to different screen sizes with extensive customization options.
///
/// ## Features
///
/// * **Responsive Design**: Automatically adapts to mobile and desktop screen sizes
/// * **Comprehensive Country List**: 200+ countries with flags, names, codes, and dial codes
/// * **Multiple Display Modes**: Bottom sheet, dialog, and responsive modes
/// * **Smart Search**: Search by country name, code, or dial code
/// * **Highly Customizable**: Extensive styling and layout options
/// * **Accessibility**: Full keyboard navigation and screen reader support
///
/// ## Quick Start
///
/// ```dart
/// import 'package:fl_dial_code_picker/fl_dial_code_picker.dart';
///
/// // Show the picker
/// final country = await FlDialCodePicker.show(
///   context: context,
///   pickerType: PickerType.responsive,
/// );
///
/// if (country != null) {
///   print('Selected: ${country.name} (${country.dial})');
/// }
/// ```
///
/// ## Responsive Behavior
///
/// The picker intelligently adapts to different screen sizes:
///
/// * **Mobile** (< 600px): Shows as bottom sheet
/// * **Desktop/Tablet** (≥ 600px): Shows as positioned popup or dialog
///
/// For more information, see the [README](https://github.com/eijiotieno-official/fl_dial_code_picker).
library;

export 'model/service/fl_dial_code_picker.dart';

export 'model/base/country_model.dart';

export 'model/enum/picker_type_enum.dart';
