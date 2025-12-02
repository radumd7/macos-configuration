# Load all tmuxifier sessions; if you give a name, switch to it, otherwise just load
tmall() {
	local sessions=() # Add sessions here
	local session

	# 1) Load each hard-coded session detached & quiet
	for session in "${sessions[@]}"; do
		nohup zsh -lc "tmuxifier load-session $session" </dev/null &>/dev/null
	done
	wait
}

tmall
