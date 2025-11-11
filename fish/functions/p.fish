function p
    set -l project_roots "/home/fc/code"

    # Find all subdirectories within the defined project roots
    # and pipe them to fzf for interactive selection.
    set -l selected_project (find $project_roots -maxdepth 2 -type d | fzf --exact)
    if test -n "$selected_project"
        cd "$selected_project"
    end
end
