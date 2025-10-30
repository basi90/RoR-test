require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    assert draft_blog_post.draft?
  end

  test "draft? returns false for posted blog post" do
    refute posted_blog_post.draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute scheduled_blog_post.draft?
  end

  test "posted? returns false for draft blog post" do
    refute draft_blog_post.posted?
  end

  test "posted? returns true for posted blog post" do
    assert posted_blog_post.posted?
  end

  test "posted? returns false for scheduled blog post" do
    refute scheduled_blog_post.posted?
  end

  test "scheduled? returns false for draft blog post" do
    refute draft_blog_post.scheduled?
  end

  test "scheduled? returns true for posted blog post" do
    refute posted_blog_post.scheduled?
  end

  test "scheduled? returns false for scheduled blog post" do
    assert scheduled_blog_post.scheduled?
  end

  def draft_blog_post
    BlogPost.new(posted_at: nil)
  end

  def posted_blog_post
    BlogPost.new(posted_at: 1.year.ago)
  end

  def scheduled_blog_post
    BlogPost.new(posted_at: 1.year.from_now)
  end
end
