import 'package:fb_auth_provider/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

import '../providers/profile/profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileProvider profileProvider;

  @override
  void initState() {
    super.initState();
    profileProvider = context.read<ProfileProvider>();
    profileProvider.addListener(errorDialogListener);
    _getProfile();
  }

  @override
  void dispose() {
    super.dispose();
    profileProvider.removeListener(errorDialogListener);
  }

  void errorDialogListener() {
    if (profileProvider.state.profileStatus == ProfileStatus.error) {
      errorDialog(
        context,
        profileProvider.state.customError,
      );
    }
  }

  void _getProfile() {
    final String uid = context.read<fbAuth.User?>()!.uid;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().getProfile(
            uid: uid,
          );
    });
  }

  Widget _buildProfile() {
    fin
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _getProfile(),
    );
  }
}
