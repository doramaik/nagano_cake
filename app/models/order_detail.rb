class OrderDetail < ApplicationRecord
   enum production_status: { production_inpossible: 0, production_pending: 1, in_production: 2, production_complete: 3}
end
