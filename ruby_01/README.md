# Fixnum#+を再定義して足し算の結果に必ず+1されるようにする。さらに、`1+1`の場合は必ず答えが100になる。
```rb
class Fixnum
  alias_method :old_add, :+
  def +(target)
     return 100 if (self == 1 && target == 1)
     self.old_add(target).old_add(1)
  end
end
puts 1 + 0 # 2
puts 1 + 1 # 100
puts 1 + 2 # 4
puts 1 + 3 # 5
```