# Set the Developers for Git Commits
devs() {
    export DEVS=$@
}

# Set the Story Number for Git Commits
story() {
	export STORY=$1
}

getMessage() {
	if [ -n "${STORY}" ]; then
		MS="$STORY - "
	else
		MS=""
	fi

	if [ -n "${DEVS}" ]; then
		echo "$MS$@ [$DEVS]"
	else
		echo "$MS$@"
	fi
}

# Check in all staged files with the generated message
ci() {
    git commit -m "$(getMessage $@)"
}

# Check in all files with the generated message
cia() {
	git add -A
    ci $@
}

rb_start() {
	git rebase -i $1
}

rb_continue() {
	git rebase --continue
}

rb_author() {
	git commit --amend --reset-author
}

# ammend a commit
amend() {
    git commit --amend --no-edit
}
