class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum:250}
  validates :summary, length: {maximum:250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?

   def clickbait?
     if self.title
       unless self.title.match(/Secret|Top|Guess|Won't Believe/)
         errors.add(:title, "must be clickbait")
       end
     end

  end
end
