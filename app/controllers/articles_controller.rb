class ArticlesController < ApplicationController

  # crear un formulario de autenticación simple para un administrador de páginas
  # que las rutas index y show no necesiten autenticación
  http_basic_authenticate_with name: "crisel", password: "12345", except: [:index, :show]
  
  def index
    @articles = Article.all # listar todos los artículos
  end

  def show
    @article = Article.find(params[:id]) # : id -> pasado por el request http 
                                         # get
  end

  def new
    @article = Article.new
  end

  # renderizar edit
  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect -> los datos que se reciben del formulario de crear artículos

    # @article = Article.new(params[:article]) # params -> datos recibidos por la solicitud http

    # La anterior línea va a botar error. Rails tiene características de seguridad, una de ellas permite que el usuario no digite más datos de los que se especifican en el formulario. Esta característica se llama "strong parameters". En el controlador, al crear  o actualizar una instancia para alguna entidad de la bd, se debe expresar explícitamente los campos que se van a agregar a la tabla (en este caso, articles), de esta forma:

    @article = Article.new(article_params)

    # Article -> la clase Article de los modelos

    if @article.save
      redirect_to @article
    else
      render 'new'
    end

  end

  def update
    
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy

    @article = Article.find(params[:id])
    @article.destroy
  
    redirect_to articles_path # listar articulos
    
  end

  # el metodo de recibir los parámetros de un artículo se puede reutilizar para otros formularios:

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end

# orden de los métodos: index, show, new, edit, create, update and destroy.
