(module autocmd
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(def- group (nvim.create_augroup :K {:clear true}))

(defn- autocmd [name opts]
  (nvim.create_autocmd name (a.merge! {:group group} opts)))

(autocmd :TextYankPost {:callback (lambda [] (vim.highlight.on_yank {:timeout 300}))})
(autocmd :BufWritePre {:callback (lambda [] (nvim.command ":%s/\\s\\+$//e"))})
