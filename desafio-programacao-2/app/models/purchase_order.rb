class PurchaseOrder < ActiveRecord::Base
  require 'csv'
  validates :purchaser_name, presence: true
  validates :item_description, presence: true
  validates :item_price, presence: true
  validates :purchase_count, presence: true
  validates :merchant_address, presence: true
  validates :merchant_name, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true, header_converters: :symbol, col_sep:"\t") do |row|
      PurchaseOrder.create(row.to_hash)
    end
  end
end
