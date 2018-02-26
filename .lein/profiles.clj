{:user {
        :deploy-repositories [
                              ["clojars" {:signing {:gpg-key "Martin Hynar <martin.hynar@gmail.com>"}}]
                              ["releases" {:signing {:gpg-key "AFA92C11"}}]
                              ]
        :plugins [
                  [venantius/ultra "0.5.1"]
                  [lein-ancient "0.6.1"]
                  [lein-localrepo "0.5.3"]
                  [lein-pprint "1.1.2"]
                  ]
        :ultra {:color-scheme :solarized_dark
                :repl         true
                :stacktraces  true
                :tests        true
                :java         false}}}
