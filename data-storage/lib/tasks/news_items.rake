require "news-api"

namespace :news_items do
  desc "Fetch news items"
  task fetch: :environment do
    newsapi = News.new(ENV["NEWS_API_KEY"])

    tomorrow = (Date.today - 1.day).strftime("%Y-%m-%d")
    today = Date.today.strftime("%Y-%m-%d")

    all_articles = newsapi.get_everything(
      sources: "bbc-sport",
      from: tomorrow.to_s,
      to: today.to_s
    )

    all_articles.each do |article|
      NewsItem.create(
        title: article.title,
        description: article.description,
        author: article.author,
        url: article.url,
        url_to_image: article.urlToImage,
        published_at: article.publishedAt
      )
    end
  end
end
