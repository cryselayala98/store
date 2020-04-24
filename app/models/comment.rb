class Comment < ApplicationRecord
  belongs_to :article # un comentario se relaciona a un artículo
end
