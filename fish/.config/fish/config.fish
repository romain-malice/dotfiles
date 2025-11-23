if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
    starship init fish | source
    abbr -a v nvim
    abbr -a ape source ./.venv/bin/activate
end
