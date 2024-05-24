import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/widgets/toast.dart';

/// Widget to share invite to others

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  final String inviteLink = '';

  void shareInviteLink(BuildContext context) {
    showToast(context, 'Feature coming soon...', info: true);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: width * 0.1,
            ),
            Text(
              'Invite Friends',
              style: context.tl,
            ),
            SizedBox(
              height: width * 0.1,
            ),
            const Text(
              'Discover the easiness of logging academic logs together! Share the excitement of exclusive features, endless improvements, and unbeatable discounts with your friends. Invite them to join our Academy community and unlock amazing rewards for both you and your friends. With a plethora of options and fantastic savings, together, we can redefine the academic experience. Start the trend and spread the joy of managing academics with friends today!',
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                shareInviteLink(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: const Text('Share Invite Link'),
            ),
          ],
        ),
      ),
    );
  }
}
