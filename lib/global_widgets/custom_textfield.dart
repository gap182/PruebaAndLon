import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.textController,
      required this.isValid,
      this.isWriting = false,
      required this.onChange,
      this.keyboard = TextInputType.name})
      : super(key: key);

  final IconData? icon;
  final String hintText;
  final TextEditingController textController;
  final bool isValid;
  Function(String s) onChange;
  bool isWriting;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: isWriting ? Colors.white : Colors.grey[300],
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: isWriting ? Colors.blue : Colors.grey,
                )
              : const SizedBox(),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isWriting
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Text(hintText),
                    )
                  : const SizedBox(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: TextField(
                    keyboardType: keyboard,
                    onChanged: onChange,
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ],
          )),
          isValid
              ? Container(
                  alignment: Alignment.center,
                  height: size.width * 0.08,
                  width: size.width * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
