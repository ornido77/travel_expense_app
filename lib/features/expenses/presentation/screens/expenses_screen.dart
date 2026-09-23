import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/expenses_provider.dart';
import '../widgets/expense_card.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expensesProvider);
    final authState = ref.watch(authProvider);

    final userName = authState.when(
      data: (user) => user?.name ?? 'Traveler',
      loading: () => 'Traveler',
      error: (_, _) => 'Traveler',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Account',
            position: PopupMenuPosition.under,
            onSelected: (value) {
              if (value == 'logout') {
                ref.read(authProvider.notifier).logout();
                context.go('/login');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(
                      Icons.logout_rounded,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: 12),
                    const Text('Logout'),
                  ],
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 18,
                child: Text(
                  _initials(userName),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(expensesProvider.notifier).refresh(),
        child: expensesAsync.when(
          loading: () => _LoadingState(),
          error: (error, _) => _ErrorState(
            error: error,
            onRetry: () => ref.invalidate(expensesProvider),
          ),
          data: (expenses) =>
              _ExpenseContent(userName: userName, expenses: expenses),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/expenses/add'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Expense'),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));

    if (parts.isEmpty || parts.first.isEmpty) {
      return 'U';
    }

    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }

    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}

class _ExpenseContent extends StatelessWidget {
  final String userName;
  final List expenses;

  const _ExpenseContent({required this.userName, required this.expenses});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final total = expenses.fold<double>(
      0,
      (sum, expense) => sum + expense.amount,
    );

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
      children: [
        // Greeting
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 12, 4, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $userName 👋',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Keep track of your travel expenses.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        // Summary card
        if (expenses.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.secondaryContainer,
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.surface.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.account_balance_wallet_rounded,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Expenses',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '₱${total.toStringAsFixed(2)}',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${expenses.length} '
                  '${expenses.length == 1 ? 'expense' : 'expenses'}',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

        if (expenses.isNotEmpty) ...[
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Expenses',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${expenses.length} total',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          ...expenses.map(
            (expense) => ExpenseCard(
              expense: expense,
              onTap: () => context.go('/expenses/${expense.id}'),
            ),
          ),
        ] else
          const _EmptyState(),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.receipt_long_rounded,
              size: 42,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No expenses yet',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Start tracking your travel expenses by adding your first one.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => context.go('/expenses/add'),
            icon: const Icon(Icons.add_rounded),
            label: const Text('Add Expense'),
          ),
        ],
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 80),
        Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorState({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 80),
        Center(
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.cloud_off_rounded,
              size: 34,
              color: colorScheme.onErrorContainer,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Unable to load expenses',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          error.toString(),
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Try Again'),
          ),
        ),
      ],
    );
  }
}
