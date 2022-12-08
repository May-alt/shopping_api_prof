import 'package:flutter/material.dart';
import 'package:shopping_api_prof/layout/constants/const_colors.dart';
import 'package:shopping_api_prof/layout/reusibale_widgets/reus_app_widgets.dart';
import 'package:shopping_api_prof/modules/ui/screnns/authentification/login/login.dart';
import 'package:shopping_api_prof/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingMod {
  final String title;
  final String subtitle;
  final String img;

  OnBordingMod({
    required this.title,
    required this.subtitle,
    required this.img,
  });
}

class OnBordingScrenn extends StatefulWidget {
  OnBordingScrenn({Key? key}) : super(key: key);

  @override
  State<OnBordingScrenn> createState() => _OnBordingScrennState();
}

class _OnBordingScrennState extends State<OnBordingScrenn> {
  List<OnBordingMod> onbordinmod = [
    OnBordingMod(
        title: "welcom TextTitle",
        subtitle: "welcom SubTitle",
        img: "assets/onbording/bording1.png"),
    OnBordingMod(
        title: "welcom TextTitle",
        subtitle: "welcom SubTitle",
        img: "assets/onbording/bording2.png"),
    OnBordingMod(
        title: "welcom TextTitle",
        subtitle: "welcom SubTitle",
        img: "assets/onbording/bording3.png"),
  ];

  var BordingController = PageController();

  bool isLast = false;

void submit(){
  Cachehelper.saveData(key: 'onBording', value: true).then((value) {
    NavToAndRemove(context, LoginScrenn());
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        actions: [
          TextButton(
            onPressed:submit,
            child: Text(
              "SKIP".toUpperCase(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 120, left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return BuildOnBordingPage(onbordinmod[index]);
                },
                onPageChanged: (int index){
                  if(index == onbordinmod.length -1)
                  {
                    print("last");
                  setState(() {
                    isLast = true;
                  });
                  }
                  else
                  {
                    print("not last");
                   setState(() {
                     isLast = false;
                   });
                  }
                },
                itemCount: onbordinmod.length,
                controller: BordingController,
              ),
            ),

            Row(
              children: [
                SmoothPageIndicator(
                  controller: BordingController,
                  count: onbordinmod.length,
                  effect: JumpingDotEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColors,
                  ),
                ),
                Spacer(),

                FloatingActionButton(
                  backgroundColor: defaultColors,
                    onPressed: (){
                    if(isLast){
                      // print("object");
                      submit();
                    }
                    else{
                      BordingController.nextPage(duration: Duration(milliseconds: 650), curve: Curves.decelerate);
                    }
                    },
                  child: Center(
                    child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }

  BuildOnBordingPage(OnBordingMod bord) => Column(
        children: [
          Image.asset(bord.img),
          Text(bord.title),
          Text(bord.subtitle),
        ],
      );
}
