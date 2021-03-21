
class Branch {
  String mId;
  String mBranchName;
  bool isVisible;

  Branch(this.mId, this.mBranchName);

}

class Talent {
  String mId;
  String mTalentName;
  String mImage;
  String mBranchId;

  Talent(this.mId, this.mTalentName, this.mImage, this.mBranchId);
}