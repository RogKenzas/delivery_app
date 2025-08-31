import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed/theme/design_system.dart';

class UserProfileHeader extends StatelessWidget {
  final String userName;
  final String userDate;
  final String? avatarUrl;
  final VoidCallback? onMenuTap;

  const UserProfileHeader({
    super.key,
    required this.userName,
    required this.userDate,
    this.avatarUrl,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD), // Bleu clair comme dans l'image
              shape: BoxShape.circle,
            ),
            child:
                avatarUrl != null
                    ? ClipOval(
                      child: Image.network(
                        avatarUrl!,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (_, __, ___) => const Icon(
                              CupertinoIcons.person_fill,
                              color: Color(0xFF1976D2),
                              size: 24,
                            ),
                      ),
                    )
                    : const Icon(
                      CupertinoIcons.person_fill,
                      color: Color(0xFF1976D2),
                      size: 24,
                    ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutralBlack,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  userDate,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (onMenuTap != null)
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(
                CupertinoIcons.ellipsis_vertical,
                color: AppColors.neutralBlack,
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            ),
        ],
      ),
    );
  }
}
