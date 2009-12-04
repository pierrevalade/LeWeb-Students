class Tagging < ActiveRecord::Base
  belongs_to :tag, :counter_cache => :users_count
  belongs_to :taggable, :polymorphic => true
end
