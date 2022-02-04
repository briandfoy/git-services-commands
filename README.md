# Commands for Git Services

I often keep my git repos on several services in case I lose access
to one of them. Instead of going to each website, or using different
tools for each, I created some `git` commands to do it for me.

	$ git github
	$ git bitbucket
	$ git gitlab

This is the same thing as specifying the default action, `--create`:

	$ git github --create
	$ git bitbucket --create
	$ git gitlab --create

This also inits the repo, sets up a remote with name of the repo, and
pushes the repo.

There are some other options:

	$ git gitlab --create --repo REPO --user USER --no-init

Or, to get rid of them, because sometimes I'm playing with things that
make repos and I want to do it over and over:

	$ git github --delete
	$ git bitbucket --delete
	$ git gitlab --delete

That's about it. If you want to do anything fancier, use specialized
tools:

* [gh, for GitHub](https://cli.github.com)
* [glab, for GitLab](https://glab.readthedocs.io/en/latest/)
