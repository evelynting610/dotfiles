# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/evelynting/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;autoload -Uz compinit && compinit
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Helpful file commands
alias refbash="source ~/.zshrc"
alias zshell="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim"

# Configure terminal line
parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF='%f'
COLOR_DIR='%F{39}'
COLOR_GIT='%F{40}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '

# Note: have to start branches with JIRA number to use this.
# Ex: PLT-100_design
function tsitempr() {
    path_to_tq_repo="/Users/evelynting/[a_repo]"
    jira_from_gh_branch=$(git branch --show-current | cut -d'_' -f1)
    jira_issue_link="[$jira_from_gh_branch](https://turquoisehealth.atlassian.net/browse/$jira_from_gh_branch)"
    pr_template_with_jira=$(sed "s#\[<JIRA issue number>\]#$jira_issue_link#g" "$path_to_tq_repo/.github/pull_request_template.md")
    git push && gh pr create --title "$jira_from_gh_branch:" --body "$pr_template_with_jira" --web
}
alias tsitempr='tsitempr'
alias mpr="git push && gh pr create --title $(git branch --show-current | cut -d'_' -f1) --web"

# Python Stuff
alias itest="PIPENV_DOTENV_LOCATION=.integration_test_env pipenv run pytest"

# Django Stuff
alias dj="python manage.py"
alias dt="python manage.py test"

