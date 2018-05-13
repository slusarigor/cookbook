module CustomAssertions
  def assert_html_equal times, text
    recipe_blocks = response.body.scan /#{text}/

    assert_equal times, recipe_blocks.count
  end
end