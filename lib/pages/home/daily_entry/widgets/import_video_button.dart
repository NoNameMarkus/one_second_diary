import 'package:avatar_glow/avatar_glow.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/constants.dart';

class ImportVideoButton extends StatelessWidget {
  const ImportVideoButton({Key? key}) : super(key: key);

  Future<String?> pickVideoFileString() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    return result?.files.single.path;
  }

  @override
  Widget build(BuildContext context) =>AvatarGlow(
    glowColor: AppColors.green,
    endRadius: MediaQuery.of(context).size.height * 0.08,
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          backgroundColor: AppColors.green,
          shape: const CircleBorder(),
        ),
        onPressed: () async {
          String? filePath;
          while(filePath==null){
            filePath=await pickVideoFileString();
          }
          Get.offNamed(
            Routes.SAVE_VIDEO,
            arguments: filePath,
          );
        },
        child: Icon(
          Icons.download,
          color: Colors.white,
          size: MediaQuery.of(context).size.width * 0.1,
        ),
      ),
    ),
  );
}