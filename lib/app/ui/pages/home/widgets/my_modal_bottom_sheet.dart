
import 'package:finance_app/app/ui/pages/home/controller/home_provider.dart';
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
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(hintText: 'Price'),
                  validator: (value) {
                    if (value != null ||
                        value!.isEmpty ||
                        RegExp(r'^[a-zA-Z]*$').hasMatch(value)) {
                      return 'Ingrese un monto válido';
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
                  decoration: const InputDecoration(hintText: 'Description'),
                  onChanged: (String str) {
                    homeProvider.read.setCurrentDetail(str);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Consumer(builder: (_, ref, __) {
                  final controller =
                      ref.watch(homeProvider.select((_) => _.currentImage));
                  if(controller.currentImage == null){
                    return MaterialButton(
                      color: Colors.grey[350],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                        onPressed: () {
                          homeProvider.read.pickerImage(ImageSource.camera);
                        },
                        padding: EdgeInsets.zero,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Add photo  ',
                            style: TextStyle(color: Colors.white),),
                            Icon(Icons.add_a_photo_outlined, color: Colors.white,),
                          ],
                        ),
                      );
                  }
                  else
                  {
                    return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              color: Colors.grey[350],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              onPressed: () {
                                homeProvider.read
                                    .pickerImage(ImageSource.camera);
                              },
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                children: const [
                                  Text('Edit photo  ',
                                  style: TextStyle(color: Colors.white),),
                                  Icon(Icons.add_a_photo_outlined, color: Colors.white,),
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
                  child: const Text(
                    'Save expense',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (homeProvider.read.currentPrice != 0 ||
                        homeProvider.read.currentImage != null ||
                        homeProvider.read.formKey.currentState!.validate() ||
                        RegExp(r'^[a-zA-Z]*$').hasMatch(
                            homeProvider.read.currentPrice.toString())) {
                      homeProvider.read.addExpense();
                      Navigator.pop(context);
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
