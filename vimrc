let configs = [
      \  "plugins",
      \  "settings",
      \  "mappings",
      \  "autocommands",
      \  "plugins-settings",
      \]
for file in configs
  let x = expand("~/.vim/rc/".file.".vim")
  if filereadable(x)
    execute 'source' x
  endif
endfor
