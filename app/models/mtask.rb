class Mtask < ActiveRecord::Base
  unloadable


  belongs_to :author, :class_name => 'User'
  belongs_to :assigned_to, :class_name => 'Principal'
end
