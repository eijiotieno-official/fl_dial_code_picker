import 'package:flutter/material.dart';

import '../model/base/country_model.dart';
import '../model/enum/picker_type_enum.dart';
import '../model/service/country_service.dart';

class PickerView extends StatefulWidget {
  final PickerType pickerType;
  final Color? accentColor;
  final Color? backgroundColor;
  final InputDecoration? searchDecoration;
  final String? title;
  final bool showCloseButton;
  final String searchPlaceholder;
  final TextStyle? titleStyle;
  final TextStyle? countryNameStyle;
  final TextStyle? dialCodeStyle;
  final double? maxWidth;
  final double? maxHeight;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsets? padding;
  final bool showSearchField;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Country? initialCountry;

  const PickerView({
    super.key,
    this.pickerType = PickerType.bottomSheet,
    this.accentColor,
    this.backgroundColor,
    this.searchDecoration,
    this.title,
    this.showCloseButton = true,
    this.searchPlaceholder = "Search name or dial",
    this.titleStyle,
    this.countryNameStyle,
    this.dialCodeStyle,
    this.maxWidth,
    this.maxHeight,
    this.borderRadius,
    this.boxShadow,
    this.padding,
    this.showSearchField = true,
    this.leadingWidget,
    this.trailingWidget,
    this.initialCountry,
  });

  @override
  State<PickerView> createState() => _PickerViewState();
}

class _PickerViewState extends State<PickerView> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Country> _loadedCountries = [];
  int? _initialCountryIndex;

  @override
  void initState() {
    _loadedCountries = CountryService().getCountries();
    _findInitialCountryIndex();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _findInitialCountryIndex() {
    if (widget.initialCountry != null) {
      _initialCountryIndex = _loadedCountries.indexWhere(
        (country) => country.dial == widget.initialCountry!.dial,
      );
    }
  }

  void _scrollToInitialCountry() {
    if (_initialCountryIndex != null && _initialCountryIndex! >= 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _initialCountryIndex! * 72.0, // Approximate height of ListTile
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  final List<Country> _searchResult = [];

  void _search() {
    setState(() {
      _searchResult.clear();
    });
    final search = _searchController.text.trim().toLowerCase().replaceAll(
      " ",
      "",
    );
    for (var country in _loadedCountries) {
      bool matchName = country.name
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(search);

      bool matchCode = country.code
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(search);

      bool matchDial = country.dial
          .toLowerCase()
          .replaceAll(" ", "")
          .contains(search);

      if (matchDial || matchName || matchCode) {
        bool added = _searchResult.any((s) => s.dial == country.dial);
        if (!added) {
          setState(() {
            _searchResult.add(country);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    final countries = _searchResult.isNotEmpty
        ? _searchResult
        : _loadedCountries;

    Widget pickerContent = Material(
      color: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:
              widget.maxWidth ??
              (isMobile
                  ? size.width
                  : (widget.pickerType == PickerType.dialog
                        ? 400.0
                        : size.width * 0.4)),
          maxHeight:
              widget.maxHeight ??
              (isMobile ? size.height * 0.8 : size.height * 0.7),
        ),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16.0),
          boxShadow:
              widget.boxShadow ??
              (widget.pickerType == PickerType.dialog
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with title and close button
            if (widget.title != null || widget.showCloseButton)
              Padding(
                padding:
                    widget.padding ??
                    const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Row(
                  children: [
                    if (widget.leadingWidget != null) widget.leadingWidget!,
                    if (widget.title != null) ...[
                      Expanded(
                        child: Text(
                          widget.title!,
                          style:
                              widget.titleStyle ??
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ] else ...[
                      const Spacer(),
                    ],
                    if (widget.trailingWidget != null) widget.trailingWidget!,
                    if (widget.showCloseButton)
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close_rounded),
                        tooltip: 'Close',
                      ),
                  ],
                ),
              ),
            // Search field
            if (widget.showSearchField)
              Padding(
                padding:
                    widget.padding ??
                    const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  decoration:
                      widget.searchDecoration ??
                      InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.accentColor ?? Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        prefixIcon: const Icon(Icons.search),
                        labelText: widget.searchPlaceholder,
                      ),
                  onChanged: (v) {
                    _search();
                  },
                ),
              ),
            Expanded(
              child: countries.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeCap: StrokeCap.round,
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        final country = countries[index];
                        final isInitialCountry =
                            widget.initialCountry != null &&
                            country.dial == widget.initialCountry!.dial;

                        return ListTile(
                          onTap: () {
                            Navigator.pop(context, country);
                          },
                          tileColor: isInitialCountry
                              ? (widget.accentColor?.withValues(alpha: 0.1) ??
                                    Colors.blue.withValues(alpha: 0.1))
                              : null,
                          leading: Text(
                            country.flag,
                            style: TextStyle(
                              fontSize: Theme.of(
                                context,
                              ).textTheme.titleLarge?.fontSize,
                            ),
                          ),
                          title: Text(
                            country.name,
                            style: widget.countryNameStyle,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isInitialCountry)
                                Icon(
                                  Icons.check_circle,
                                  color: widget.accentColor ?? Colors.blue,
                                  size: 20,
                                ),
                              const SizedBox(width: 8),
                              Text(
                                country.dial,
                                style:
                                    widget.dialCodeStyle ??
                                    TextStyle(
                                      fontSize: Theme.of(
                                        context,
                                      ).textTheme.titleMedium?.fontSize,
                                      color: widget.accentColor,
                                    ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            if (widget.pickerType == PickerType.bottomSheet)
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );

    // Only wrap with SafeArea for bottom sheet mode
    return widget.pickerType == PickerType.bottomSheet
        ? SafeArea(child: pickerContent)
        : pickerContent;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Scroll to initial country after the widget is built
    if (_initialCountryIndex != null && _initialCountryIndex! >= 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToInitialCountry();
      });
    }
  }
}
