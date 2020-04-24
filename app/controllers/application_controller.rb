class ApplicationController < ActionController::Base

  def hello
    render html: 'Hello world!' # renderizar sin cargar una página de la vista
  end

end
