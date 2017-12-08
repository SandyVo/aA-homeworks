class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|k_v_pair| k_v_pair[0] == key}
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def look_up(key)
    @map.each do |k_v_pair|
      if k_v_pair[0] == key
        return k_v_pair[1]
      end
    end
    nil
  end

  def remove(key)
    @map.each do |k_v_pair|
      if k_v_pair[0] == key
        @map.delete(k_v_pair)
      end
    end
    @map
  end

  def show
    @map
  end

end
