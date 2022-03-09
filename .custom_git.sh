function git-commit() {
		git add .
		git commit -m "$1"
		git push
}

function git-clean() {
		git checkout main
		git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
		git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '{sub("refs/heads/", "", $1); print $1}'); do git checkout $branch; git pull; done
}
