import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:organaki_app/core/colors_app.dart';
import 'package:organaki_app/core/extensions.dart';
import 'package:organaki_app/modules/authentication/bloc/login_auth_bloc/login_auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  //set variables here
  //like  // int age = 20;
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginAuthBloc, LoginAuthState>(
      listener: (context, state) {
        if (state is LoginAuthSuccess) {
          print("deu bom");
        }
        if (state is LoginAuthFailure) {
          print("deu ruim");
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: 124.0,
                    height: 124.0,
                    margin: const EdgeInsets.only(top: 75, bottom: 20),
                    decoration: BoxDecoration(
                      color: ColorApp.blue5,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 28, right: 5),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/placeholder.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Entre em sua conta',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      color: ColorApp.dark1,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 28, right: 150, bottom: 5),
                child: SizedBox(
                  width: 170.0,
                  height: 25.0,
                  child: Text(
                    'Email',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorApp.dark1,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                    ),
                  ),
                ),
              ),
              Container(
                width: 350.0,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorApp.white4,
                    borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: InputBorder.none,
                      hintText: "Insira seu email",
                      hintStyle: TextStyle(
                        color: ColorApp.grey3,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, right: 150, bottom: 5),
                child: SizedBox(
                  width: 170.0,
                  height: 25.0,
                  child: Text(
                    'Senha',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorApp.dark1,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                    ),
                  ),
                ),
              ),
              Container(
                width: 350.0,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorApp.white4,
                    borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: InputBorder.none,
                      hintText: "Insira sua senha",
                      hintStyle: TextStyle(
                        color: ColorApp.grey3,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Abhaya Libre',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: Text(
                  'Esqueci minha senha',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: ColorApp.blue4,
                    fontSize: 17,
                    height: 2.9,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Abhaya Libre',
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30),
                width: 348,
                height: 58,
                child: FilledButton(
                  onPressed: () => BlocProvider.of<LoginAuthBloc>(context)
                      .add(LoginAuthStart("username", "passoword")),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      ColorApp.blue3,
                    ),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: BlocBuilder<LoginAuthBloc, LoginAuthState>(
                    builder: (context, state) {
                      if (state is LoginAuthProgress) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorApp.white1,
                          ),
                        );
                      }
                      return Text(
                        "Faça login",
                        style: TextStyle(
                          color: ColorApp.white1,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Abhaya Libre',
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: ColorApp.grey4,
                      indent: 30,
                      thickness: 0.7,
                      endIndent: 3,
                    ),
                  ),
                  10.sizeW,
                  const Text(
                    "Ou",
                    style: TextStyle(
                      fontFamily: 'Abhaya Libre',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  10.sizeW,
                  Expanded(
                    child: Divider(
                      color: ColorApp.grey4,
                      endIndent: 30,
                      indent: 3,
                      thickness: 0.7,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(30),
                width: 348,
                height: 58,
                child: FilledButton(
                  onPressed: () {
                    //button´s function
                    context.push("/register");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      ColorApp.blue1,
                    ),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(
                      color: ColorApp.dark2,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Abhaya Libre',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
