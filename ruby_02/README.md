# クラスって何？なぜモジュールが必要？
クラスは設計図。何を持っていて、何ができるのかを記載する。
再利用可能で、後のプログラムを素早く開発できる。独立にテスト可能で、デバッグ時間の削減。

# includeとextendの違いは？
includeはインスタンスメソッドを追加。クラスに機能を追加。
extendはクラスメソッドを追加。ある特定のオブジェクトだけに機能を追加。
```rb
module Sample
  def sample
    puts 'This is module!!!'
  end
end

class IncludeSample
  include Sample
end

IncludeSample.new.sample # This is module!!!
IncludeSample.sample # NoMethodError

class ExtendSample
  extend Sample
end

ExtendSample.new.sample # NoMethodError
ExtendSample.sample # This is module!!!
```
# ActiveRecordのincludesとjoinsの違いは？
joinsはsqlでINNER JOINする。
includesはデータの先読みをしてキャッシュする。N+1問題を解決してくれる。
効率データを取得するための手段としてincludesとjoinsがある。
参照先を利用したいだけなら、includes
INNER JOINして絞り込みたいなら、joins
絞り込みつつ参照先も利用したいなら、includes+referencesやincludes+joins

# privateとprotectedの違いは？
privateはそのオブジェクトの外側からコールできない
protectedは同じクラスのオブジェクトからならコールは可能
```rb
class SampleSuper
  protected
  def protected_method
    'protected'
  end
  private
  def private_method
    'private'
  end
end

class Sample < SampleSuper
  def call
    t = Sample.new
    t.protected_method # protected
    t.private_method # NoMethodError
  end
end

Sample.new.call
```

# renderとredirectの違いは？
renderはviewパートをレンダーする。
redirectは新しいURLに新規のリクエストを投げて、再表示する。