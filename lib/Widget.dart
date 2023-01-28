import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_project/Bottom%20Navigation%20Screen/Home%20Screen/Home_Screen.dart';
import 'package:code_project/Screen/Login_Screen.dart';
import 'package:code_project/Screen/Setting_Screen.dart';
import 'package:code_project/Screen/SignUp_Screen.dart';
import 'package:code_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

// App Bar
AppBar MyAppBar(
  BuildContext context, {
  Widget? title,
  List<Widget>? actions,
  bool? center,
  Widget? leading,
  bool? border,
  double? height,
  Color? bgColor,
  Color? foreColor,
  double? elevation,
  double? spacing,
}) {
  return AppBar(
    title: title,
    actions: actions,
    centerTitle: center,
    leading: leading,
    toolbarHeight: height,
    backgroundColor: bgColor ?? null,
    // foregroundColor: foreColor ?? Colors.black,
    elevation: elevation ?? 20,
    shadowColor: Colors.black.withOpacity(.25),
    // automaticallyImplyLeading: true,
    shape: border == true
        ? Border(bottom: BorderSide(color: Colors.black, width: .2))
        : null,
    titleSpacing: spacing ?? 0,
    primary: true,
  );
}

// InkWell
Widget MyInkWell({
  required Widget child,
  Function()? onTap,
  Function(TapDownDetails)? onTapDown,
  Function()? onTapCancel,
  Function(bool)? onHover,
  Function()? onLongPress,
  BorderRadius? radius,
}) {
  return InkWell(
    splashFactory: NoSplash.splashFactory,
    child: child,
    onTap: onTap,
    onTapDown: onTapDown,
    onTapCancel: onTapCancel,
    onHover: onHover,
    borderRadius: radius,
    onLongPress: onLongPress,
    focusColor: Colors.black.withOpacity(.25),
    hoverColor: Colors.black.withOpacity(.25),
    splashColor: Colors.black.withOpacity(.25),
    highlightColor: Colors.black.withOpacity(.25),
    overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(.25)),
  );
}

// Product Card
Widget ProductCard(BuildContext context,
    {required Map data, Function()? onTap}) {
  return Material(
    color: primaryColor(context),
    child: MyInkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: data['image'],
              progressIndicatorBuilder: (context, url, progress) {
                return Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Icon(Icons.error);
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  data["name"],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "IDR ${format.format(data['harga'])},",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.25,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: onTap,
    ),
  );
}

// Home Container
Widget HomeContainer({
  required BuildContext context,
  bool? gradient,
  required Widget child,
  Color? bgColor,
  double? width,
  double? height,
}) {
  final settingProv = Provider.of<SettingScreenProvider>(context);

  checkBgColor(bool dark) {
    if (dark != true) {
      return primaryColor(context);
    }
    return null;
  }

  checkGradient(bool gradient, bool dark) {
    if (dark == true) {
      return null;
    } else if (gradient == true) {
      return MyLinearGradient;
    }
    return null;
  }

  return GestureDetector(
    onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: FutureBuilder(
      future: settingProv.readDark(),
      builder: (context, snapshot) {
        return Container(
          height: height ?? MediaQuery.of(context).size.height,
          width: width ?? MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: checkGradient(gradient ?? false, snapshot.data ?? false),
            color: checkBgColor(snapshot.data ?? false),
          ),
          child: child,
        );
      },
    ),
  );
}

class MyTextInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType type;
  final String subtitle;
  final onChanged;
  final secure;
  final enabled;

  MyTextInput({
    Key? key,
    required this.textEditingController,
    required this.type,
    required this.subtitle,
    required this.onChanged(val),
    bool? this.secure,
    bool? this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProv = Provider.of<LoginScreenProvider>(context);
    final signUpProv = Provider.of<SignUpScreenProvider>(context);

    return Stack(
      children: [
        TextFormField(
          enabled: enabled ?? true,
          controller: textEditingController,
          textInputAction: TextInputAction.next,
          style: TextStyle(fontSize: 12),
          keyboardType: type,
          enableSuggestions: true,
          scrollPadding: EdgeInsets.only(bottom: 60),
          inputFormatters: type == "number"
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
            fillColor: Colors.red,
            labelText: subtitle,
            // labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.yellow),
              gapPadding: 5,
            ),
          ),
          obscureText: secure ?? false,
          onChanged: (val) {
            onChanged(val);
          },
          onFieldSubmitted: (aw) {
            FocusScope.of(context).nextFocus();
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Tidak Boleh Kosong...";
            } else {
              return null;
            }
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            padding: EdgeInsets.only(top: 5),
            onPressed: () {
              loginProv.setSecure = !loginProv.isSecure;
              signUpProv.setSecure = !signUpProv.isSecure;
            },
            icon: Icon(Iconsax.eye),
            color: secure != null ? Colors.cyan : Colors.transparent,
          ),
        ),
      ],
    );
  }
}

class MyPrimaryTextButton extends StatelessWidget {
  final String text;
  var padding;
  final Function()? onPressed;
  var elevation;

  MyPrimaryTextButton({
    Key? key,
    required this.text,
    EdgeInsetsGeometry? this.padding,
    required this.onPressed,
    double? this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
        padding: padding ?? EdgeInsets.zero,
        elevation: elevation ?? 5,
      ),
    );
  }
}

class MySecondaryTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  var bgColor;
  var padding;
  var fgColor;
  var elevation;

  MySecondaryTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    Color? this.bgColor,
    Color? this.fgColor,
    EdgeInsetsGeometry? this.padding,
    double? this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 1,
        backgroundColor: bgColor ?? primaryColor(context),
        padding: padding ?? EdgeInsets.zero,
        foregroundColor: fgColor ?? Colors.white,
      ),
    );
  }
}

final MyLinearGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 74, 179, 177),
    Color.fromARGB(255, 210, 255, 254),
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
