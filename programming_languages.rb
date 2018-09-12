def reformat_languages(languages)
  languages.reduce({}) do |hash, (style, langs)|
    langs.each do |lang, attrs|
      hash[lang] ||= Hash[attrs]
      (hash[lang][:style] ||= []) << style
    end
    hash
  end
end
