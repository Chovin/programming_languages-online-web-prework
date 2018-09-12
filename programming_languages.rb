languages = {
  :oo => {
    # :ruby => {
    #   :type => "interpreted"  # => "interpreted"
    # },                        # => {:type=>"interpreted"}
    :javascript => {
      :type => "interpreted"  # => "interpreted"
    },                        # => {:type=>"interpreted"}
    # :python => {
    #   :type => "interpreted"  # => "interpreted"
    # },                        # => {:type=>"interpreted"}
    # :java => {
    #   :type => "compiled"     # => "compiled"
    # }                         # => {:type=>"compiled"}
  },                          # => {:ruby=>{:type=>"interpreted"}, :javascript=>{:type=>"interpreted"}, :python=>{:type=>"interpreted"}, :java=>{:type=>"compiled"}}
  :functional => {
    # :clojure => {
    #   :type => "compiled"     # => "compiled"
    # },                        # => {:type=>"compiled"}
    # :erlang => {
    #   :type => "compiled"     # => "compiled"
    # },                        # => {:type=>"compiled"}
    # :scala => {
    #   :type => "compiled"     # => "compiled"
    # },                        # => {:type=>"compiled"}
    :javascript => {
      :type => "interpreted"  # => "interpreted"
    }                         # => {:type=>"interpreted"}

  }                                               # => {:clojure=>{:type=>"compiled"}, :erlang=>{:type=>"compiled"}, :scala=>{:type=>"compiled"}, :javascript=>{:type=>"interpreted"}}
}                                                 # => {:oo=>{:ruby=>{:type=>"interpreted"}, :javascript=>{:type=>"interpreted"}, :python=>{:type=>"interpreted"}, :java=>{:type=>"compiled"}}, :functional=>{:clojure=>{:type=>"compiled"}, :erlang=>{:type=>"compiled"}, :scala=>{:type=>"compiled"}, :javascript=>{:type=>"interpreted"}}}
def reformat_languages(languages)
  languages.reduce({}) do |hash, (style, langs)|  # => {:oo=>{:ruby=>{:type=>"interpreted"}, :javascript=>{:type=>"interpreted"}, :python=>{:type=>"interpreted"}, :java=>{:type=>"compiled"}}, :functional=>{:clojure=>{:type=>"compiled"}, :erlang=>{:type=>"compiled"}, :scala=>{:type=>"compiled"}, :javascript=>{:type=>"interpreted"}}}
    langs.each do |lang, attrs|                   # => {:ruby=>{:type=>"interpreted"}, :javascript=>{:type=>"interpreted"}, :python=>{:type=>"interpreted"}, :java=>{:type=>"compiled"}}, {:clojure=>{:type=>"compiled"}, :erlang=>{:type=>"compiled"}, :scala=>{:type=>"compiled"}, :javascript=>{:type=>"interpreted"}}
      lang                                        # => :ruby,                                 :javascript,                           :python,                               :java,                              :clojure,                                   :erlang,                                    :scala,                                     :javascript
      hash[lang]                                  # => nil,                                   nil,                                   nil,                                   nil,                                nil,                                        nil,                                        nil,                                        {:type=>"interpreted"}
      (hash[lang] ||= Hash[attrs])                # => {:type=>"interpreted"},                {:type=>"interpreted"},                {:type=>"interpreted"},                {:type=>"compiled"},                {:type=>"compiled"},                        {:type=>"compiled"},                        {:type=>"compiled"},                        {:type=>"interpreted"}
      hash[lang]                                  # => {:type=>"interpreted"},                {:type=>"interpreted"},                {:type=>"interpreted"},                {:type=>"compiled"},                {:type=>"compiled"},                        {:type=>"compiled"},                        {:type=>"compiled"},                        {:type=>"interpreted"}
      (hash[lang][:style] ||= []                  # => [],                                    [],                                    [],                                    [],                                 [],                                         [],                                         [],                                         []
      ) << style                                  # => [:oo],                                 [:oo],                                 [:oo],                                 [:oo],                              [:functional],                              [:functional],                              [:functional],                              [:functional]
      hash[lang]                                  # => {:type=>"interpreted", :style=>[:oo]}, {:type=>"interpreted", :style=>[:oo]}, {:type=>"interpreted", :style=>[:oo]}, {:type=>"compiled", :style=>[:oo]}, {:type=>"compiled", :style=>[:functional]}, {:type=>"compiled", :style=>[:functional]}, {:type=>"compiled", :style=>[:functional]}, {:type=>"interpreted", :style=>[:functional]}
    end                                           # => {:ruby=>{:type=>"interpreted"}, :javascript=>{:type=>"interpreted"}, :python=>{:type=>"interpreted"}, :java=>{:type=>"compiled"}}, {:clojure=>{:type=>"compiled"}, :erlang=>{:type=>"compiled"}, :scala=>{:type=>"compiled"}, :javascript=>{:type=>"interpreted"}}
  end                                             # => {:clojure=>{:type=>"compiled"}, :erlang=>{:type=>"compiled"}, :scala=>{:type=>"compiled"}, :javascript=>{:type=>"interpreted"}}
end                                               # => :reformat_languages

reformat_languages languages  # => {:clojure=>{:type=>"compiled"}, :erlang=>{:type=>"compiled"}, :scala=>{:type=>"compiled"}, :javascript=>{:type=>"interpreted"}}

a = {}                 # => {}
a["hi"] = [3]          # => [3]
(a["hi"] ||= []) << 4  # => [3, 4]
a                      # => {"hi"=>[3, 4]}
