require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for posted blog post" do
    refute blog_posts(:posted).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).draft?
  end

  test "posted? returns false for draft blog post" do
    refute blog_posts(:draft).posted?
  end

  test "posted? returns true for posted blog post" do
    assert blog_posts(:posted).posted?
  end

  test "posted? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).posted?
  end

  test "scheduled? returns false for draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns true for posted blog post" do
    refute blog_posts(:posted).scheduled?
  end

  test "scheduled? returns false for scheduled blog post" do
    assert blog_posts(:scheduled).scheduled?
  end

  # def draft_blog_post
  #   BlogPost.new(posted_at: nil)
  # end

  # def posted_blog_post
  #   BlogPost.new(posted_at: 1.year.ago)
  # end

  # def scheduled_blog_post
  #   BlogPost.new(posted_at: 1.year.from_now)
  # end
end
