def reformat_languages(languages)
  languages.reduce({}) do |hash, (style, langs)|  # => {:oo=>{:javascript=>{:type=>"interpreted"}}, :functional=>{:javascript=>{:type=>"interpreted"}}}
    langs.each do |lang, attrs|                   # => {:javascript=>{:type=>"interpreted"}},                {:javascript=>{:type=>"interpreted"}}
      hash[lang] ||= Hash[attrs]                  # => {:type=>"interpreted"},                               {:type=>"interpreted", :style=>[:oo]}
      (hash[lang][:style] ||= []) << style        # => [:oo],                                                [:oo, :functional]
    end                                           # => {:javascript=>{:type=>"interpreted"}},                {:javascript=>{:type=>"interpreted"}}
    hash                                          # => {:javascript=>{:type=>"interpreted", :style=>[:oo]}}, {:javascript=>{:type=>"interpreted", :style=>[:oo, :functional]}}
  end                                             # => {:javascript=>{:type=>"interpreted", :style=>[:oo, :functional]}}
end                                               # => :reformat_languages
