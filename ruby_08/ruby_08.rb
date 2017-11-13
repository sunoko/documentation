class Keyword
  def self.say(msg: 'Good', name: 'Chinone')
    p "#{msg}, #{name}"
  end
end
Keyword.say # Good, Chinone
Keyword.say(msg: 'Hi', name: 'Chinone') # Hi, Chinone
Keyword.say(name: 'Kazuki', msg: 'Hello') # Hello, Kazuki

class Many
  def self.say(*msg)
    p msg
  end
end
Many.say('hi') # ['hi']
Many.say('hi', 'hello') # ['hi', 'hello']

class Option
  def self.say(**msg)
    p msg
  end
end
Option.say(msg: 'hi') # {:msg => 'hi'}
Option.say(msg: 'hello', name: 'chinone') # {:msg => 'hello', name => 'chinone'}

class InstanceEvalSample
  def initialize
    @name = "chinone"
  end
end
x = InstanceEvalSample.new
p x.instance_eval{ @name } # chinone

class EvalSample; end
EvalSample.module_eval { def good; "Good"; end }
EvalSample.class_eval { def bad; "Bad"; end }
p EvalSample.good # Good 
p EvalSample.bad # Bad
