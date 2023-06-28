class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :comment, presence: true, length: { maximum: 70 }, if: :validate_no_spaces_or_line_breaks
  
  # 改行のみ・全角半角スペースのみのメッセージか確認する
  def validate_no_spaces_or_line_breaks
    comment.strip.blank? 
  end

end
