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
  item_desc_count_ary = []

  while index < cart.length do
      item_desc = cart[index]

      if find_item_by_name_in_collection(item_desc[:item], cart)

        item_desc_count = {
          :item => item_desc[:item]
          :price => item_desc[:price]
          :clearance => item_desc[:clearance]
          :count => 1
        }

        item_desc_count_ary << item_desc_count
      end
      index += 1
    end

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
