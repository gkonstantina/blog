class AddCourseToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :course, index: true
  end
end
