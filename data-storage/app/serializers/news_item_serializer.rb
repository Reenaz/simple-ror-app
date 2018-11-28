class NewsItemSerializer < ActiveModel::Serializer
  attributes :title,
    :description,
    :content,
    :url,
    :url_to_image,
    :author
end
