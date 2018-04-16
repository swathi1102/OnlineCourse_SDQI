class Role < ApplicationRecord
has_and_belongs_to_many :users, :join_table => :users_roles


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify

  # has_many :users

end
