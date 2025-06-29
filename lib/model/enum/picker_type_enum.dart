/// Defines the different types of display modes for the dial code picker.
///
/// This enum controls how the picker is presented to the user.
/// The picker can be displayed as a bottom sheet, dialog, or in responsive mode.
enum PickerType {
  /// Shows the picker as a modal bottom sheet.
  ///
  /// This is ideal for mobile devices and provides a native feel.
  /// The picker slides up from the bottom of the screen.
  bottomSheet,

  /// Shows the picker as a centered dialog.
  ///
  /// This is suitable for both mobile and desktop applications.
  /// The picker appears in the center of the screen with a backdrop.
  dialog,

  /// Automatically chooses the best display method based on screen size.
  ///
  /// - On mobile devices (width < 600px): Shows as [bottomSheet]
  /// - On larger screens (width ≥ 600px): Shows as positioned popup or [dialog]
  ///
  /// This is the recommended option for most applications as it provides
  /// the best user experience across different devices.
  responsive,
}
