import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'current_index_provider.g.dart';

@riverpod
class CurrentIndex extends _$CurrentIndex {
  @override
  int build() {
    return 0;
  }
  void updateIndex(int currentIndex) {
    state = currentIndex;
  }
}
