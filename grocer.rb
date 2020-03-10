def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0
  
  while index < collection.length do
    if collection[index][:item] == name
      return collection[index]
    end
    index += 1
  end
  return nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  index = 0
  arr = []

  while index < cart.length do
    item = find_item_by_name_in_collection(cart[index][:item], arr)
    if item
      item[:count] += 1
    else
      cart[index][:count] = 1
      arr.push(cart[index])
    end
    
    index += 1
  end

  return arr
end

def mk_coupon_hash(c)
  rounded_unit_price = (c[:cost].to_f * 1.0 / c[:num]).round(2)
  {
    :item => "#{c[:item]} W/COUPON",
    :price => rounded_unit_price,
    :count => c[:num]
  }
end

def apply_coupon(item, coupon, cart)
  item[:count] -= coupon[:num]
  item_with_coupon = {
    item: item[:item] + " W/COUPON",
    price: coupon[:cost] / coupon[:num],
    count: coupon[:num],
    clearance: item[:clearance]
  }
  cart.push(item_with_coupon)
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  index = 0
  while index < coupons.count do
    item = find_item_by_name_in_collection(coupons[index][:item], cart)

    if item and item[:count] >= coupons[index][:num]
      apply_coupon(item, coupons[index], cart)
    end
    index += 1
  end

  return cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
