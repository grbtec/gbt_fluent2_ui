import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_debug.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';
import 'package:gbt_fluent2_ui/mixed_fluent_with_material/mixed_fluent_theme.dart';
import 'package:gbt_fluent2_ui/utils/debouncer.dart';

import 'cancel_icon.dart';

part 'fluent_search_bar_controller.dart';

class FluentSearchBar extends StatefulWidget {
  /// This function is intended to be used with the cancel button and icon cancel
  /// to stop the ongoing operation. It helps in halting any asynchronous task
  final void Function() onCancelOperation;
  final SearchBarAlignment searchBarAlignment;
  final Icon? trailingIcon;
  final String? hintText;
  final Future<void> Function(String value) onSearch;

  FluentSearchBar.centered({
    super.key,
    required this.onSearch,
    required this.onCancelOperation,
    this.searchBarAlignment = SearchBarAlignment.centered,
    this.hintText,
  }) : trailingIcon = null;

  FluentSearchBar.leftAligned({
    super.key,
    this.trailingIcon,
    required this.onSearch,
    required this.onCancelOperation,
    this.searchBarAlignment = SearchBarAlignment.leftAligned,
    this.hintText,
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

  Widget? buildTrailingIcon({
    Icon? icon,
    required bool isNotEmpty,
    required bool hasFocus,
    required bool isLoading,
    required void Function() onTapCancelIcon,
  }) {
    if (isNotEmpty && isLoading) {
      return CancelIcon(
        isLoading: isLoading,
        onTap: onTapCancelIcon,
      );
    }
    if (hasFocus && isNotEmpty) {
      return CancelIcon(
        isLoading: isLoading,
        onTap: onTapCancelIcon,
      );
    }
    if (icon != null) {
      IconTheme(
        data: IconThemeData(
          color: FluentColors.neutralForeground2Rest,
          size: FluentSize.size200.value,
        ),
        child: icon,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final fluentTheme = FluentThemeDataModel.of(context) as GbtFluentThemeData;
    final trailingIcon = widget.trailingIcon;
    final isNotEmpty = searchBarController.queryString.isNotEmpty;
    final isLoading = searchBarController._isLoading;
    final hasFocus = searchBarController.hasFocus;
    final hintText = widget.hintText;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 36,
            child: TextField(
              focusNode: searchBarController._focus,
              // To focus on the first click
              onTap: () {
                FocusScope.of(context).isFirstFocus;
              },
              // Instaciando o objeto e usando na mesma linha.
              controller: searchBarController.textEditingController,
              onChanged: onChange,
              cursorColor: FluentColors.neutralForeground3Rest,
              style: fluentTheme
                  .fluentTextTheme
                  ?.body1
                  ?.fluentCopyWith(
                    fluentColor: FluentColors.neutralForeground1Rest,
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
                fillColor: FluentColors.neutralBackground5Rest,
                filled: true,
                hintText: hintText,
                hintStyle: fluentTheme
                    .fluentTextTheme
                    ?.body1
                    ?.fluentCopyWith(
                      fluentColor: FluentColors.neutralForeground2Rest,
                    ),
                suffixIcon: buildTrailingIcon(
                    icon: trailingIcon,
                    hasFocus: hasFocus,
                    isLoading: isLoading,
                    isNotEmpty: isNotEmpty,
                    onTapCancelIcon: () {
                      setState(() {
                        searchBarController.clearQueryString();
                      });
                      widget.onCancelOperation();
                    }),
                prefixIcon: Icon(
                  Icons.search,
                  color: FluentColors.neutralForeground1Rest,
                  size: FluentSize.size200.value,
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
            child: Text('Cancelar'),
          )
        ],
      ],
    );
  }
}
