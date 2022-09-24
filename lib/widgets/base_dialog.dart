import 'package:flutter/material.dart';
import 'package:flutter_starter/common/constants/constants.dart';
import 'package:flutter_starter/common/router/navigator.dart';
import 'package:flutter_starter/widgets/my_button.dart';

class BaseDialog extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool hiddenTitle;
  final VoidCallback? onPressed;

  const BaseDialog({
    super.key,
    this.title,
    this.hiddenTitle = false,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Widget dialogTitle = Visibility(
      visible: !hiddenTitle,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          hiddenTitle ? '' : title ?? '',
          style: ConstantText.textBold18,
        ),
      ),
    );
    final Widget bottomButton = Row(
      children: <Widget>[
        DialogButton(
          text: '取消',
          textColor: ConstantColor.textSecondary,
          onPressed: () => AppNavigator.goBack(context),
        ),
        const SizedBox(
          height: 48,
          width: 0.6,
          child: VerticalDivider(),
        ),
        DialogButton(
          text: '确定',
          textColor: Theme.of(context).primaryColor,
          onPressed: onPressed,
        ),
      ],
    );
    final Widget content = Material(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppGap.h24,
          dialogTitle,
          Flexible(child: child),
          AppGap.h8,
          bottomButton,
        ],
      ),
    );
    final Widget body = MediaQuery.removeViewInsets(
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      context: context,
      child: Center(
        child: SizedBox(
          width: 270,
          child: content,
        ),
      ),
    );
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInCubic,
      child: body,
    );
  }
}

class DialogButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;

  const DialogButton({
    super.key,
    required this.text,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MyButton(
        text: text,
        onPressed: onPressed,
        textColor: textColor,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
