require 'rails_helper'

RSpec.describe "exposition/admin/posts/index.html.haml", type: :view do
  it "truncates the post summary" do
    post_summary = "This is a very very very very very very very very very very very very very very very very very very very very very very very very very long sentence."
    blog_post = create(:post, summary: post_summary)

    # View expects a paginated collection from Kaminari
    paginated_collection = Kaminari.paginate_array([blog_post]).page(1)
    assign(:posts, paginated_collection)

    render

    expect(rendered).to include("This is a very very very very very...")
  end
end
