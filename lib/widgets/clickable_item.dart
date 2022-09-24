import 'package:flutter/material.dart';
import 'package:flutter_starter/common/constants/constants.dart';

class ClickableItem extends StatelessWidget {
  final String title;
  final String content;
  final int maxLines;
  final TextAlign textAlign;
  final GestureTapCallback? onTap;

  const ClickableItem({
    super.key,
    required this.title,
    this.content = '',
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      crossAxisAlignment:
          maxLines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        Text(title),
        const Spacer(),
        AppGap.w16,
        Expanded(
          flex: 4,
          child: Text(
            content,
            maxLines: maxLines,
            textAlign: maxLines == 1 ? TextAlign.right : textAlign,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 14),
          ),
        ),
        AppGap.w8,
        Opacity(
          opacity: onTap == null ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(top: maxLines == 1 ? 0 : 2),
            child: Image.asset(
              'assets/images/icon/right.png',
              width: 16,
              height: 16,
            ),
          ),
        ),
      ],
    );
    child = Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
      constraints: const BoxConstraints(minHeight: 50),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        ),
      ),
      child: child,
    );
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
