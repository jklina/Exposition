module Exposition
  module Concerns
    module Controller
      module Admin
        module PostsController
          extend ActiveSupport::Concern
          def index
            @posts = Post.sorted_by_published_date.
              page(params[:page]).
              per(25)
          end

          def new
            @post = Post.new
            find_authors
            find_tags
          end

          def create
            @post = Post.new(post_params)
            find_authors
            find_tags
            if @post.save
              flash[:success] = "Post successfully created."
              redirect_to admin_posts_path
            else
              render :new
            end
          end

          def edit
            find_post
            find_authors
            find_tags
          end

          def update
            find_post
            find_authors
            find_tags
            if @post.update(post_params)
              flash[:success] = "Post was successfully updated."
              redirect_to admin_posts_path
            else
              render action: 'edit'
            end
          end

          private

          def find_authors
            @authors = User.all
          end

          def find_post
            @post = Post.find_by_slug!(params[:id])
          end

          def find_tags
            @tags = Categorical::Tag.all
          end

          def post_params
            params.require(:post).permit(:id, :title, :body, :summary, :slug, :published, :author_id, tag_ids: [])
          end
        end
      end
    end
  end
end
