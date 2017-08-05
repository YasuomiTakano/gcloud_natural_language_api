class LanguageServece
  require "google/cloud/language"

  def initialize
    @project_id = ENV["GOOGLE_CLOUD_PROJECT"]
  end

  # 感情分析
  def sentiment_from_text(args)
    language  = Google::Cloud::Language.new project: @project_id
    document  = language.document args[:text_content]
    sentiment = document.sentiment

    puts "===sentiment==="
    puts "Overall document sentiment: (#{sentiment.score})"
    puts "Sentence level sentiment:"

    sentiment.sentences.each do |sentence|
      sentiment = sentence.sentiment
      puts "#{sentence.text}: (#{sentiment.score})"
    end
    puts "============="
  end

  # エンティティ分析
  def entities_from_text(args)
    language = Google::Cloud::Language.new project: @project_id
    document = language.document args[:text_content]
    entities = document.entities

    puts "===entities==="
    entities.each do |entity|
      puts "Entity #{entity.name} #{entity.type}"

      if entity.metadata["wikipedia_url"]
        puts "URL: #{entity.metadata['wikipedia_url']}"
      end
    end
    puts "============="
  end

  # 構文解析
  # NOUN  : 名詞
  # VERB  : 動詞
  # ADJ   : 形容詞
  # PUNCT : 句読点
  def syntax_from_text(args)
    language = Google::Cloud::Language.new project: @project_id
    document = language.document args[:text_content]
    syntax   = document.syntax
    puts "===syntax==="
    puts "Sentences: #{syntax.sentences.count}"
    puts "Tokens: #{syntax.tokens.count}"

    syntax.tokens.each do |token|
      puts "#{token.part_of_speech.tag} #{token.text_span.text}"
    end
    puts "============="
  end
end
