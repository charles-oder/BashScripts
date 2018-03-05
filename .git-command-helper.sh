alias gitk="gitk --all&"

# Set the Developers for Git Commits
devs() {
    export DEVS=$@
}

# Set the Story Number for Git Commits
story() {
	export STORY=$1
}

tag() {
	git tag -a $1 -m "${1}"
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

retag() {
	git push --delete origin $1
	git tag --delete $1
	git tag -a $1 -m "${1}"
	git push --tags
}

pushToBranch() {
	currentBranch=$(git rev-parse --abbrev-ref HEAD)
	echo "current branch: '$currentBranch'"
	git co $1
	git merge --ff $currentBranch
	git push
	git co $currentBranch
}

clearTagsContainingStringBefore() {
	git fetch

	FILTER=$1
	echo "Filter: $FILTER"
	CUTOFF=$2
	echo "cutoff: $CUTOFF"

	comm -23 <(git tag | sort | grep $FILTER) <(git tag --contains $CUTOFF | sort | grep $FILTER) | xargs git push --delete origin

	git fetch --prune origin +refs/tags/*:refs/tags/*
}

listTagsContainingStringBefore() {
	git fetch

	FILTER=$1
	echo "Filter: $FILTER"
	CUTOFF=$2
	echo "cutoff: $CUTOFF"

	comm -23 <(git tag | sort | grep $FILTER) <(git tag --contains $CUTOFF | sort | grep $FILTER)

}

getLineStats() {
	git log --author="${1}" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

function getTotalLinesChanged() {
	ignore=$1
	author="${@:2}"
	git log --author="${author}" --pretty=tformat: --numstat | grep -v "${ignore}" | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "%s", loc }' -
}

getAuthor() {
	echo "${@:2}"
}

getCommits() {
	echo "${1}"
}

getCommitStatsIgnoring() {
	ignoreString=$1
	echo "Ignoring ${ignoreString}"
	git shortlog -s -n | 
	while read x; do 
		author=$(getAuthor $x); 
		totalLines=$(getTotalLinesChanged $ignoreString $author); 
		commits=$(getCommits $x);
		linesPerCommit=$((totalLines/commits))
		echo "${author} changed ${totalLines} lines in ${commits} commits - ${linesPerCommit} average lines per commit"; 
	done
}

foo() {
	git shortlog -s -n | awk '{
		commits = $1; 
		$1 = ""; 
		author = $0; 
		lines = system("bash -c '\'' git log -1 '\'' "); 
		printf"%s changed %s lines in %s commits\n", author, lines, commits}' -
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

backoutGit() {
	git reset --hard HEAD~
}

rebaseLastPull() {
	backoutGit
	git pull --rebase
}

resetSubmodules() {
	git submodule foreach git reset --hard
	git submodule foreach git clean -dfx
}
