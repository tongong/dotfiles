" https://habamax.github.io/2019/03/07/vim-markdown-frontmatter.html
" for pandoc YAML headers
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
