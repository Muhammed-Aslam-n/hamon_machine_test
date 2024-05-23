import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

class ListTileWidget extends StatelessWidget {
  final String? titleItem,subtitleItem;
  final Widget trailingItem;
  final VoidCallback onTap;
  final Color? tileColor;
  const ListTileWidget({super.key, required this.titleItem, required this.subtitleItem, required this.trailingItem, required this.onTap, this.tileColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: tileColor,
      title: Text(
        titleItem ?? 'Not found',
        style: context.lm?.copyWith(fontSize: 17),
      ),
      subtitle: Text(
        subtitleItem ?? 'Not found',
        style: context.ls?.copyWith(fontSize: 13),
      ),
      trailing: trailingItem
    );
  }
}
