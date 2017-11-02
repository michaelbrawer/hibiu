class Post < ApplicationRecord

    has_attached_file :image, styles: { medium: "500x500>", thumb: "250x250>" }, presence: true, :default_url => "https://i.imgur.com/vbThdIN.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
    belongs_to :user
    
    has_many :comments, dependent: :destroy
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    def all_tags=(keywords)
        self.tags = keywords.split(',').map do |keyword|
          Tag.where(keyword: keyword.strip).first_or_create!
        end
    end
      
      def all_tags
        self.tags.map(&:keyword).join(', ')
      end

end
