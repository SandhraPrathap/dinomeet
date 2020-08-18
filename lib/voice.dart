import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';

class Voice extends StatefulWidget {
  final String channel;

  const Voice({Key key, this.channel}) : super(key: key);
  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  static final _users = <int>[];
  initagora() async {
    await AgoraRtcEngine.create("dbc7fb90138f4cf9a6bf61629329bf2d");
    await AgoraRtcEngine.disableVideo();
    await AgoraRtcEngine.setChannelProfile(ChannelProfile.Communication);
    agoraeventhandler();
    AgoraRtcEngine.joinChannel(
        null, widget.channel, null, 0); //0 to assign unique id by default
  }

  agoraeventhandler() {
    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
      setState(() {
        print("User Joined $uid");
        _users.add(uid);
      });
    };
    AgoraRtcEngine.onJoinChannelSuccess =
        (String channel, int uid, int elapsed) {
      setState(() {
        print("Join channel $channel");
      });
    };
    AgoraRtcEngine.onLeaveChannel = () {
      setState(() {
        print("Leaving Channel");
      });
    };
    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
      setState(() {
        print("User left channel $uid");
        _users.remove(uid);
      });
    };
  }

  disposeagora() async {
    _users.clear();
    await AgoraRtcEngine.leaveChannel();
    await AgoraRtcEngine.destroy();
  }

  @override
  void dispose() {
    disposeagora();
    super.dispose();
  }

  @override
  void initState() {
    initagora();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
                color: Colors.red[300],
                margin: EdgeInsets.all(5),
                child: Text(
                  "Ongoing Call...",
                )),
            Container(child: Text(_users.toList.toString())),
            Container(
              child: IconButton(
                  icon: Icon(Icons.call_end),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class VoiceCall extends StatelessWidget {
  final String Channel;

  const VoiceCall({Key key, this.Channel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DinoMeet"),
        backgroundColor: Colors.red,
      ),
      body: Voice(
        channel: Channel,
      ),
    );
  }
}
