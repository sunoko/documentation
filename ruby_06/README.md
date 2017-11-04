# 単一責任
1. インスタンス変数の隠蔽
1. データ構造の隠蔽
1. メソッドから余計な責任を抽出
1. クラス内の余計な責任を隔離
```rb
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  # チェーンリングとコグの比率を求める
  def ratio
    chainring / cog.to_f
  end

  # チェーンリングとコグの比率と車輪の直径からギアの大きさを求める 
  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  # 車輪の直径を求める
  def diameter
    rim + (tire * 2)
  end

  # 車輪の円周を求める
  def circumference
    diameter * Math::PI
  end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference # 91.106186954104
puts Gear.new(52, 11, @wheel).gear_inches # 137.0909090909091
puts Gear.new(52, 11).ratio # 4.7272727272727275
```