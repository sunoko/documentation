# 引数3種類
## キーワード
引数をハッシュで渡す
```rb
class Keyword
  def self.say(msg: 'Good', name: 'Chinone')
    p "#{msg}, #{name}"
  end
end
Keyword.say # Good, Chinone
Keyword.say(msg: 'Hi', name: 'Chinone') # Hi, Chinone
Keyword.say(name: 'Kazuki', msg: 'Hello') # Hello, Kazuki
```

## 可変長引数
引数が何個渡るか不明な場合
```rb
class Many
  def self.say(*msg)
    p msg
  end
end
Many.say('hi') # ['hi']
Many.say('hi', 'hello') # ['hi', 'hello']
```

## オプション引数
名前に関係なくハッシュで引数を渡す
```rb
class Option
  def self.say(**msg)
    p msg
  end
end
Option.say(msg: 'hi') # {:msg => 'hi'}
Option.say(msg: 'hello', name: 'chinone') # {:msg => 'hello', name => 'chinone'}
```

# nil?, empty?
* nil?は値がnilの場合はtrue、nil以外は全てfalse
* nilとは、Rubyにおいて「オブジェクトが存在しない」という意味
* empty?はnil、true、false、Fixnum(整数)には使用できない
* 配列や文字列やハッシュの値がからである場合true

# eval
## instance_eval
渡されたブロックを実行する
```rb
class InstanceEvalSample
  def initialize
    @name = "chinone"
  end
end
x = InstanceEvalSample.new
p x.instance_eval{ @name } # chinone
```

## module_eval, class_eval
ブロックをあたかもクラス定義やモジュール定義の中のコードであるかのように実行する
```rb
class EvalSample; end
EvalSample.module_eval { def good; "Good"; end }
EvalSample.class_eval { def bad; "Bad"; end }
p EvalSample.good # Good 
p EvalSample.bad # Bad
```
