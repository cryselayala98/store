class Article < ApplicationRecord

  has_many :comments, dependent: :destroy 
  # hacer la relación 1 a muchos con el modelo conmentarios
  # dependent: :destroy -> cuando se elimina un artículo, también se eliminan sus comentarios

  # validar los datos que se reciben de los formularios de crear y editar
  # validar que mínimo el artículo debe tener un título y debe ser mayor a 5 caracteres
  validates :title, presence: true,
                    length: { minimum: 5 }

end
