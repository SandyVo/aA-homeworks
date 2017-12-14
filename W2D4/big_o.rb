def sluggish(arr)
  longest_fish = ""

  (0...arr.length - 1).each do |i|
    (1..arr.length - 1).each do |j|
      if arr[i].length > arr[j].length && arr[i].length > longest_fish.length
        longest_fish = arr[i]
      elsif arr[j].length > arr[i].length && arr[j].length > longest_fish.length
        longest_fish = arr[j]
      end
    end
  end
  longest_fish
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if self.length <= 1

    mid = self.length
    left_sorted = self.take(mid).merge_sort(&prc)
    right_sorted = self.drop(mid).merge_sort(&prc)
    Array.merge(left_sorted, right_sorted, &prc)
  end

  private

  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left, right, &prc)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end
end

def dominant(arr)
  prc = Proc.new { |x, y| x.length <=> y.length }
  arr.merge_sort(&prc)[-1]
end

def clever(arr)
  longest = 0
  arr.each do |fish|
    longest = fish if fish.length > longest
  end
  longest
end

def slow(direction, tiles_arr)
  tiles_arr.each_with_index do |el, idx|
    return idx if el == direction
  end
end

def constant(direction, tiles_arr)
  tiles_arr.index(direction)
end

#use a hash for constant lookup
# tiles_hash = {
#     "up" => 0,
#     "right-up" => 1,
#     "right"=> 2,
#     "right-down" => 3,
#     "down" => 4,
#     "left-down" => 5,
#     "left" => 6,
#     "left-up" => 7
# }
#
# def fast_dance(direction, tiles_hash)
#   tiles_hash[direction]
# end
