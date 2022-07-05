(module plugins.tree)

(def- view {:width 25
            :height 25
            :side "left"
            :number false
            :relativenumber false
            :signcolumn "yes"})

(let [(ok? tree) (pcall require :nvim-tree)]
  (when ok?
    (tree.setup {:sort_by :case_sensitive
                 :view view
                 :renderer {:group_empty true}
                 :actions {:open_file {:resize_window true}}
                 :filters {:dotfiles true}})))
