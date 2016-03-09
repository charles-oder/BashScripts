#Create a string showing pending git changes
function count_changed_files {
	git status | grep 'modified:' | wc -l | tr -d ' '
}
function count_new_files {
	git status | grep 'new file:' | wc -l | tr -d ' '
}
function count_deleted_files {
	git status | grep 'deleted:' | wc -l | tr -d ' '
}
function count_untracked_files {
	git clean -n | wc -l | tr -d ' '
}
function git_status_summary {
	if [ $(count_changed_files) != "0" ]; then
		str="$str~$(count_changed_files) ";
	fi
	if [ $(count_new_files) != "0" ]; then
		str="$str+$(count_new_files) ";
	fi
	if [ $(count_deleted_files) != "0" ]; then
		str="$str-$(count_deleted_files)";
	fi
	if [ $(count_untracked_files) != "0" ]; then
		str="$str?$(count_untracked_files)";
	fi
	if [ "$str" != "" ]; then 
		str=": $str"
	fi
	echo $str
}
function make_prompt {
	if [ "$(is_git_dir)" == "true" ]; then
		echo " ($(__git_ps1"$s")$(git_status_summary"$s"))";
	fi;
}
function is_git_dir {
	git rev-parse --is-inside-work-tree 2>&1
}

export PS1='\W$(make_prompt"$s"): '
