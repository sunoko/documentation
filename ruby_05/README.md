# 3項演算子のネスト
```rb
UserClass = Struct.new(:admin, :active)
user1 = UserClass.new(true, true)
user2 = UserClass.new(true, false)
user3 = UserClass.new(false, true)
user4 = UserClass.new(false, false)
def show_message(user)
  puts !user.admin ? "Thanks." :
        user.active ? "I appreciate for that." :
                      "Are you OK?"
end

show_message(user1) # I appreciate for that.
show_message(user2) # Are you OK?
show_message(user3) # Thanks.
show_message(user4) # Thanks.
```

# &method(:name)
```rb
def process_users_v1(users)
  users.each do |user|
    process_user(user)
  end
end

def process_users_v2(users)
  users.each(&method(:process_user))
end

def process_user(user)
  puts user.name
  puts user.email
end

UserClass = Struct.new(:name, :email)
user1 = UserClass.new('chinone', 'chinone@mail.com')
user2 = UserClass.new('kazuki', 'kazuki@mail.com')
users = [user1, user2]
process_users_v1(users)
# chinone
# chinone@mail.com
# kazuki
# kazuki@mail.com
process_users_v2(users)
# chinone
# chinone@mail.com
# kazuki
# kazuki@mail.com
```

# each_with_object
```rb
data = [:Chinone]
scores = {Carol: 90, Alice: 50, David: 40, Bob: 60}
names = scores.each_with_object(data) do |(key, val), arr|
  arr << key if val >= 60
end
p names # [:Chinone, :Carol, :Bob]
```

# ブロックをメソッドに渡す、演算方法を後で決める
```rb
def method_v1
  if block_given?
    return yield
  else
    'no block'
  end
end
p method_v1 # no block
p method_v1 {'block'} # block

def method_v2(a, b)
  yield(a, b)
end
plus = method_v2(3, 3) { |x, y| x + y } # 6
times = method_v2(3, 3) { |x, y| x * y } # 9
```

# コードの塊を保存する
```rb
l = -> { puts 'lambda'}
p = Proc.new { puts 'proc'}
l.call # lambda
p.call # proc
```

# &procでブロックを読む
```rb
def hogehoge(x, &proc)
  proc.call if block_given?
  return x + 2
end
p hogehoge(3) # 5
p hogehoge(3) { puts 'block'}
# block 
# 5
```

# 毎回&procを定義するのは面倒なので、yield
```rb
# ブロックをメソッドに渡せる
# &procは定義の必要あり、yieldは定義の必要なし
def hogehoge(x)
  yield if block_given?
  return x + 2
end
p hogehoge(3) # 5
p hogehoge(3) { puts 'block'}
# block 
# 5
```

# 動的にメソッドを定義できる
```rb
define_method :my_method do
  'hello, world!'
end
my_method # hello, world!

class String
  3.times {|i|
    define_method "my_method_v#{i}" do
      puts i
    end
  }
end
''.my_method_v0 # 0
''.my_method_v1 # 1
''.my_method_v2 # 2
''.my_method_v3 # NoMethodError
```

# スコープを捻じ曲げる
```rb
local_var = 'Success!!!'
class MyClassV1
  # puts local_var # NameError
  def my_method
    puts local_var # NameError
  end
end

MyClassV2 = Class.new do
  puts local_var
  define_method :my_method do
    puts local_var
  end
end # Success!!!

MyClassV1.new
MyClassV2.new
MyClassV2.new.my_method # Success!!!
```