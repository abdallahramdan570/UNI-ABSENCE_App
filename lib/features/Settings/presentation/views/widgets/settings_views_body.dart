import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_absence/core/routing/app_routes_name.dart';
import 'package:uni_absence/features/Settings/presentation/cubit/app_global_cubit.dart';
import 'package:uni_absence/features/Settings/presentation/cubit/app_flobal_state.dart';

class SettingsViewsBody extends StatelessWidget {
  const SettingsViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم الـ theme الحالي في كل مكان
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
     appBar: AppBar(
  elevation: 0,
  centerTitle: true,
  backgroundColor:
      theme.appBarTheme.backgroundColor ??
      theme.scaffoldBackgroundColor,
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
    onPressed: () => context.go(AppPagesName.kdashboardView),
  ),
  title: FittedBox(
    fit: BoxFit.scaleDown,
    child: Text(
      "Settings",
      style: theme.textTheme.titleLarge?.copyWith(
        fontSize: 20.sp,
      ),
    ),
  ),
),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.04,
                vertical: 20.h,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("ACCOUNT", theme),
                    _buildSettingsCard([
                      _buildListTile(
                        context,
                        Icons.person_outline,
                        "Edit Profile",
                        showArrow: true,
                      ),
                      _buildListTile(
                        context,
                        Icons.email_outlined,
                        "Email",
                        trailingText: "abdallahramdan@570gmail.com",
                      ),
                      _buildListTile(
                        context,
                        Icons.lock_outline,
                        "Password",
                        showArrow: true,
                      ),
                    ], theme),

                    _buildSectionTitle("PREFERENCES", theme),
                    _buildSettingsCard([
                      // 1. الإشعارات
                      BlocBuilder<AppGlobalCubit, SettingsState>(
                        builder: (context, state) {
                          final cubit = context.read<AppGlobalCubit>();
                          return _buildListTile(
                            context,
                            Icons.notifications_none,
                            "Notifications",
                            trailing: Switch(
                              value: cubit.notificationsEnabled,
                              onChanged: (_) => cubit.toggleNotifications(),
                            ),
                          );
                        },
                      ),
                      // 2. الثيم
                      BlocBuilder<AppGlobalCubit, SettingsState>(
                        builder: (context, state) {
                          final cubit = context.read<AppGlobalCubit>();
                          return _buildListTile(
                            context,
                            Icons.dark_mode_outlined,
                            "Dark Mode",
                            trailing: Switch(
                              value: cubit.isDarkMode,
                              onChanged: (_) => cubit.toggleTheme(),
                            ),
                          );
                        },
                      ),
                      _buildListTile(
                        context,
                        Icons.translate,
                        "Language",
                        trailingText: "English",
                        showArrow: true,
                      ),
                    ], theme),

                    _buildSectionTitle("SUPPORT", theme),
                    _buildSettingsCard([
                      _buildListTile(
                        context,
                        Icons.help_outline,
                        "Help Center",
                        showArrow: true,
                      ),
                      _buildListTile(
                        context,
                        Icons.shield_outlined,
                        "Privacy Policy",
                        showArrow: true,
                      ),
                      _buildListTile(
                        context,
                        Icons.info_outline,
                        "About",
                        showArrow: true,
                      ),
                    ], theme),

                    SizedBox(height: 30.h),

                    // Logout
                   SizedBox(
  width: double.infinity,
  height: 52.h,
  child: OutlinedButton.icon(
    onPressed: () {
      context.go(AppPagesName.kdashboardView);
    },
    icon: Icon(
      Icons.logout,
      color: Colors.red,
      size: 22.sp,
    ),
    label: Text(
      "Logout",
      style: TextStyle(
        color: Colors.red,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.red),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  ),
)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h, left: 10.w),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: theme.hintColor,
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children, ThemeData theme) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: theme.dividerColor),
    ),
    child: Column(
      children: [
        for (int i = 0; i < children.length; i++) ...[
          children[i],
          if (i != children.length - 1)
            Divider(
              height: 1,
              indent: 16.w,
              endIndent: 16.w,
            ),
        ],
      ],
    ),
  );
}

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title, {
    Widget? trailing,
    String? trailingText,
    bool showArrow = false,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 22.sp, color: theme.primaryColor),

          SizedBox(width: 14.w),

          Expanded(
            flex: 3,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(width: 8.w),

          if (trailing != null)
            trailing
          else if (trailingText != null)
            Expanded(
              flex: 4,
              child: Text(
                trailingText,
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13.sp, color: theme.hintColor),
              ),
            )
          else if (showArrow)
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: theme.hintColor),
        ],
      ),
    );
  }
}

//   Widget _buildListTile(
//     BuildContext context,
//     IconData icon,
//     String title, {
//     Widget? trailing,
//     String? trailingText,
//     bool showArrow = false,
//   }) {
//     final theme = Theme.of(context);
//     return ListTile(
//       titleAlignment: ListTileTitleAlignment.center,
//       minLeadingWidth: 24.w,
//       horizontalTitleGap: 12.w,

//       leading: Icon(icon, color: theme.primaryColor),
//       title: Text(
//         title,
//         style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15.sp),
//       ),
//       trailing:
//           trailing ??
//           (trailingText != null
//               ? SizedBox(
//                   width: MediaQuery.of(context).size.width * .35,
//                   child: Text(
//                     trailingText,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.end,
//                     style: TextStyle(fontSize: 13.sp),
//                   ),
//                 )
//               : (showArrow
//                     ? Icon(
//                         Icons.arrow_forward_ios,
//                         size: 16,
//                         color: theme.hintColor,
//                       )
//                     : null)),
//     );
//   }
// }
