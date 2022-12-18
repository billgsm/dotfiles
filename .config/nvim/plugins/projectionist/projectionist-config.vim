let g:projectionist_heuristics = {
      \   "bin/console": {
      \     "src/**/*.php": {
      \        "alternate": [
      \          "tests/Unit/{dirname}/{basename}Test.php",
      \        ],
      \        "type": "source",
      \     },
      \     "tests/Unit/**/*Test.php": {
      \        "alternate": [
      \          "src/{dirname}/{basename}.php",
      \        ],
      \        "type": "test",
      \     },
      \   }
      \ }
