import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';



class FluentAvatar extends StatelessWidget {
  // replace it to image/text ↓
  final Widget child;
  final bool? isGroup;
  final FluentStrokeStyle? strokeStyle;
  final StatusPresenceBadge? statusPresenceBadge;
  final Widget? cutout;
  final FluentAvatarSize? size;

  /// FluentAvatar's constructor
  const FluentAvatar({
    required this.child,
    super.key,
    this.isGroup = false,
    this.strokeStyle,
    this.statusPresenceBadge,
    this.cutout,
    this.size,
  }) : assert(
          cutout != null && statusPresenceBadge == null ||
              cutout == null && statusPresenceBadge != null || cutout == null && statusPresenceBadge == null,
          'Cannot have statusPresenceBadge && cutout values',
        );

  // Put it on constructor's initializer, when create image and text
  // properties : assert(image != null || text != null, 'Image and Text
  // cannot be null');

  @override
  Widget build(BuildContext context) {
    assert(
    (cutout == null) || (size?.value == 40 || size?.value == 56),
    'The cutout can only be passed for sizes 40 and 56.',
    );

    return Center(
        child: Stack(
          alignment: const Alignment(1.1, 1.2),
          children: [
            // Avatar
            FluentContainer(
              strokeStyle: strokeStyle,
              width: size?.value ?? 56,
              height: size?.value ?? 56,
              color: const Color(0xFF0BEA87),
              cornerRadius: isGroup != true
                  ? FluentCornerRadius.circle
                  : FluentCornerRadius.large,
              child: Container(
                alignment: Alignment.center,
                child: child,
              ),
            ),

            // Status Presence Badge
            if (statusPresenceBadge != null && cutout == null)
              switch (statusPresenceBadge) {
                StatusPresenceBadge.avaliable => const AvaliablePresenceBadge(),
                StatusPresenceBadge.away => const AwayPresenceBadge(),
                StatusPresenceBadge.blocked => const BlockedPresenceBadge(),
                StatusPresenceBadge.busy => const BusyPresenceBadge(),
                StatusPresenceBadge.dnd => const DNDPresenceBadge(),
                StatusPresenceBadge.offline => const OfflinePresenceBadge(),
                StatusPresenceBadge.oof => const OOFPresenceBadge(),
                StatusPresenceBadge.unknown => const UnknownPresenceBadge(),
                _ => throw Exception('Invalid value in status presence badge')
              },


            // Cutouts
            if (cutout != null &&
                statusPresenceBadge == null &&
                (size?.value == 40 || size?.value == 56))
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(FluentCornerRadius.circle.value),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: FluentColors.neutralBackground5Rest,
                    borderRadius:
                        BorderRadius.circular(FluentCornerRadius.circle.value),
                  ),
                  child: cutout,
                ),
              ),
          ],
        ),
    );
  }
}

// Avatars can have badges, stroke, cutout (avatars at 40 and 56 pixels)
// Both a photo and the initials of a person on a circular background can be used,
// or group may be displayed on a square background.

enum StatusPresenceBadge {
  avaliable,
  away,
  blocked,
  busy,
  dnd,
  offline,
  oof,
  unknown
}
