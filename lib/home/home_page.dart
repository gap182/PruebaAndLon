import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:prueba_and_lond/global_widgets/custom_textfield.dart';
import 'package:prueba_and_lond/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: SafeArea(
            child: LayoutBuilder(
          builder: (_, BoxConstraints constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Completa tu registro",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      keyboard: TextInputType.emailAddress,
                      onChange: (String text) {
                        controller.validation(text, "email");
                      },
                      isWriting: controller.isEmailWriting,
                      icon: Icons.email_outlined,
                      hintText: "Correo electrónico",
                      textController: controller.emailController,
                      isValid: controller.isEmailValid,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      keyboard: TextInputType.name,
                      onChange: (String text) {
                        controller.validation(text, "name");
                      },
                      isWriting:
                          controller.isWriting(controller.nameController.text),
                      icon: Icons.perm_identity,
                      hintText: "Nombre(s)",
                      textController: controller.nameController,
                      isValid: controller.isNameValid,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      keyboard: TextInputType.name,
                      onChange: (String text) {
                        controller.validation(text, "last");
                      },
                      isWriting: controller
                          .isWriting(controller.lastNameController.text),
                      icon: Icons.perm_identity,
                      hintText: "Apellido(s)",
                      textController: controller.lastNameController,
                      isValid: controller.isLastNameValid,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Prefijo"),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Image.asset(
                                                "assets/images/colombia.png")),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                  color: Colors.blue)),
                                          child: const Icon(
                                              Icons.keyboard_arrow_down),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Número de teléfono"),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(color: Colors.grey)),
                                    child: CustomTextField(
                                      isWriting: controller.isWriting(
                                          controller.phoneController.text),
                                      hintText: "",
                                      icon: Icons.phone,
                                      textController:
                                          controller.phoneController,
                                      isValid: controller.isPhoneValid,
                                      keyboard: TextInputType.phone,
                                      onChange: (String text) {
                                        controller.validation(text, "phone");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Tipo de documento"),
                                Expanded(
                                  child: Text(
                                    "Cédula de ciudadanía",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.blue)),
                            child: const Icon(Icons.keyboard_arrow_down),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      keyboard: TextInputType.phone,
                      hintText: 'Número de documento',
                      icon: null,
                      isValid: controller.isIdValid,
                      onChange: (String text) {
                        controller.validation(text, "id");
                      },
                      textController: controller.idController,
                      isWriting:
                          controller.isWriting(controller.idController.text),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              FaIcon(
                                FontAwesomeIcons.gem,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "¿Fuiste referido?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              )
                            ],
                          ),
                          CustomTextField(
                            keyboard: TextInputType.phone,
                            hintText: 'Ingresa código(no obligatorio)',
                            icon: null,
                            isValid: controller.isCodeValid,
                            onChange: (String text) {
                              controller.validation(text, "code");
                            },
                            textController: controller.codeController,
                            isWriting: controller
                                .isWriting(controller.codeController.text),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    bottomOption(
                        size, "Acepto los Términos y condiciones", Colors.blue,
                        () {
                      controller.changeAcceptTerms();
                    }, controller.acceptTerms),
                    const SizedBox(
                      height: 20,
                    ),
                    bottomOption(
                        size, "Acepto el Aviso de Privacidad", Colors.blue, () {
                      controller.changePrivacyTerms();
                    }, controller.acceptPrivacy),
                    const SizedBox(
                      height: 20,
                    ),
                    bottomOption(
                        size,
                        "Acepto el Manual de tratamiento de datos",
                        Colors.blue, () {
                      controller.changeManualTerms();
                    }, controller.acceptManual),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(
                                color: Colors.teal,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        child: const Text('Continuar'),
                        onPressed: () {
                          controller.buttonFunction(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  Container bottomOption(
      Size size, String title, Color color, VoidCallback press, bool accept) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: press,
            child: Container(
              width: size.width * 0.08,
              height: size.width * 0.08,
              decoration: BoxDecoration(
                  color: accept ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
