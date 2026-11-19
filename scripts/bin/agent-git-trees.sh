#!/usr/bin/env zsh
# Taken from https://gist.github.com/dhh/18575558fc5ee10f15b6cd3e108ed844

# Create a new worktree and branch from within current git directory.
ga() {
    if [[ -z "$1" ]]; then
        echo "Usage: ga <branch> [base-branch]"
        return 1
    fi

    local branch="$1"
    local base_branch="${2:-}"
    local base="$(basename "$PWD")"
    local worktree_path="../${base}--${branch}"

    if [[ -n "$base_branch" ]]; then
        git worktree add -b "$branch" "$worktree_path" "$base_branch"
    else
        git worktree add -b "$branch" "$worktree_path"
    fi
    if $(command -v mise); then
        mise trust "$worktree_path"
    fi
    cd "$worktree_path"
}

# Remove worktree and branch from within active worktree directory.
gd() {
    if gum confirm "Remove worktree and branch?"; then
        local cwd base branch root

        cwd="$(pwd)"
        worktree="$(basename "$cwd")"

        # split on first `--`
        root="${worktree%%--*}"
        branch="${worktree#*--}"

        # Protect against accidentially nuking a non-worktree directory
        if [[ "$root" != "$worktree" ]]; then
            cd "../$root"
            git worktree remove "$worktree" --force
            git branch -D "$branch"
        fi
    fi
}
