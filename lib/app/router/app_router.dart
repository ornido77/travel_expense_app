import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/expenses/presentation/screens/add_expense_screen.dart';
import '../../features/expenses/presentation/screens/expense_detail_screen.dart';
import '../../features/expenses/presentation/screens/expenses_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          path: '/expenses',
          builder: (context, state) => const ExpensesScreen(),
          routes: [
            GoRoute(
              path: 'add',
              builder: (context, state) => const AddExpenseScreen(),
            ),
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;

                return ExpenseDetailScreen(expenseId: id);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
