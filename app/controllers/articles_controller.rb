# Here ArticlesController is a SUBCLASS of ApplicationController (the parent of all controllers)
class ArticlesController < ApplicationController
  # If the index action is empty rails will AUTOMATICALLY render the view that matches the name of the controller and action
  def index
   # This gives instance access, so the view now has direct access
   @articles = Article.all
  end

  # Here the :id path param is automatically passed down
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end


  def create
    # NOTE: .new creates a TEMP new article, but does not save
    # .new action also renders the app/views/articles/new.html.erb
    @article = Article.new(article_params)

    if @article.save
      # If no errors, redirect to newly created article
      # http://localhost:3000/articles/#{@article.id}

      # redirect makes new request - render makes renders the view specific view for the request
      # redirect is used here since NEW data must be requested
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end


  # REMEMBER, we have access to params automatically here
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
        redirect_to @article
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    puts "hello"
    puts @article.inspect
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # Rather than directly injecting title and body directly to article.save() above
  # , we add a function to validate and return it for us
  private
    def article_params
      p "article_params", params
      params.require(:article).permit(:title, :body)
    end
end
