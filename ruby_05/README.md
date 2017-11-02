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

```

# 演算方法を後で決める
```rb

```

# コードの塊を保存する
```rb

```

# &procでブロックを読む
```rb

```

# 毎回&procを定義するのは面倒なので、yield
```rb
# ブロックをメソッドに渡せる
# &procは定義の必要あり、yieldは定義の必要なし

```

# 動的にメソッドを定義できる
```rb

```

# スコープを捻じ曲げる
```rb

```