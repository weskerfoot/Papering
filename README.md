## Usage

* Install `feh`
* Put your wallpapers under `$HOME/wallpapers`
* Run it like this (suggested places are in your xmonad.hs or taffybar.hs)

```
wallpaperLoop = do
  papers <- getWallPapers
  loopBackgrounds papers
  return ()
```

