function atuin-setup
    if not type -q atuin
        return
    end

    bind \ce _atuin_search_widget

    set -x ATUIN_NOBIND "true"
    atuin init fish | source

    function fzf-atuin-history-widget
        set -l selected
        set -l cmd_query (commandline)

        set selected (atuin search --cmd-only --limit (set -q ATUIN_LIMIT; and echo $ATUIN_LIMIT; or echo 5000) | 
            fzf --height 40% -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore --query="$cmd_query" +m --reverse)

        if test $status -eq 0
            commandline --replace -- $selected
        end

        commandline -f repaint
    end

    bind \cr fzf-atuin-history-widget
end
