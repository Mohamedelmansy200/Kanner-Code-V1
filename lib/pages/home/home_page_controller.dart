import 'dart:io';

import 'home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'models/project.dart';
import 'widgets/projects_category_dialog/projects_category_dialog.dart';

class HomePageController extends GetxController {
  static const Map<ProjectCategory, List<Project>> _projects = {
    ProjectCategory.games: <Project>[
      Project(
        name: 'Memory',
        icon: 'memory.png',
        path: 'memory',
      ),
      Project(
        name: 'Expressions',
        icon: 'expressions.png',
        path: 'expressions',
      ),
      Project(
        name: 'Puzzles',
        icon: 'puzzles.png',
        path: 'puzzles',
      ),
    ],
    ProjectCategory.education: <Project>[
      Project(
        name: 'Maths',
        icon: 'maths.jpeg',
        path: 'maths',
      ),
      Project(
        name: 'حروفي',
        icon: 'arabic_alphabet.png',
        path: 'arabic_alphabet',
      ),
      Project(
        name: 'Alphabet',
        icon: 'alphabet.png',
        path: 'alphabet',
      ),
      Project(
        name: 'Colors',
        icon: 'colors.png',
        path: 'colors',
      ),
      Project(
        name: 'Numbers',
        icon: 'numbers.png',
        path: 'numbers',
      ),
    ],
    ProjectCategory.entertainment: <Project>[
      Project(
        name: 'Music Therapy',
        icon: 'music.jpeg',
        path: 'music_therapy',
      ),
      Project(
        name: 'Social Stories',
        icon: 'social_stories.png',
        path: 'social_stories',
      ),
    ],
  };

  void openCategoryDialog(ProjectCategory category) {
    Get.dialog(
      ProjectsCategoryDialog(
        projects: _projects[category]!,
        onProjectTap: runProject,
      ),
    );
  }

  Future<void> runProject(Project project) async {
    try {
      Get.until((_) => !Get.isOverlaysOpen);
      final String slash = Platform.isWindows ? '\\' : '/';
      final String executablePath = '${project.path}$slash${project.path}';
      final String script = Platform.isWindows ? 'C:\\Users\\mikea\\OneDrive\\Desktop\\$executablePath.exe' : './${project.path}';
      await Process.run(
        script,
        [],
        workingDirectory: Platform.isLinux ? '/apps/${project.path}' : null,
      );
    } catch (e) {
      debugPrint('[BUG] Failed to run project: $e');
    }
  }
}
