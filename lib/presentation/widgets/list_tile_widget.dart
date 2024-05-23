import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

class ListTileWidget extends StatelessWidget {
  
  final String? titleItem,subtitleItem;
  final Widget trailingItem;
  final VoidCallback onTap;
  final Color? tileColor;
  final bool? showSubtitle;
  final double? padding;
  const ListTileWidget({super.key, required this.titleItem, required this.subtitleItem, required this.trailingItem, required this.onTap, this.tileColor, this.showSubtitle=true, this.padding});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: padding!=null?const EdgeInsets.all(10):null,
      tileColor: tileColor,
      title: Text(
        titleItem ?? 'Not found',
        style: context.lm?.copyWith(fontSize: 17),
      ),
      subtitle: showSubtitle!?Text(
        subtitleItem ?? 'Not found',
        style: context.ls?.copyWith(fontSize: 13),
      ):null,
      trailing: trailingItem
    );
  }
}
