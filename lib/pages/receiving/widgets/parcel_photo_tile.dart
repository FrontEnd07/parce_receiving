import 'dart:io';

import 'package:flutter/material.dart';

class ParcelPhotoTile extends StatelessWidget {
  const ParcelPhotoTile({
    super.key,
    required this.path,
    required this.onPressed,
  });
  final String? path;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: path == null
          ? const Icon(Icons.camera_alt_outlined)
          : ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(path!),
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
      title: Text(path == null ? 'Фото посылки' : 'Фото добавлено'),
      trailing: FilledButton.tonal(
        onPressed: onPressed,
        child: Text(path == null ? 'Снять' : 'Переснять'),
      ),
    ),
  );
}
