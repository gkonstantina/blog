require 'spec_helper'

RSpec.describe Article, :type => :model do

  it "should create an article" do
    article = build(:article)
    expect(article.title).to eq "test article title"
  end

end
