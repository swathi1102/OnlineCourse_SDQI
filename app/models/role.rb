class Role < ApplicationRecord

 has_many :users


belongs_to :resource,
           :polymorphic => true,
           :optional => true

end
