import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/base_dialog.dart';

class ExitDialog extends StatefulWidget {
  const ExitDialog({super.key});

  @override
  State<ExitDialog> createState() => _ExitDialogState();
}

class _ExitDialogState extends State<ExitDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: '提示',
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          '您确定退出登录吗？',
          style: TextStyle(fontSize: 16),
        ),
      ),
      onPressed: () {
        debugPrint('退出了');
      },
    );
  }
}
