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

def mk_coupon_hash(c)
  rounded_unit_price = (c[:cost].to_f * 1.0 / c[:num]).round(2)
  {
    :item => "#{c[:item]} W/COUPON",
    :price => rounded_unit_price,
    :count => c[:num]
  }
end

# A nice "First Order" method to use in apply_coupons

def apply_coupon_to_cart(matching_item, coupon, cart)
  matching_item[:count] -= coupon[:num]
  item_with_coupon = mk_coupon_hash(coupon)
  item_with_coupon[:clearance] = matching_item[:clearance]
  cart << item_with_coupon
end


def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0
 while i < coupons.count do
   coupon = coupons[i]
   item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
   item_is_in_basket = !!item_with_coupon
   count_is_big_enough_to_apply = item_is_in_basket && item_with_coupon[:count] >= coupon[:num]

   if item_is_in_basket and count_is_big_enough_to_apply
     apply_coupon_to_cart(item_with_coupon, coupon, cart)
   end
   i += 1
 end

 cart

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
