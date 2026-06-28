import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../domain/entities/program.dart';
import '../../../../core/di/injection.dart';
import '../../../../domain/repositories/program_repository.dart';

class ProgramsTab extends StatefulWidget {
  const ProgramsTab({super.key});

  @override
  State<ProgramsTab> createState() => _ProgramsTabState();
}

class _ProgramsTabState extends State<ProgramsTab> {
  final _programRepo = getIt<ProgramRepository>();
  List<Program> _programs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPrograms();
  }

  Future<void> _loadPrograms() async {
    final programs = await _programRepo.getAllPrograms();
    setState(() {
      _programs = programs;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Routines', style: AppTypography.h2),
        elevation: 0,
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ..._programs.map((p) => Card(
                color: AppColors.surface,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: AppColors.border),
                ),
                child: ListTile(
                  title: Text(p.name, style: AppTypography.h4),
                  subtitle: Text('${p.days.length} days', style: AppTypography.bodyS.copyWith(color: AppColors.textSecondary)),
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
                  onTap: () {
                    // Open program view/edit (not implemented yet, but we have builder)
                  },
                ),
              )),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Create New Routine'),
                onPressed: () async {
                  await context.push('/program-builder');
                  _loadPrograms(); // reload after returning
                },
              )
            ],
          ),
    );
  }
}
