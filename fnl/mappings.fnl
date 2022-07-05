(module mappings
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

(defn- map [mode from to]
  (nvim.set_keymap mode from to {:noremap true :silent true}))

(def- nmap (partial map "n"))
(def- xmap (partial map "x"))

(nmap "<Leader>h" ":wincmd h<CR>")
(nmap "<Leader>j" ":wincmd j<CR>")
(nmap "<Leader>k" ":wincmd k<CR>")
(nmap "<Leader>l" ":wincmd l<CR>")

(nmap "<C-n>" ":NvimTreeToggle<CR>")

(nmap "J" ":m .+1<CR>==")
(nmap "K" ":m .-2<CR>==")

(xmap "K" ":move '<-2<CR>gv=gv")
(xmap "J" ":move '>+1<CR>gv=gv")
