import 'package:flutter/material.dart';

import '../../view/picker_view.dart';
import '../base/country_model.dart';
import '../enum/picker_type_enum.dart';

/// A responsive dial code picker that adapts to different screen sizes.
///
/// The picker automatically chooses the most appropriate display method:
/// - On mobile devices (width < 600px): Shows as a bottom sheet
/// - On larger screens (width >= 600px): Shows as a positioned popup or dialog
///
/// Usage:
/// ```dart
/// // Responsive picker (recommended)
/// final country = await FlDialCodePicker.show(
///   context: context,
///   pickerType: PickerType.responsive,
///   anchorKey: buttonKey, // Optional: for positioned popup on larger screens
/// );
///
/// // Specific picker types
/// final country = await FlDialCodePicker.show(
///   context: context,
///   pickerType: PickerType.bottomSheet, // or PickerType.dialog
/// );
/// ```
class FlDialCodePicker {
  /// Shows a dial code picker with responsive behavior.
  ///
  /// [context] - The build context
  /// [pickerType] - The type of picker to show (defaults to responsive)
  /// [accentColor] - Optional accent color for the picker
  /// [backgroundColor] - Optional background color for the picker
  /// [anchorKey] - Optional GlobalKey to position the popup relative to a widget
  /// [title] - Optional title to display in the picker header
  /// [showCloseButton] - Whether to show the close button (defaults to true)
  /// [searchPlaceholder] - Placeholder text for the search field
  /// [titleStyle] - Custom style for the title text
  /// [countryNameStyle] - Custom style for country names in the list
  /// [dialCodeStyle] - Custom style for dial codes in the list
  /// [maxWidth] - Maximum width of the picker
  /// [maxHeight] - Maximum height of the picker
  /// [borderRadius] - Custom border radius for the picker
  /// [boxShadow] - Custom box shadow for the picker
  /// [padding] - Custom padding for the picker content
  /// [showSearchField] - Whether to show the search field (defaults to true)
  /// [leadingWidget] - Optional widget to show before the title
  /// [trailingWidget] - Optional widget to show after the title but before close button
  /// [searchDecoration] - Custom decoration for the search field
  /// [initialCountry] - Optional country to pre-select and highlight
  ///
  /// Returns a [Country] object if a country is selected, null if cancelled.
  static Future<Country?> show({
    required BuildContext context,
    PickerType pickerType = PickerType.responsive,
    Color? accentColor,
    Color? backgroundColor,
    GlobalKey? anchorKey, // Optional key to get the anchor widget's RenderBox
    String? title,
    bool showCloseButton = true,
    String searchPlaceholder = "Search name or dial",
    TextStyle? titleStyle,
    TextStyle? countryNameStyle,
    TextStyle? dialCodeStyle,
    double? maxWidth,
    double? maxHeight,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    EdgeInsets? padding,
    bool showSearchField = true,
    Widget? leadingWidget,
    Widget? trailingWidget,
    InputDecoration? searchDecoration,
    Country? initialCountry,
  }) async {
    // Determine the actual picker type based on screen size for responsive mode
    PickerType actualPickerType = pickerType;
    if (pickerType == PickerType.responsive) {
      final screenSize = MediaQuery.of(context).size;
      final isMobile = screenSize.width < 600; // Breakpoint for mobile devices

      if (isMobile) {
        actualPickerType = PickerType.bottomSheet;
      } else {
        // For larger screens, use positioned popup if anchorKey is provided, otherwise use dialog
        if (anchorKey?.currentContext != null) {
          final RenderBox? renderBox =
              anchorKey!.currentContext!.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            return await showPositioned(
              context: context,
              anchorBox: renderBox,
              accentColor: accentColor,
              backgroundColor: backgroundColor,
              title: title,
              showCloseButton: showCloseButton,
              searchPlaceholder: searchPlaceholder,
              titleStyle: titleStyle,
              countryNameStyle: countryNameStyle,
              dialCodeStyle: dialCodeStyle,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              borderRadius: borderRadius,
              boxShadow: boxShadow,
              padding: padding,
              showSearchField: showSearchField,
              leadingWidget: leadingWidget,
              trailingWidget: trailingWidget,
              searchDecoration: searchDecoration,
              initialCountry: initialCountry,
            );
          }
        }
        actualPickerType = PickerType.dialog;
      }
    }

    return actualPickerType == PickerType.bottomSheet
        ? await showModalBottomSheet<Country>(
            isScrollControlled: true,
            showDragHandle: true,
            backgroundColor: backgroundColor ?? Colors.white,
            context: context,
            builder: (context) => PickerView(
              pickerType: actualPickerType,
              accentColor: accentColor,
              backgroundColor: backgroundColor,
              title: title,
              showCloseButton: showCloseButton,
              searchPlaceholder: searchPlaceholder,
              titleStyle: titleStyle,
              countryNameStyle: countryNameStyle,
              dialCodeStyle: dialCodeStyle,
              maxWidth: maxWidth,
              maxHeight: maxHeight,
              borderRadius: borderRadius,
              boxShadow: boxShadow,
              padding: padding,
              showSearchField: showSearchField,
              leadingWidget: leadingWidget,
              trailingWidget: trailingWidget,
              searchDecoration: searchDecoration,
              initialCountry: initialCountry,
            ),
          )
        : await showDialog<Country>(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: PickerView(
                pickerType: actualPickerType,
                accentColor: accentColor,
                backgroundColor: backgroundColor,
                title: title,
                showCloseButton: showCloseButton,
                searchPlaceholder: searchPlaceholder,
                titleStyle: titleStyle,
                countryNameStyle: countryNameStyle,
                dialCodeStyle: dialCodeStyle,
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                borderRadius: borderRadius,
                boxShadow: boxShadow,
                padding: padding,
                showSearchField: showSearchField,
                leadingWidget: leadingWidget,
                trailingWidget: trailingWidget,
                searchDecoration: searchDecoration,
                initialCountry: initialCountry,
              ),
            ),
          );
  }

  /// Shows a positioned popup picker that appears below the calling widget
  /// This is ideal for desktop/web applications where you want the picker
  /// to appear in context with the calling element
  static Future<Country?> showPositioned({
    required BuildContext context,
    required RenderBox anchorBox,
    Color? accentColor,
    Color? backgroundColor,
    String? title,
    bool showCloseButton = true,
    String searchPlaceholder = "Search name or dial",
    TextStyle? titleStyle,
    TextStyle? countryNameStyle,
    TextStyle? dialCodeStyle,
    double? maxWidth,
    double? maxHeight,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    EdgeInsets? padding,
    bool showSearchField = true,
    Widget? leadingWidget,
    Widget? trailingWidget,
    InputDecoration? searchDecoration,
    Country? initialCountry,
  }) async {
    final screenSize = MediaQuery.of(context).size;
    final anchorPosition = anchorBox.localToGlobal(Offset.zero);
    final anchorSize = anchorBox.size;

    return await showDialog<Country>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (context) => Stack(
        children: [
          // Transparent overlay to capture taps outside
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Positioned picker
          Positioned(
            left: _calculateLeftPosition(
              anchorPosition.dx,
              anchorSize.width,
              screenSize.width,
            ),
            top:
                anchorPosition.dy +
                anchorSize.height +
                8, // 8px gap below anchor
            child: Material(
              color: Colors.transparent,
              child: PickerView(
                pickerType: PickerType.dialog,
                accentColor: accentColor,
                backgroundColor: backgroundColor,
                title: title,
                showCloseButton: showCloseButton,
                searchPlaceholder: searchPlaceholder,
                titleStyle: titleStyle,
                countryNameStyle: countryNameStyle,
                dialCodeStyle: dialCodeStyle,
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                borderRadius: borderRadius,
                boxShadow: boxShadow,
                padding: padding,
                showSearchField: showSearchField,
                leadingWidget: leadingWidget,
                trailingWidget: trailingWidget,
                searchDecoration: searchDecoration,
                initialCountry: initialCountry,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Calculate the left position to ensure the picker stays within screen bounds
  static double _calculateLeftPosition(
    double anchorLeft,
    double anchorWidth,
    double screenWidth,
  ) {
    const pickerWidth = 400.0; // Fixed picker width for consistency
    const margin = 16.0; // Minimum margin from screen edge

    double leftPosition = anchorLeft;

    // Ensure picker doesn't go off the right edge
    if (leftPosition + pickerWidth > screenWidth - margin) {
      leftPosition = screenWidth - pickerWidth - margin;
    }

    // Ensure picker doesn't go off the left edge
    if (leftPosition < margin) {
      leftPosition = margin;
    }

    return leftPosition;
  }
}
