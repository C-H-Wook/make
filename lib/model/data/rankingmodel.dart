class RankingModel {
  final String user_id;
  final int qr_count;

  RankingModel.fromJson(Map<String, dynamic> json)
      : user_id = json['user_id'],
        qr_count = json['qr_count'];
}
