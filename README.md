###  use example:

```yaml
- name: git_push
	image: backnero/drone-bash-git-push
	settings:
		key:
			from_secret: ssh-key
		branch: master
		path: dist
		remote: git@git.github.com:abc.git
```


