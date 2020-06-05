# custom prompt: "123ms ~/foo/bar (master±) ~> "

# git+fish settings
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# git+fish status symbols
set __fish_git_prompt_char_dirtystate '±'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function _long_pwd
    echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
end

function fish_prompt
    set -l last_status $status

    if set -q VIRTUAL_ENV
        echo -n "("(basename $VIRTUAL_ENV)") "
    end

    if test $last_status -ne 0
        set_color red
        echo -n "! "
        set_color normal
    end

    if test $CMD_DURATION -lt 1000
        set unit "ms"
        set duration $CMD_DURATION
    else if test $CMD_DURATION -lt 60000
        set unit "s"
        set duration (math -s3 $CMD_DURATION / 1000)
    else
        set unit "min"
        set duration (math -s3 $CMD_DURATION / 60000)
    end

    set_color blue
    echo -n $duration$unit" "
    set_color normal
    set_color green
    echo -n (_long_pwd)
    set_color normal
    echo -n (__fish_git_prompt)
    echo -n " ~> "
end
