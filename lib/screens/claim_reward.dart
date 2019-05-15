import 'package:flutter/material.dart';
import 'package:naija_reporter/utils/custom_menu.dart';
import 'package:naija_reporter/animations/news_reward_coin_animation.dart';

class NaijaReportersClaimReward extends StatefulWidget {

  NaijaReportersClaimReward({Key key, this.category}): super(key: key);

  final String category;

  @override
  _NaijaReportersClaimRewardState createState() => _NaijaReportersClaimRewardState();
}

class _NaijaReportersClaimRewardState extends State<NaijaReportersClaimReward> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  NaijaReportersNewsRewardCoinAnimation _rewardAnimation;

  @override
  void initState() {
    super.initState();
    this._animationController = new AnimationController(vsync: this, duration: Duration(seconds: 9));
    this._animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Size size = MediaQuery.of(context).size;
    this._rewardAnimation = new NaijaReportersNewsRewardCoinAnimation(controller: this._animationController, size: size);
    this._rewardAnimation.translateCoin1.addListener((){setState(() {});});
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 24.0,),
          NaijaReportersCustomMenu(
            menuAnimationController: null,
            showMenuDrawer: null,
            category: this.widget.category,
            details: true,
          ),

          SizedBox(height: 130.0,),

          Container(
            height: 120.0,
            alignment: Alignment.center,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: <Widget>[

                Positioned(
                  top: 10.0,
                  left: this._rewardAnimation.translateCoin1.value.dx,
                  child: Transform.rotate(
                    angle: this._rewardAnimation.rotateCoin1.value,
                    alignment: Alignment.center,
                    origin: Offset(1.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: Image.asset("images/adetunji.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  top: 10.0,
                  left: this._rewardAnimation.translateCoin2.value.dx,
                  child: Transform.rotate(
                    angle: this._rewardAnimation.rotateCoin2.value,
                    alignment: Alignment.center,
                    origin: Offset(1.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: Image.asset("images/adetunji.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8.0,),
          Text("₦1,500.00", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black54.withOpacity(this._rewardAnimation.fadeAmount.value)
            ),
          ),
          SizedBox(height: 3.0,),

          Transform.scale(
            scale: this._rewardAnimation.growText.value.dx,
            origin: Offset(1.0, 1.0),
            child: SizedBox(
              width: ((size.width/2) + 20),
              child: Text("Unlock your reward and get paid for your hard work and effort as a publisher.", style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black45
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
          ,

          SizedBox(height: 10.0,),
          Transform.scale(
            scale: this._rewardAnimation.growButton.value.dx,
            origin: Offset(1.0, 1.0),
            child: Material(
              color: Colors.black,
              elevation: 0.0,
              child: InkWell(
                onTap: (){},
                splashColor: Colors.white70,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                  child: Text("Claim Reward", style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    this._animationController.dispose();
    super.dispose();
  }
}
