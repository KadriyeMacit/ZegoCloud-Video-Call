import 'package:flutter/material.dart';
import 'package:video_call/model/call_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../custom_avatar_builder.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CallPageState();
}

class CallPageState extends State<CallPage> {
  ZegoUIKitPrebuiltCallController callController =
      ZegoUIKitPrebuiltCallController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: CallModel.appID,
        appSign: CallModel.appSign,
        userID: CallModel.userID,
        userName: CallModel.username,
        callID: CallModel.callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()

          /// support minimizing
          ..topMenuBarConfig.isVisible = true
          ..topMenuBarConfig.buttons = [
            ZegoMenuBarButtonName.minimizingButton,
            ZegoMenuBarButtonName.showMemberListButton,
          ]
          ..avatarBuilder = customAvatarBuilder

          ///
          ..onOnlySelfInRoom = (context) {
            if (PrebuiltCallMiniOverlayPageState.idle !=
                ZegoUIKitPrebuiltCallMiniOverlayMachine().state()) {
              ZegoUIKitPrebuiltCallMiniOverlayMachine()
                  .changeState(PrebuiltCallMiniOverlayPageState.idle);
            } else {
              Navigator.of(context).pop();
            }
          },
      ),
    );
  }
}
