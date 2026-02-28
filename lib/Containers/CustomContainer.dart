import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.title,
    this.subtitle,   // nullable
    required this.isDone,
  });

  final String title;
  final String? subtitle;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Checkbox
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: isDone ? const Color(0xff15B86C) : Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.black38),
            ),
            child: isDone
                ? const Icon(Icons.check, size: 18, color: Colors.white)
                : null,
          ),

          const SizedBox(width: 12),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                if (subtitle != null) ...[
                  const SizedBox(height: 5),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black26,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // 3 dots
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black54),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text("Edit")),
              const PopupMenuItem(value: 2, child: Text("Delete")),
            ],
          ),
        ],
      ),
    );
  }
}