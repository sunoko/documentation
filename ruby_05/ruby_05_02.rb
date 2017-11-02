l = -> { puts 'lambda'}
p = Proc.new { puts 'proc'}
l.call # lambda
p.call # proc

def hogehoge(x, &proc)
  proc.call if block_given?
  return x + 2
end
p hogehoge(3) # 5
p hogehoge(3) { puts 'block'}
# block 
# 5

def hogehoge(x)
  yield if block_given?
  return x + 2
end
p hogehoge(3) # 5
p hogehoge(3) { puts 'block'}
# block 
# 5

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