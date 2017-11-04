class Gear
  attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  # チェーンリングとコグの比率を求める
  def ratio
    chainring / cog.to_f
  end

  # チェーンリングとコグの比率と車輪の直径からギアの大きさを求める 
  def gear_inches(diameter)
    ratio * diameter
  end
end

class Wheel
  attr_reader :rim, :tire, :gear
  def initialize(rim, tire, chainring, cog)
    @rim = rim
    @tire = tire
    @gear = Gear.new(chainring, cog)
  end

  # 車輪の直径を求める
  def diameter
    rim + (tire * 2)
  end

  # 車輪の円周を求める
  def circumference
    diameter * Math::PI
  end
  
  # チェーンリングとコグの比率と車輪の直径からギアの大きさを求める 
  def gear_inches
    gear.gear_inches(diameter)
  end
end

Wheel.new(26, 1.5, 52, 11).gear_inches # 137.0909090909091
