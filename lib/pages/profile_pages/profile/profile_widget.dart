import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:help_desk/components/confirm_logout/confirm_logout_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
    Future<void> logoutUser() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('access_token');

      await Future.delayed(const Duration(milliseconds: 300)); // Smooth UX

      GoRouter.of(appNavigatorKey.currentContext!).goNamed('SignIn');

      ScaffoldMessenger.of(appNavigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('✅ Successfully logged out!'),
        ),
      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Account',
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        actions: [
        IconButton(
          icon: Icon(
            FFIcons.klogout07,
            color: FlutterFlowTheme.of(context).error,
          ),
          onPressed: () async {
            final confirmed = await showModalBottomSheet<bool>(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => const ConfirmLogoutWidget(),
            );

            if (confirmed == true) {
              debugPrint('🚪 User confirmed logout');
              await logoutUser();
            } else {
              debugPrint('❌ User canceled logout');
            }
          },
        ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProfileHeader(context),
              const SizedBox(height: 20),
              _buildModeSwitcher(context),
              const SizedBox(height: 20),
              _buildUpgradeCard(context),
              const SizedBox(height: 20),
              _buildSectionTitle(context, 'Account'),
              _buildAccountList(context),
              const SizedBox(height: 20),
              _buildSectionTitle(context, 'General'),
              _buildGeneralList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1511367461989-f85a21fda167?fit=crop&w=600&q=80',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'User',
          style: FlutterFlowTheme.of(context).titleLarge,
        ),
        Text(
          '',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).secondaryText,
              ),
        ),
      ],
    );
  }

  Widget _buildModeSwitcher(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: FFButtonWidget(
              onPressed: () => setDarkModeSetting(context, ThemeMode.light),
              text: 'Light Mode',
              options: FFButtonOptions(
                height: 45,
                color: Theme.of(context).brightness == Brightness.light
                    ? FlutterFlowTheme.of(context).primaryBackground
                    : FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: FFButtonWidget(
              onPressed: () => setDarkModeSetting(context, ThemeMode.dark),
              text: 'Dark Mode',
              options: FFButtonOptions(
                height: 45,
                color: Theme.of(context).brightness == Brightness.dark
                    ? FlutterFlowTheme.of(context).primaryBackground
                    : FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpgradeCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            FlutterFlowTheme.of(context).secondary
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(FFIcons.kcrown60, size: 48, color: FlutterFlowTheme.of(context).info),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Upgrade to PRO!',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).info,
                        )),
                const SizedBox(height: 4),
                Text('Experience all the benefits without any limitations.',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).info,
                        )),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: FlutterFlowTheme.of(context).info)
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildAccountList(BuildContext context) {
    return _buildSettingsContainer([
      _buildSettingsTile(context, 'Edit Profile', FFIcons.kedit1, EditProfileWidget.routeName),
      _buildSettingsTile(context, 'Security', FFIcons.klock3, SecurityWidget.routeName),
      _buildSettingsTile(context, 'Subscription', FFIcons.kcrown31, SubscriptionWidget.routeName),
    ]);
  }

  Widget _buildGeneralList(BuildContext context) {
    return _buildSettingsContainer([
      _buildSettingsTile(context, 'Notification', FFIcons.knotification1, NotificationSettingsWidget.routeName),
      _buildSettingsTile(context, 'Language', Icons.language, LanguageSettingsWidget.routeName),
    ]);
  }

  Widget _buildSettingsContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, String title, IconData icon, String routeName) {
    return ListTile(
      leading: Icon(icon, color: FlutterFlowTheme.of(context).primaryText),
      title: Text(
        title,
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: FlutterFlowTheme.of(context).primaryText),
      onTap: () => context.pushNamed(routeName),
    );
  }
}
