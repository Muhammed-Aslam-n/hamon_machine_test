import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

class ListTileWidget extends StatelessWidget {
  final String? titleItem,subtitleItem,trailingItem;
  final VoidCallback onTap;
  const ListTileWidget({super.key, required this.titleItem, required this.subtitleItem, required this.trailingItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        titleItem ?? 'Not found',
        style: context.lm?.copyWith(fontSize: 17),
      ),
      subtitle: Text(
        subtitleItem ?? 'Not found',
        style: context.ls?.copyWith(fontSize: 13),
      ),
      trailing: Text(
        trailingItem??'Not found',
        style: context.lm?.copyWith(fontSize: 17),
      ),
    );
  }
}
