if status is-interactive
    # Commands to run in interactive sessions can go here

    # Modules
    zoxide init fish | source
    starship init fish | source

    # Abbreviations
    abbr -a v nvim
    abbr -a ape source .venv/bin/activate.fish
    abbr -a ls ls -l

    set -gx ZK_NOTEBOOK_DIR "$HOME/wiki"
end
