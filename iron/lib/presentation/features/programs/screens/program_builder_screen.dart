import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../bloc/program_builder_bloc.dart';
import '../bloc/program_builder_event.dart';
import '../bloc/program_builder_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/program.dart';
import 'session_builder_screen.dart';

class ProgramBuilderScreen extends StatelessWidget {
  const ProgramBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProgramBuilderBloc>()..add(StartProgramBuilder()),
      child: BlocConsumer<ProgramBuilderBloc, ProgramBuilderState>(
        listener: (context, state) {
          if (state is ProgramBuilderSaved) {
            context.pop();
          }
        },
        builder: (context, state) {
          if (state is ProgramBuilderInitial) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state is ProgramBuilderEditing) {
            final program = state.program;
            return Scaffold(
              backgroundColor: AppColors.background,
              appBar: AppBar(
                backgroundColor: AppColors.background,
                title: Text(program.name, style: AppTypography.h3),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<ProgramBuilderBloc>().add(SaveProgram());
                    },
                    child: Text('Save', style: AppTypography.h4.copyWith(color: AppColors.primary)),
                  ),
                ],
              ),
              body: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ...program.days.map((day) => _buildDayCard(context, day)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Day'),
                    onPressed: () {
                      _showAddDayDialog(context);
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildDayCard(BuildContext context, ProgramDay day) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(day.name, style: AppTypography.h3),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('${day.exercises.length} Exercises', style: AppTypography.bodyM.copyWith(color: AppColors.textSecondary)),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => BlocProvider.value(
                value: context.read<ProgramBuilderBloc>(),
                child: SessionBuilderScreen(
                  dayId: day.id,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddDayDialog(BuildContext context) {
    final bloc = context.read<ProgramBuilderBloc>();
    showDialog(
      context: context,
      builder: (ctx) {
        String name = '';
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: const BorderSide(color: AppColors.border, width: 1)),
          title: Text('Add Day', style: AppTypography.h3),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Day Name (e.g., Push Day)'),
            onChanged: (v) => name = v,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  bloc.add(AddDay(name));
                  Navigator.pop(ctx);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
