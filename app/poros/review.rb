class Review

  def initialize(data)
    @review_count = data[:total_results]
    @review_author_info = create_review_hash(data[:results])
  end

  def create_review_hash(data)
    data.map do |result|
      { :author => result[:author], :content => result[:content]}
    end
  end
end