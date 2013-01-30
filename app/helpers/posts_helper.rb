module PostsHelper
  def name_only(tags)
    tags.map do |t|
      t.name
    end
  end
end
