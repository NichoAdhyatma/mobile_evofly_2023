import 'package:Evofly/app/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostButton extends StatelessWidget {
  const NewPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 40,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: BaseTheme.shadowColor,
                          ),
                        ),
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Judul"),
                        ),
                        hintText: "Judul Topik",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      minLines: 4,
                      maxLines: 7,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: BaseTheme.shadowColor,
                          ),
                        ),
                        label: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Isi"),
                        ),
                        hintText: "Isi Topik",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add),
          Text("Posting"),
        ],
      ),
    );
  }
}
