module Types
  class PostType < Types::BaseObject
   field :id, ID, null: false
   field :title, String, null: false
   field :context, String, null: false
   field :status, Integer, null: false
   field :category_id, Integer, null: false
   field :score, Integer, null: false
   field :page_views, Integer, null: false
   field :introduction, String, null: false
   field :language, Integer, null: false
   field :like, Integer, null: false
  end
end
