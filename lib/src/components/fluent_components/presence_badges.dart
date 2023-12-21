import 'package:flutter/material.dart';
import 'package:gbt_fluent2_ui/gbt_fluent2_ui.dart';


class AvaliablePresenceBadge extends StatelessWidget {
  const AvaliablePresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(3),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
          color: Colors.green.shade600,
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}

class AwayPresenceBadge extends StatelessWidget {
  const AwayPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
        ),
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.access_time_filled_outlined,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class BlockedPresenceBadge extends StatelessWidget {
  const BlockedPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
          color: Colors.red,
        ),
        child: const Icon(
          Icons.block,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class BusyPresenceBadge extends StatelessWidget {
  const BusyPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
        ),
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.circle,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class DNDPresenceBadge extends StatelessWidget {
  const DNDPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
        ),
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.minimize_rounded,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class OfflinePresenceBadge extends StatelessWidget {
  const OfflinePresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
        ),
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.cancel_outlined,
            color: FluentColors.neutralForeground3Rest,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class OOFPresenceBadge extends StatelessWidget {
  const OOFPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
        ),
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.keyboard_backspace_rounded,
            color: Colors.purple,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class UnknownPresenceBadge extends StatelessWidget {
  const UnknownPresenceBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
      ),
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(FluentCornerRadius.circle.value),
        ),
        child: const Padding(
          padding: EdgeInsets.all(3),
          child: Icon(
            Icons.circle_outlined,
            color: FluentColors.neutralForeground3Rest,
            size: 15,
          ),
        ),
      ),
    );
  }
}
