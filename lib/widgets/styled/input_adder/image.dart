import 'package:Organiser/widgets/shared/input/description.dart';
import 'package:Organiser/widgets/shared/input/buttons.dart';
import 'package:flutter/material.dart';

class ImageAdder extends StatelessWidget {
  final String imageUrlController;

  ImageAdder({required this.imageUrlController});

  // Future<void> _pickImage() async {
  //   XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() {
  //       imageUrlController = image as PickedFile?;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return StyledButtons.primaryElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            DialogRoute(
                context: context,
                builder: (context) => DescriptionEditorPage()));
      },
      text: 'Image',
      icon: Icons.edit_document,
      context: context,
      verticalPadding: 0,
    );
  }
}