import 'package:flutter/material.dart';
import 'package:naija_reporter/animations/news_publishing_animation.dart';
import 'package:naija_reporter/blocs/nr_news_stream.dart';
import 'package:naija_reporter/models/news_category.dart';

class NaijaReportersNewsPublishing extends StatefulWidget {
  @override
  _NaijaReportersNewsPublishingState createState() => _NaijaReportersNewsPublishingState();
}

class _NaijaReportersNewsPublishingState extends State<NaijaReportersNewsPublishing> with TickerProviderStateMixin{

  final List<AnimationController> _animationControllerList = new List<AnimationController>();
  final List
      <NaijaReportersNewsPublishingAnimationPhase2>
      _newsPublishingAnimationPhases =
      new List<NaijaReportersNewsPublishingAnimationPhase2>();


  NaijaReportersNewsPublishingAnimationPhase1 _newsPublishingAnimationPhase1;
  final Map<String, bool> phases = new Map<String, bool>();
  final List<FocusNode> focusNodes = new List<FocusNode>();

  @override
  void initState() {
    super.initState();
    phases.addAll({"phase1": false, "phase2": false, "phase3": false, "phase4": false, "phase5": false});

    _animationControllerList.addAll([
        new AnimationController(vsync: this, duration: Duration(seconds: 8)),
        new AnimationController(vsync: this, duration: Duration(seconds: 8)),
        new AnimationController(vsync: this, duration: Duration(seconds: 8)),
        new AnimationController(vsync: this, duration: Duration(seconds: 8)),
        new AnimationController(vsync: this, duration: Duration(seconds: 8)),
    ]);

    _newsPublishingAnimationPhases.addAll([
        new NaijaReportersNewsPublishingAnimationPhase2(controller: _animationControllerList[1]),
        new NaijaReportersNewsPublishingAnimationPhase2(controller: _animationControllerList[2]),
        new NaijaReportersNewsPublishingAnimationPhase2(controller: _animationControllerList[3]),
        new NaijaReportersNewsPublishingAnimationPhase2(controller: _animationControllerList[4]),
    ]);

    focusNodes.addAll([new FocusNode(),new FocusNode(),]);


    _newsPublishingAnimationPhase1 = new NaijaReportersNewsPublishingAnimationPhase1(controller: _animationControllerList[0]);
    _newsPublishingAnimationPhase1.fadeHeadlineText1.addListener((){setState(() {});});
    _animationControllerList[0].forward();


    _newsPublishingAnimationPhases[0].fadeHeadlineText1.addListener((){setState(() {});});
    _newsPublishingAnimationPhases[1].fadeHeadlineText1.addListener((){setState(() {});});
    _newsPublishingAnimationPhases[2].fadeHeadlineText1.addListener((){setState(() {});});
    _newsPublishingAnimationPhases[3].fadeHeadlineText1.addListener((){setState(() {});});


   njReporterStreamBloc.fillStreamMenuRepository();
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[

          Offstage(
            child: _buildPage5(size: size),
            offstage: phases['phase5'],
          ),
          Offstage(
            child: _buildPage4(size: size),
            offstage: phases["phase4"],
          ),
          Offstage(
            child: _buildPage3(size: size),
            offstage: phases["phase3"],
          ),
          Offstage(
            child: _buildPage2(size: size),
            offstage: phases['phase2'],
          ),
          Offstage(
            child: _buildPage1(),
            offstage: phases['phase1'],
          ),

          Positioned(
            top: 20.0,
            left: 0.0,
            child: FlatButton.icon(
                onPressed: (){Navigator.of(context).pop();},
                icon: Icon(Icons.arrow_back_ios),
                label: Text("Back")
            ),
          ),
        ],
      ),
    );
  }

  Container _buildPage1() => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Naija Reporters", style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(_newsPublishingAnimationPhase1.fadeHeadlineText1.value),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.0,),
        Text("Welcome and thank you for picking\n interest in becoming our news reporter.", style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              color: Colors.black54.withOpacity(_newsPublishingAnimationPhase1.fadesublineText1.value),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.0,),
        Text("We appreciate your effort thus decide to reward you\n handsomely "
            "through this platform that financialy\n empower you by encouraging "
            "you to publish\n current and genuine content.", style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
              color: Colors.black54.withOpacity(_newsPublishingAnimationPhase1.fadesublineText2.value),
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 20.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhase1.fadesublineButton.value,
          origin: Offset(1.0, 1.0),
          child: Material(
            color: Colors.black,
            elevation: 0.0,
            child: InkWell(
              onTap: () => _hidePhase(phase: "phase1", nextAnimIndex: 1),
              splashColor: Colors.white70,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                child: Text("Get Started!", style: TextStyle(
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


  Container _buildPage2({Size size}) => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Align(
          alignment: Alignment.center,
          child: Text("Naija Reporters", style: TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(_newsPublishingAnimationPhases[0].fadeHeadlineText1.value),
            ),
          ),
        ),

        SizedBox(height: 5.0,),

        Align(
          alignment: Alignment.center,
          child: Text("How best can you categorize this \namazing news?", style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
              color: Colors.black54.withOpacity(_newsPublishingAnimationPhases[0].fadesublineText1.value),
            ),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: 15.0,),

        StreamBuilder<List<NaijaReportersNewsCategory>>(
          initialData: null,
          stream: njReporterStreamBloc.newsCategoryStreamOutput,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if (snapshot.hasError){
              return Text("Error loading categories: ${snapshot.error}");
            }
            else if (snapshot.hasData) {
              return Transform.scale(
                scale: _newsPublishingAnimationPhases[0].fadesublineDropdown.value,
                origin: Offset(1.0, 1.0),
                child: Container(
                  width: size.width - 15,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid),
                          top: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid),
                          left: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid),
                          right: BorderSide(color: Colors.black87, width: 1.0, style: BorderStyle.solid)
                      ),
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
//                    elevation: 0,
                    isExpanded: true,
//                    value: value,
                      items: snapshot.data.map<DropdownMenuItem>((e) => DropdownMenuItem(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(IconData(e.icon, fontFamily: e.fontFamily)),
                                  SizedBox(width: 10.0,),
                                  Text(e.category, style: TextStyle(fontWeight: FontWeight.w600),),
    //                              SizedBox(width: 150.0,),
                                ],
                              ),
                            value: e.id,
                        )
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          value = value;
                        });
                      }
                  ),
                ),
              );

            }
            return CircularProgressIndicator();
          }
        ),

        SizedBox(height: 20.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhases[0].fadesublineButton.value,
          origin: Offset(1.0, 1.0),
          child: Material(
            color: Colors.black,
            elevation: 0.0,
            child: InkWell(
              onTap: () => _hidePhase(phase: "phase2", nextAnimIndex: 2),
              splashColor: Colors.white70,
              child: SizedBox(
                width: size.width - 15,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                  child: Text("NEXT", style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );


  Container _buildPage3({Size size}) => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        Align(
          alignment: Alignment.center,
          child: Text("Naija Reporters", style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(_newsPublishingAnimationPhases[1].fadeHeadlineText1.value),
          ),
          ),
        ),

        SizedBox(height: 5.0,),

        Align(
          alignment: Alignment.center,
          child: Text("Give us a brief headline for this amazing news.", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
            color: Colors.black54.withOpacity(_newsPublishingAnimationPhases[1].fadesublineText1.value),
          ),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: 15.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhases[1].fadesublineDropdown.value,
          origin: Offset(1.0, 1.0),
          child: TextField(
            autocorrect: true,
            buildCounter: (BuildContext context, {currentLength: 0, maxLength: 150, isFocused: true}) => Text(
              "$currentLength of $maxLength characters", semanticsLabel: "character count",
            ),
            maxLength: 150,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, style: BorderStyle.solid, width: 1),
//                borderRadius: BorderRadius.circular(3.0),
              ),
              hasFloatingPlaceholder: true,
              labelText: "Brief Headline",
            ),
            focusNode: focusNodes[0],
//            autofocus: (_animationControllerList[2].status == AnimationStatus.completed) ? true : false,
          ),
        ),


        SizedBox(height: 20.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhases[1].fadesublineButton.value,
          origin: Offset(1.0, 1.0),
          child: Material(
            color: Colors.black,
            elevation: 0.0,
            child: InkWell(
              onTap: () => _hidePhase(phase: "phase3", nextAnimIndex: 3),
              splashColor: Colors.white70,
              child: SizedBox(
                width: size.width - 15,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                  child: Text("NEXT", style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );


  Container _buildPage4({Size size}) => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        Align(
          alignment: Alignment.center,
          child: Text("Naija Reporters", style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(_newsPublishingAnimationPhases[2].fadeHeadlineText1.value),
          ),
          ),
        ),

        SizedBox(height: 5.0,),

        Align(
          alignment: Alignment.center,
          child: Text("Kindly provide body content for this amazing news.", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
            color: Colors.black54.withOpacity(_newsPublishingAnimationPhases[2].fadesublineText1.value),
          ),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: 15.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhases[2].fadesublineDropdown.value,
          origin: Offset(1.0, 1.0),
          child: TextField(
            autocorrect: true,
            buildCounter: (BuildContext context, {currentLength: 0, maxLength: 1000, isFocused: true}) => Text(
              "$currentLength of $maxLength characters", semanticsLabel: "character count",
            ),
            maxLength: 1000,
            maxLines: 10,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, style: BorderStyle.solid, width: 1),
//                  borderRadius: BorderRadius.circular(3.0),
                ),
                hasFloatingPlaceholder: true,
                labelText: "Brief Headline",
            ),
            focusNode: focusNodes[1],
//            autofocus: (_animationControllerList[3].status == AnimationStatus.completed) ? true : false,
          ),
        ),


        SizedBox(height: 20.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhases[2].fadesublineButton.value,
          origin: Offset(1.0, 1.0),
          child: Material(
            color: Colors.black,
            elevation: 0.0,
            child: InkWell(
              onTap: () => _hidePhase(phase: "phase4", nextAnimIndex: 4),
              splashColor: Colors.white70,
              child: SizedBox(
                width: size.width - 15,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                  child: Text("NEXT", style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );


  Container _buildPage5({Size size}) => Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        Align(
          alignment: Alignment.center,
          child: Text("Naija Reporters", style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(_newsPublishingAnimationPhases[3].fadeHeadlineText1.value),
          ),
          ),
        ),

        SizedBox(height: 5.0,),

        Align(
          alignment: Alignment.center,
          child: Text("Kindly provide body content for this amazing news.", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.0,
            color: Colors.black54.withOpacity(_newsPublishingAnimationPhases[3].fadesublineText1.value),
          ),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(height: 15.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhases[3].fadesublineDropdown.value,
          origin: Offset(1.0, 1.0),
          child: TextField(
            autocorrect: true,
            buildCounter: (BuildContext context, {currentLength: 0, maxLength: 1000, isFocused: true}) => Text(
              "$currentLength of $maxLength characters", semanticsLabel: "character count",
            ),
            maxLength: 1000,
            maxLines: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black87, style: BorderStyle.solid, width: 1),
//                  borderRadius: BorderRadius.circular(3.0),
              ),
              hasFloatingPlaceholder: true,
              labelText: "Brief Headline",
            ),
            focusNode: focusNodes[1],
          ),
        ),


        SizedBox(height: 20.0,),

        Transform.scale(
          scale: _newsPublishingAnimationPhases[3].fadesublineButton.value,
          origin: Offset(1.0, 1.0),
          child: Material(
            color: Colors.black,
            elevation: 0.0,
            child: InkWell(
              onTap: (){},
              splashColor: Colors.white70,
              child: SizedBox(
                width: size.width - 15,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 35.0),
                  child: Text("NEXT", style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );



  void _hidePhase({@required String phase, @required int nextAnimIndex}) {
    setState(() {phases[phase] = true;});
    _animationControllerList[nextAnimIndex].forward();
  }


  @override
  void dispose() {
    _animationControllerList[0].dispose();
    _animationControllerList[1].dispose();
    _animationControllerList[2].dispose();
    _animationControllerList[3].dispose();
    _animationControllerList[4].dispose();
    super.dispose();
  }
}
