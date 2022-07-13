(module plugin.treesitter)

(let [(ok? ts) (pcall require :nvim-treesitter.configs)]
  (when ok?
    (ts.setup
      {:ensure_installed ["lua" "cpp" "c" "python" "fennel" "json" "javascript" "yaml"]
       :sync_install false
       :indent {:enable false}
       :highlight {:enable true
                   :additional_vim_regex_highlighting false}})))
