import 'package:expense_tracker/data/local/models/posts_db_model.dart';
import 'package:expense_tracker/data/remote/model/postModel.dart';

import '../../domain/entity/post_entity.dart';

extension PostApiModelMapper on PostApiModel {
  /// API → DB
  PostDbModel toDbModel() {
    return PostDbModel(id: id, title: title, body: body, userId: userId);
  }

  /// API → Domain
  PostEntity toEntity() {
    return PostEntity(id: id, title: title, body: body, userId: userId);
  }
}

extension PostDbModelMapper on PostDbModel {
  /// DB → Domain
  PostEntity toEntity() {
    return PostEntity(id: id, title: title, body: body, userId: userId);
  }
}
