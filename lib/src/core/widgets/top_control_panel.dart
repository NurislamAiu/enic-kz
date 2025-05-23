import 'package:flutter/material.dart';

class TopControlPanel extends StatelessWidget {
  final Widget? trailing;
  final String selectedLanguage;
  final ValueChanged<String> onLanguageChanged;

  const TopControlPanel({
    super.key,
    this.trailing,
    required this.selectedLanguage,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    const brandColor = Color(0xFF1F327D);
    const langOptions = ['KZ', 'RU', 'EN'];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      child: Row(
        children: [
          const Text(
            'ENIC - KAZAKHSTAN',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: brandColor,
              letterSpacing: 0.8,
            ),
          ),
          const Spacer(),
          Row(
            children: langOptions.map((lang) {
              final isSelected = lang == selectedLanguage;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isSelected ? brandColor : Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () => onLanguageChanged(lang),
                  child: Text(
                    lang,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: isSelected ? Colors.white : brandColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 24),
            trailing!,
          ],
        ],
      ),
    );
  }
}