require 'pry'

def normal_tick(item)
  item.sell_in -= 1
  return if item.quality == 0
  item.quality -= 1
  item.quality -= 1 if item.sell_in <= -1
end

def sulfuras_tick(item)
end

def brie_tick(item)
  item.sell_in -= 1
  return if item.quality == 50
  item.quality += 1
  item.quality += 1 if item.sell_in <= -1
  item.quality = 50 if item.quality > 50
end

def backstage_tick(item)
  if item.sell_in <= 0
    item.quality = 0
  elsif item.sell_in <= 5
    item.quality += 3
  elsif item.sell_in <= 10
    item.quality += 2
  else
    item.quality += 1
  end
  item.sell_in -= 1
  item.quality = 50 if item.quality > 50
end

def update_quality(items)
  items.each do |item|
    
    case item.name
    when 'NORMAL ITEM'
      normal_tick(item)
    when 'Sulfuras, Hand of Ragnaros'
      sulfuras_tick(item)
    when 'Aged Brie'
      brie_tick(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage_tick(item)
    end
    
  end
end



# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

