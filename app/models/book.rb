class Book < ApplicationRecord
  # 下記エラー＝Bookモデルにtitleの属性が必要
  # カラム＝属性。カラムが存在しないと保存ができない
  # ActiveModel::UnknownAttributeError in BooksController#createunknown attribute 'title' for Book.
  attribute :title, :string
  attribute :body, :string
  
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  
  
end
