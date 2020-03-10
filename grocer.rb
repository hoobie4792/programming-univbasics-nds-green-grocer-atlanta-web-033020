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

def add_coupon(item, number)
  item[:item] = item[:item] + 'W/COUPON'
  item
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  index = 0
  arr = []
  
  while index < cart.length do
    item_name = cart[index][:item]
    coupon = find_item_by_name_in_collection(item_name, coupons)
    if coupon
      while cart[index][:count] >= coupon[:num] do
        arr.push(add_coupon(cart[index], coupon[:num]))
        cart[index][:count] -= coupon[:num]
      end
      if cart[index][:count] > 0
        arr.push(cart[index])
      end
    end
    
    index += 1
  end
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
