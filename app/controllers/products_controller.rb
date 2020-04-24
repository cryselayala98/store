class ProductsController < ApplicationController

    def index
        @products = Product.all # tome todos los productos (del modelo sql)
    end

    # cargar formulario de crear un nuevo producto
    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        
        if @product.save
            redirect_to products_path # redirijame a /products -> list
        else
            render :new # recargar el formulario
        end
    end

    def edit
        @product = Product.find(params[:id]) # buscar el producto con esa id en específico para luego modificarlo
    end

    def update
        @product = Product.find(params[:id]) # buscar un proudcto con ese parametro
        
        if @product.update(product_params)
            redirect_to products_path # redirijame a list_product (/products)
        else
            render :edit # recargar el formulario
        end
    end

    def delete
        @product = Product.find(params[:id]) # buscar un proudcto con ese parametro
        @product.destroy
        redirect_to products_path
    end

    private
        def product_params
            # recibir los datos del formulario
            params.require(:product).permit(:name, :description, :text, :price)
        end
end
