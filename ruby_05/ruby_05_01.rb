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

data = [:Chinone]
scores = {Carol: 90, Alice: 50, David: 40, Bob: 60}
names = scores.each_with_object(data) do |(key, val), arr|
  arr << key if val >= 60
end
p names # [:Chinone, :Carol, :Bob]

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