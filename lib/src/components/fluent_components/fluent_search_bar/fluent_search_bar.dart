import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/fluent_icons.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_debug.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';
import 'package:gbt_fluent2_ui/utils/debouncer.dart';

import 'cancel_icon.dart';

part 'fluent_search_bar_controller.dart';

class FluentSearchBar extends StatefulWidget {
  /// This function is intended to be used with the cancel button and icon cancel
  /// to stop the ongoing operation. It helps in halting any asynchronous task
  final void Function() onCancelOperation;
  final void Function()? onClearOperation;
  final void Function()? onEmpty;
  final SearchBarAlignment searchBarAlignment;
  final Widget? trailingIcon;
  final void Function()? onTapTrailingIcon;
  final String? hintText;
  final Color? cancelTextColor;
  final Future<void> Function(String value) onSearch;
  final FluentThemeColorVariation themeColorVariation;

  FluentSearchBar.centered({
    super.key,
    required this.onSearch,
    required this.onCancelOperation,
    this.onClearOperation,
    this.onEmpty,
    @Deprecated("This property is deprecated and will be removed in future "
        "versions. Consider removing or ignoring this property.")
    this.searchBarAlignment = SearchBarAlignment.centered,
    this.cancelTextColor,
    this.hintText,
    this.themeColorVariation = FluentThemeColorVariation.neutral,
  })  : trailingIcon = null,
        onTapTrailingIcon = null;

  FluentSearchBar.leftAligned({
    super.key,
    this.trailingIcon,
    this.onTapTrailingIcon,
    required this.onSearch,
    required this.onCancelOperation,
    this.onClearOperation,
    this.onEmpty,
    @Deprecated("This property is deprecated and will be removed in future "
        "versions. Consider removing or ignoring this property.")
    this.searchBarAlignment = SearchBarAlignment.leftAligned,
    this.cancelTextColor,
    this.hintText,
    this.themeColorVariation = FluentThemeColorVariation.neutral,
  });

  @override
  State<FluentSearchBar> createState() => _FluentSearchBarState();
}

class _FluentSearchBarState extends State<FluentSearchBar> {
  final searchBarController = FluentSearchBarController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchBarController.dispose();
    super.dispose();
  }

  void onChange(String value) {
    searchBarController._debounce(
      () async {
        setState(() {
          searchBarController.toggleIsLoading();
        });

        if (searchBarController.queryString.isNotEmpty) {
          if (GbtFluent2Debug.printIsEnabled) {
            print('ASYNC FUNCTION RUNNING...');
          }
          await widget.onSearch(value).whenComplete(
            () {
              setState(() {
                searchBarController.toggleIsLoading();
              });
            },
          ).then((value) {
            if (GbtFluent2Debug.printIsEnabled) {
              print(
                  'ENDED OPERATION AND THIS IS THE VALUE: ${searchBarController.queryString}');
            }
          }).onError((error, stackTrace) {
            if (GbtFluent2Debug.printIsEnabled) {
              print('ERROR IN OPERATION');
            }
          });
        } else {
          widget.onEmpty?.call();
          if (GbtFluent2Debug.printIsEnabled) {
            print('NOT RUNNING ASYNC FUNCTION');
          }
          setState(() {
            searchBarController.toggleIsLoading();
          });
        }
      },
    );
    if (GbtFluent2Debug.printIsEnabled) {
      print(
          '===> VALUE OF TEXT EDITING CONTROLLER: ${searchBarController.queryString}');
    }
  }

  Widget? buildTrailingIcon(
    BuildContext context, {
    Widget? icon,
    required bool isNotEmpty,
    required bool hasFocus,
    required bool isLoading,
    required void Function() onTapCancelIcon,
    void Function()? onTapTrailingIcon,
  }) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    if (isNotEmpty && isLoading) {
      return CancelIcon(
        isLoading: isLoading,
        onTap: onTapCancelIcon,
        themeColorVariation: widget.themeColorVariation,
      );
    }
    if (hasFocus && isNotEmpty) {
      return CancelIcon(
        isLoading: isLoading,
        onTap: onTapCancelIcon,
        themeColorVariation: widget.themeColorVariation,
      );
    }
    if (icon != null) {
      return IconTheme(
        data: IconThemeData(
          color: colorMode(
            widget.themeColorVariation == FluentThemeColorVariation.neutral
                ? FluentColors.neutralForeground2Rest
                : FluentDarkColors.neutralForeground1Rest,
            FluentDarkColors.neutralForeground2Rest,
          ),
          size: FluentSize.size200.value,
        ),
        child: GestureDetector(
          onTap: onTapTrailingIcon,
          child: icon,
        ),
      );
    }
    return SizedBox(
      width: FluentSize.size200.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = createColorMode(Theme.of(context).brightness);
    final fluentTheme = FluentThemeDataModel.of(context) as GbtFluentThemeData;
    final trailingIcon = widget.trailingIcon;
    final isNotEmpty = searchBarController.queryString.isNotEmpty;
    final isLoading = searchBarController._isLoading;
    final hasFocus = searchBarController.hasFocus;
    final hintText = widget.hintText;
    final cancelTextColor = widget.cancelTextColor;
    final searchBarAlignment = widget.searchBarAlignment;
    final themeColorVariation = widget.themeColorVariation;
    final isNeutral = themeColorVariation == FluentThemeColorVariation.neutral;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 36,
            child: TextField(
              textAlign: searchBarAlignment != SearchBarAlignment.centered ||
                      hasFocus ||
                      isNotEmpty
                  ? TextAlign.start
                  : TextAlign.center,
              focusNode: searchBarController._focus,
              // To focus on the first click
              onTap: () {
                FocusScope.of(context).isFirstFocus;
              },
              controller: searchBarController.textEditingController,
              onChanged: onChange,
              cursorColor: colorMode(
                themeColorVariation == FluentThemeColorVariation.neutral
                    ? FluentColors.neutralForeground3Rest
                    : FluentDarkColors.neutralForeground3Rest,
                FluentDarkColors.neutralForeground3Rest,
              ),
              style: fluentTheme.fluentTextTheme?.body1?.fluentCopyWith(
                fluentColor: colorMode(
                  isNeutral
                      ? FluentColors.neutralForeground1Rest
                      : FluentDarkColors.neutralForeground1Rest,
                  FluentDarkColors.neutralForeground1Rest,
                ),
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(
                    FluentCornerRadius.xLarge.value,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(
                    FluentCornerRadius.xLarge.value,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                fillColor: colorMode(
                  isNeutral
                      ? FluentColors.neutralBackground5Rest
                      : FluentColors.of(context)?.brandBackground2Rest,
                  FluentDarkColors.neutralBackground5Rest,
                ),
                filled: true,
                hintText: hintText,
                hintStyle: fluentTheme.fluentTextTheme?.body1?.fluentCopyWith(
                  fluentColor: colorMode(
                    isNeutral
                        ? FluentColors.neutralForeground2Rest
                        : FluentDarkColors.neutralForeground2Rest,
                    FluentDarkColors.neutralForeground2Rest,
                  ),
                ),
                suffixIcon: buildTrailingIcon(
                  context,
                  icon: trailingIcon,
                  hasFocus: hasFocus,
                  isLoading: isLoading,
                  isNotEmpty: isNotEmpty,
                  onTapCancelIcon: () {
                    setState(() {
                      searchBarController.clearQueryString();
                    });
                    widget.onClearOperation?.call();
                  },
                  onTapTrailingIcon: widget.onTapTrailingIcon,
                ),
                prefixIcon: searchBarAlignment != SearchBarAlignment.centered ||
                        hasFocus ||
                        isNotEmpty
                    ? Icon(
                        FluentIcons.search_20_regular,
                        size: FluentSize.size200.value,
                        color: colorMode(
                            isNeutral
                                ? hasFocus
                                    ? FluentColors.neutralForeground1Rest
                                    : FluentColors.neutralForeground3Rest
                                : FluentDarkColors.neutralForeground1Rest,
                            hasFocus
                                ? FluentDarkColors.neutralForeground1Rest
                                : FluentDarkColors.neutralForeground3Rest),
                      )
                    : Align(
                        widthFactor: 0,
                        child: Container(
                          padding: EdgeInsets.only(right: 61),
                          alignment: Alignment.centerRight,
                          width: double.maxFinite,
                          child: Icon(
                            FluentIcons.search_20_regular,
                            color: colorMode(
                              isNeutral
                                  ? FluentColors.neutralForeground3Rest
                                  : FluentDarkColors.neutralForeground1Rest,
                              FluentDarkColors.neutralForeground3Rest,
                            ),
                            size: FluentSize.size200.value,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
        if (hasFocus || isNotEmpty) ...[
          SizedBox(
            width: FluentSize.size120.value,
          ),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              foregroundColor: cancelTextColor ??
                  colorMode(
                    isNeutral
                        ? FluentColors.neutralForeground1Rest
                        : FluentDarkColors.neutralForeground1Rest,
                    FluentDarkColors.neutralForeground1Rest,
                  ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              setState(() {
                searchBarController.clearQueryString();
              });
              widget.onCancelOperation();
              if (GbtFluent2Debug.printIsEnabled) {
                print(
                    'Is value changed? => ${searchBarController.queryString}');
              }
            },
            child: FluentText('Cancelar'),
          )
        ],
      ],
    );
  }
}
