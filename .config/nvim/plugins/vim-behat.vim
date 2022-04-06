Plug 'veloce/vim-behat'

let g:feature_filetype='behat'
let g:behat_executables = ['docker-compose exec php ./tests/Functional/behat/vendor/bin/behat']
let b:behat_cmd_args = '-c behat.yml.dist'
