// created by ZuoXiaoFei at 2019-09-10
import 'package:flutter/material.dart';
import 'package:view_model/base/view_model.dart';

class ClassDetailState{
  final Map previewList =  {
    "name":"课前小锦囊",
    "finish":0,
    "previewId":110,
    "passList":[
      {
        "name":"词句伦伦看",
        "finish":0
      },
      {
        "name":"绘本小狂人",
        "finish":0
      }
    ]
  };

  final Map reviewList = {
    "name":"课后大乐斗",
    "finish":0,
    "previewId":112,
    "passList":[
      {
        "name":"知识小预热",
        "finish":0
      },
      {
        "name":"趣配音",
        "finish":0
      }
    ]
  };
}

enum ClassDetailEvent {
 setFinishCurrentPass,
  setUnFinishCurrentPass
}
class ClassDetailVM extends ViewModel<ClassDetailEvent,ClassDetailState>{
  @override
  ClassDetailState state = ClassDetailState();
  @override
  void mapEventToHandler(Event event, Commit commit) {
    // TODO: implement mapEventToHandler
    switch(event.event){
      case ClassDetailEvent.setFinishCurrentPass:
        _setFinishCurrentPass(event,committer,1);
        break;
      case ClassDetailEvent.setUnFinishCurrentPass:
        _setFinishCurrentPass(event,committer,0);
        break;
    }
  }

  void _setFinishCurrentPass(Event event,Committer committer,int status){
    int  flag = event.payload.getInt("flag");
    int passIndex = event.payload.getInt("passIndex");
    /// 课前
    if(flag == 1){
      _setPreviewStatus(passIndex,status);
      committer.commit();
    }else if(flag == 2){
      _setReviewStatus(passIndex,status);
      committer.commit();
    }
  }
  void _setReviewStatus(int passIndex,int status){
    state.reviewList["passList"][passIndex]["finish"] = status;
    _checkPassStatus(2);
  }
  void _setPreviewStatus(int passIndex,int status){
    state.previewList["passList"][passIndex]["finish"] = status;
    _checkPassStatus(1);
  }
  void _checkPassStatus(int flag){
    if(flag == 1){
      var result =(state.previewList["passList"] as List).every((ele){
        return ele["finish"] == 1;
      });
      if(result)
        state.previewList["finish"] = 1;
      else
        state.previewList["finish"] = 0;
    }else if(flag == 2){
      var result =(state.reviewList["passList"] as List).every((ele){
        return ele["finish"] == 1;
      });
      if(result)
        state.reviewList["finish"] = 1;
      else
        state.reviewList["finish"] = 0;
    }
  }

}