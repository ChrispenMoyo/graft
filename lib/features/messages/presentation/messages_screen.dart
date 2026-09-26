// GRAFT Messages Screen
// Conversations between customers and workers (spec §13). Messaging
// infrastructure lands in a later batch (spec §26), so this screen
// carries an intentional empty state that explains what will appear
// here and what the user can do meanwhile - no fake conversations.

import 'package:flutter/material.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/graft_logo.dart';

/// Messages screen, shared by the customer and worker shells.
class MessagesScreen extends StatelessWidget {
  /// True when shown inside the worker shell - copy and CTA adapt
  final bool isWorker;

  /// Shown when the worker has no conversations yet ("Find Nearby Jobs")
  final VoidCallback? onFindWork;

  /// Shown when the customer has no conversations yet ("Post a Job")
  final VoidCallback? onPostJob;

  const MessagesScreen({
    super.key,
    this.isWorker = false,
    this.onFindWork,
    this.onPostJob,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const GraftLogo(
          size: 24,
          color: GraftColors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: isWorker
              ? EmptyState(
                  title: 'No messages yet',
                  description:
                      'When a customer contacts you about a job, your conversations will appear here.',
                  icon: Icons.chat_bubble_outline,
                  onAction: onFindWork,
                  actionButtonText:
                      onFindWork != null ? 'Find Nearby Jobs' : null,
                )
              : EmptyState(
                  title: 'No messages yet',
                  description:
                      'When a worker responds to one of your jobs, your conversations will appear here.',
                  icon: Icons.chat_bubble_outline,
                  onAction: onPostJob,
                  actionButtonText: onPostJob != null ? 'Post a Job' : null,
                ),
        ),
      ),
    );
  }
}
