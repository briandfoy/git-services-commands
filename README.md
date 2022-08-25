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

These also come with man page documentation, which `git` will find for
you when you use the `--help` option:

	$ git github --help
	$ git bitbucket --help
	$ git gitlab --help

## Installation

These are Perl programs and you need Mojolicious. If you don't already
have that, run the `cpan` target:

	$ make cpan

Then run the `install` target:

	$ make install

## Setup

Each of these services require a token of some sort, so go get those:

* [GitHub personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
* [GitLab token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)
* [Bitbucket app password](https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/)

And, set those in environment variables:

* `GITHUB_TOKEN`
* `GITLAB_TOKEN`
* `BITBUCKET_APP_PASSWORD`

On macOS, I store the secrets in the keychain then pull them out to populate
the variables:

	$ export GITHUB_TOKEN=$(security find-generic-password -a $LOGNAME -s github_token -w)

## Fancier tools

That's about it. If you want to do anything fancier, use specialized
tools:

* [gh, for GitHub](https://cli.github.com)
* [glab, for GitLab](https://glab.readthedocs.io/en/latest/)
