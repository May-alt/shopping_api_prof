import 'package:flutter/material.dart';
import 'package:shopping_api_prof/layout/constants/const_colors.dart';

NavToAndRemove(context, Widget) => Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) {
          return Widget;
        },
      ),
      (route) => false,
    );

NavToAotherPage(context, Widget) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Widget;
        },
      ),
    );

Widget ReusPaddingAll({
  required Widget? child,
}) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: child,
    );

Widget ReusPaddingSym({
  required Widget? child,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 120.0, horizontal: 20.0),
      child: child,
    );

//For Form Section

Widget ReusText(context, {required String text,required TextStyle?style})
=> Text(
      text,
      style:style,
    );

Widget ReusRowTextLink(
  {
  required String text,
  required String textbtn,
    required TextStyle? style,
  required void Function()? onPressed,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: style,),
        TextButton(child: Text(textbtn), onPressed: onPressed),
      ],
    );

Widget ReusTextFormFilde({
  required TextEditingController? controller,
  required Widget? label,
  required Icon prefixIcon,
  required TextStyle? labelStyle,
  void Function()? presedIcon,
  Color? iconsColor,
  IconData? suffix,
  required TextInputType? keyboardType,
  bool obscureText = false,
  required String? Function(String?)? validator,
 void Function()? onTap,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onTap: onTap,
      decoration: InputDecoration(
        label: label,

        prefixIcon: prefixIcon,

        suffixIcon: IconButton(
          onPressed: presedIcon,
          icon: Icon(
            suffix,
            color: iconsColor,
          ),
        ),

        labelStyle: labelStyle,

        contentPadding: EdgeInsets.all(20.0),
        //outline Border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(05.0),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        //Focuse Border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(05.0),
          borderSide: BorderSide(
            width: 1,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(05.0),
          borderSide: BorderSide(
            width: 1,
          ),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(05.0),
          borderSide: BorderSide(
            width: 1,
          ),
        ),

      ),
    );

Widget ResuButton({
  required void Function()? onPressed,
  required String childText,
  double? width = double.infinity,
}) =>
    InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: width,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(08.0),
        ),
        child: Center(
          child: Text(
            childText,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 26,
                letterSpacing: 2.0),
          ),
        ),
      ),
    );



Widget ReusTextTitle ({
  required String text,
  TextStyle? style,

})
=> Padding(padding: EdgeInsets.only(left: 20.0),
child: Text(text,
     style:style ,
),
);


Widget ReusCardListTile({
   void Function()? onTap,
  required String text,
   void Function()? onPressedBtn,
  IconData? iconleading,
  required IconData? icon,
  TextStyle? style,
}) =>
    ListTile(
      style: ListTileStyle.list,
      onTap: onTap,
      title: Text(
        text,
        style: style,
      ),
      // title: Text("Theme Dark"),
      leading: Icon(icon),
      iconColor: Colors.teal,
      // trailing: IconButton(
      //   onPressed: onPressedBtn,
      //   icon: Icon(iconleading),
      // ),
    );