import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';

class FluentList extends StatelessWidget {
  final bool _isOneLine;
  final String? sectionHeaderTitle;
  final IconData? sectionHeaderTitleIcon;
  final SectionHeaderTitleVariant? sectionHeaderTitleVariant;
  final FluentSectionHeaderActions? sectionHeaderActions;
  final Color? sectionHeaderBackgroundColor;
  final Color? sectionDescriptionBackgroundColor;
  final Widget? separator;

  final FluentListType listType;

  final String? sectionDescriptionText;
  final IconData? sectionDescriptionIcon;

  final List<Widget> listItems;

  /// FluentList's constructor
  const FluentList.oneLine({
    required List<FluentListItemOneLine> this.listItems,
    super.key,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionIcon,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
  })  : _isOneLine = true,
        listType = FluentListType.oneLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionIcon == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionIcon != null ||
              sectionDescriptionText == null && sectionDescriptionIcon == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon icon without pass sectionHeaderTitle',
        );

  /// FluentList's constructor
  const FluentList.multiLine({
    required List<FluentListItemMultiLine> this.listItems,
    super.key,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionIcon,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
  })  : _isOneLine = false,
        listType = FluentListType.multiLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionIcon == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionIcon != null ||
              sectionDescriptionText == null && sectionDescriptionIcon == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon icon without pass sectionHeaderTitle',
        );

  /// FluentList's constructor
  FluentList.builderOneLine({
    super.key,
    required int itemCount,
    required FluentListItemOneLine Function(BuildContext context, int index)
        itemBuilder,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionIcon,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
  })  : _isOneLine = true,
        listType = FluentListType.oneLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionIcon == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionIcon != null ||
              sectionDescriptionText == null && sectionDescriptionIcon == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon icon without pass sectionHeaderTitle',
        ),
        listItems = [
          for (var index = 0; index < itemCount; index++)
            Builder(builder: (context) => itemBuilder(context, index))
        ];

  /// FluentList's constructor
  FluentList.builderMultiLine({
    super.key,
    required int itemCount,
    required FluentListItemMultiLine Function(BuildContext context, int index)
        itemBuilder,
    this.sectionHeaderTitle,
    this.sectionHeaderActions,
    this.sectionDescriptionIcon,
    this.sectionDescriptionText,
    this.sectionHeaderTitleIcon,
    this.sectionHeaderTitleVariant = SectionHeaderTitleVariant.bold,
    this.sectionHeaderBackgroundColor,
    this.sectionDescriptionBackgroundColor,
    this.separator,
  })  : _isOneLine = false,
        listType = FluentListType.multiLine,
        assert(
          sectionDescriptionText != null && sectionDescriptionIcon == null ||
              sectionDescriptionText != null &&
                  sectionDescriptionIcon != null ||
              sectionDescriptionText == null && sectionDescriptionIcon == null,
          'Cannot pass only sectionDescriptionIcon to list section description',
        ),
        assert(
          sectionHeaderTitle != null && sectionHeaderTitleIcon != null ||
              sectionHeaderTitle != null && sectionHeaderTitleIcon == null ||
              sectionHeaderTitle == null && sectionHeaderTitleIcon == null,
          'Cannot pass sectionHeaderTitleIcon icon without pass sectionHeaderTitle',
        ),
        listItems = [
          for (var index = 0; index < itemCount; index++)
            Builder(builder: (context) => itemBuilder(context, index))
        ];

  @override
  Widget build(BuildContext context) {
    final sectionHeaderTitle = this.sectionHeaderTitle;
    final sectionDescriptionText = this.sectionDescriptionText;
    final separator = this.separator;
    return Container(
      padding: _isOneLine
          ? EdgeInsets.only(
              top: FluentSize.size160.value,
              left: FluentSize.size160.value,
              right: FluentSize.size160.value,
            )
          : EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (sectionHeaderTitle != null)
              FluentSectionHeader(
                title: sectionHeaderTitle,
                titleIcon: sectionHeaderTitleIcon,
                actions: sectionHeaderActions,
                titleVariant: sectionHeaderTitleVariant,
                backgroundColor: sectionHeaderBackgroundColor,
              ),
            for (var item in listItems) ...[
              if (separator != null && listItems.indexOf(item) != 0) separator,
              FluentContainer(
                color: FluentColors.neutralBackground3Rest,
                cornerRadius: _isOneLine
                    ? FluentCornerRadius.xLarge
                    : FluentCornerRadius.none,
                child: item,
              ),
            ],
            if (sectionDescriptionText != null)
              FluentSectionDescription(
                description: sectionDescriptionText,
                icon: sectionDescriptionIcon,
                backgroundColor: sectionDescriptionBackgroundColor,
              ),
          ],
        ),
      ),
    );
  }
}

enum FluentListType { oneLine, multiLine }
