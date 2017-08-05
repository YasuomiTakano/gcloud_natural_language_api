namespace :language do
  # 全て(感情分析,エンティティ分析,構文解析)
  desc "all(sentiment,entities,syntax)"
  task :all, [:text_content] => :environment do |task, args|
    service = LanguageServece.new
    service.sentiment_from_text(text_content: args[:text_content])
    service.entities_from_text(text_content: args[:text_content])
    service.syntax_from_text(text_content: args[:text_content])
  end

  # 感情分析
  desc "sentiment_from_text"
  task :sentiment, [:text_content] => :environment do |task, args|
    service = LanguageServece.new
    service.sentiment_from_text(text_content: args[:text_content])
  end

  # エンティティ分析
  desc "entities_from_text"
  task :entities, [:text_content] => :environment do |task, args|
    service = LanguageServece.new
    service.entities_from_text(text_content: args[:text_content])
  end

  # 構文解析
  desc "syntax_from_text"
  task :syntax, [:text_content] => :environment do |task, args|
    service = LanguageServece.new
    service.syntax_from_text(text_content: args[:text_content])
  end
end