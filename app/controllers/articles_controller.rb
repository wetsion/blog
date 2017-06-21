class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "weixin", password: "secret",
	except: [:index, :show]

    def index
    	@articles = Article.all
    end

	def show
		@article = Article.find(params[:id])



	end

	def new
		@article =Article.new

	end

	#编辑
	def edit
		@article = Article.find(params[:id])
	end

	#添加
	def create
		# render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
		
	end

	# 删除
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	#修改更新
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	private
	  def article_params
	  	params.require(:article).permit(:title, :text)
	  end
end
