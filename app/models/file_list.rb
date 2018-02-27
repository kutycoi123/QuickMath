class FileList < ApplicationRecord
  belongs_to :note
  has_many :file_items, :dependent => :destroy
end
