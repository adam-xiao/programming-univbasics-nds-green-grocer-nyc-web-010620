def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  index = 0
  while index < collection.length do
    if name == collection[index][:item]
      return collection[index]
    else
      nil
    end
    index += 1
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  index = 0
  item_desc_count = []

  while index < cart.length do
    item_name = cart[index][:item]
    item_desc = find_item_by_name_in_collection(item_name, item_desc_count) #returns a hash from info provided

    if item_desc #if the provided info already exists, inc 1, if not set to 1
      item_desc[:count] += 1
    else
      cart[index][:count] = 1
      item_desc_count << cart[index]
    end
    index += 1
  end
  item_desc_count
end

def format_coupon(coupon)
  price_sig_fig = (coupon[:cost] / coupon[:num]).round(2)
  
  {
    :item => "#{coupon[:item]} W/ COUPON",
    :price => price_sig_fig,
    :count => coupon[:num]
  }


end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart

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
