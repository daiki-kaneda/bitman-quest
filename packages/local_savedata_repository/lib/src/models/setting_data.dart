class SettingData{
  SettingData({required this.isBGM,required this.isSfx});

   bool isBGM;
   bool isSfx;

  SettingData copyWith({
    required bool? isBGM,
    required bool? isSfx
    }){
      return SettingData(
        isBGM: isBGM ?? this.isBGM,
        isSfx: isSfx ?? this.isSfx
      );
    }
  
  Map<String,dynamic> toJson(){
    return {
      'isBGM':isBGM,
      'isSfx':isSfx,
    };
  }

  factory SettingData.fromJson(Map<String,dynamic> json){
    return SettingData(isBGM: json['isBGM'], isSfx: json['isSfx']);
  }
}