if status is-interactive
    cat /home/fc/.cache/wal/sequences
end
load_nvm > /dev/stderr

# Conda setup
set -gx CONDA_EXE "$HOME/miniconda3/bin/conda"
set -gx _CONDA_ROOT "$HOME/miniconda3"
set -gx _CONDA_EXE "$HOME/miniconda3/bin/conda"

if test -f "$_CONDA_EXE"
    eval "$_CONDA_EXE" shell.fish hook | source
    conda deactivate  # Immediately deactivate if base was activated
end

# opencode
fish_add_path /home/fc/.opencode/bin
