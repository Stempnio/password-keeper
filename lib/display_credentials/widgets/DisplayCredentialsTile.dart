import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayCredentialsTile extends StatelessWidget {
  const DisplayCredentialsTile({
    Key? key,
    required this.leadingIcon,
    required this.value,
  }) : super(key: key);

  final IconData leadingIcon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(leadingIcon),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          child: const Icon(Icons.copy),
          onTap: () => _copyValueToClipboard(context, value),
        ),
      ],
    );
  }

  void _copyValueToClipboard(BuildContext context, String value) {
    Clipboard.setData(ClipboardData(text: value)).then((_) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text("Value copied to clipboard"),
          ),
        );
    });
  }
}
