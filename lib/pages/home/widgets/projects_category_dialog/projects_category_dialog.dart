import '../../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../models/project.dart';
import 'widgets/project_card.dart';

class ProjectsCategoryDialog extends StatelessWidget {
  final List<Project> projects;
  final Function(Project) onProjectTap;

  const ProjectsCategoryDialog({
    required this.projects,
    required this.onProjectTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: projects.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (_, index) => ProjectCard(
              project: projects[index],
              onTap: () => onProjectTap(projects[index]),
            ),
          ),
        ),
      ),
    );
  }
}
