import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/pages/home/controller/home_provider.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:image_picker/image_picker.dart';

class MyModalBottomSheet extends StatelessWidget {
  const MyModalBottomSheet({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.only(top: 16.0, bottom: 64.0),
          child: Form(
            key: homeProvider.read.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: texts.homeModalBottom.price),
                  validator: (value) {
                    if (value != null ||
                        value!.isEmpty ||
                        RegExp(r'^[a-zA-Z]*$').hasMatch(value)) {
                      return texts.homeModalBottom.enterValidAmount;
                    }
                    return null;
                  },
                  onChanged: (String str) {
                    if (str.contains(',')) {
                      str = str.replaceAll(RegExp(','), '.');
                    }
                    homeProvider.read.setCurrentPrice(double.parse(str));
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: texts.homeModalBottom.description),
                  onChanged: (String str) {
                    homeProvider.read.setCurrentDetail(str);
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Consumer(builder: (_, ref, __) {
                  final controller =
                      ref.watch(homeProvider.select((_) => _.currentImage));
                  if (controller.currentImage == null) {
                    return MaterialButton(
                      color: AppColorsTheme.kPink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      onPressed: () {
                        homeProvider.read.pickerImage(ImageSource.camera);
                      },
                      padding: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${texts.homeModalBottom.addPhoto}  ',
                            style: TextStyle(
                              color: AppColorsTheme.white,
                            ),
                          ),
                          Icon(
                            Icons.add_a_photo_outlined,
                            color: AppColorsTheme.white,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color: AppColorsTheme.kPink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          onPressed: () {
                            homeProvider.read.pickerImage(ImageSource.camera);
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Text(
                                '${texts.homeModalBottom.editPhoto}  ',
                                style: TextStyle(
                                  color: AppColorsTheme.white,
                                ),
                              ),
                              Icon(
                                Icons.add_a_photo_outlined,
                                color: AppColorsTheme.white,
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage: FileImage(controller.currentImage!),
                        ),
                      ],
                    );
                  }
                }),
                const SizedBox(
                  height: 8.0,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  minWidth: double.infinity,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    texts.homeModalBottom.saveExpense,
                    style: TextStyle(
                      color: AppColorsTheme.white,
                    ),
                  ),
                  onPressed: () async {
                    if (homeProvider.read.currentPrice != 0 ||
                        homeProvider.read.currentImage != null ||
                        homeProvider.read.formKey.currentState!.validate() ||
                        RegExp(r'^[a-zA-Z]*$').hasMatch(
                            homeProvider.read.currentPrice.toString())) {
                      ProgressDialog.show(context);
                      await homeProvider.read.addExpense();
                      router.pop();
                      router.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
