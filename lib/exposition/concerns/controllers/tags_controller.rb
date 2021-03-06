module Exposition
  module Concerns
    module Controller
      module TagsController
        extend ActiveSupport::Concern

        def show
          @tag = Categorical::Tag.find_by_slug!(params[:id])
          @taggables = @tag.
            send(fetch_taggable_type).
            published.
            sorted_by_published_date.
            page(params[:page]).
            per(10)
        end

        private

        def fetch_taggable_type
          if params[:type]
            taggable_type = params[:type]
            return taggable_type.underscore.to_sym
          else
            return "Exposition::Post"
          end
        end
      end
    end
  end
end

