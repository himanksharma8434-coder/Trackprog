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
                  ...program.blocks.map((block) => _buildBlockCard(context, block)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Add Block'),
                    onPressed: () {
                      _showAddBlockDialog(context);
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

  Widget _buildBlockCard(BuildContext context, ProgramBlock block) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(block.name, style: AppTypography.h4),
            Text('${block.weeks} Weeks', style: AppTypography.bodyM.copyWith(color: AppColors.textSecondary)),
            const SizedBox(height: 16),
            ...block.sessions.map((s) => ListTile(
              title: Text(s.name, style: AppTypography.bodyL),
              subtitle: Text('Day ${s.dayOfWeek}', style: AppTypography.bodyS),
              trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => BlocProvider.value(
                      value: context.read<ProgramBuilderBloc>(),
                      child: SessionBuilderScreen(
                        blockId: block.id,
                        sessionId: s.id,
                      ),
                    ),
                  ),
                );
              },
            )),
            TextButton.icon(
              icon: const Icon(Icons.add, color: AppColors.primary),
              label: Text('Add Session', style: AppTypography.bodyM.copyWith(color: AppColors.primary)),
              onPressed: () {
                context.read<ProgramBuilderBloc>().add(
                  AddSessionToBlock(block.id, 'New Session', block.sessions.length + 1)
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _showAddBlockDialog(BuildContext context) {
    final bloc = context.read<ProgramBuilderBloc>();
    showDialog(
      context: context,
      builder: (ctx) {
        String name = '';
        int weeks = 4;
        return AlertDialog(
          backgroundColor: AppColors.surface,
          title: Text('Add Block', style: AppTypography.h3),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Block Name'),
                onChanged: (v) => name = v,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Weeks'),
                keyboardType: TextInputType.number,
                onChanged: (v) => weeks = int.tryParse(v) ?? 4,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  bloc.add(AddBlock(name, BlockType.custom, weeks));
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
