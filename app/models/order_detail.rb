class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_status: { not_produced: 0, waiting_for_deposit: 1, production: 2, complete: 3 }

end
