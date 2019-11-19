# Mirror

This action, together with `actions/checkout` allows you to mirror a specific branch from your repository with that of another via ssh.

This is equivalent to adding a new remote to your repo and force pushing to a specific branch of the remote.

## Usage

See [action.yml](action.yml)

```yaml
steps:
  - uses: actions/checkout@v1.1.0
    with:
      ref: master # Source branch you want to mirror
  - uses: dreipol/git-mirror-action@master
    env:
      SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
    with:
      repo: git@foo.bar/your-repo
      user: your@ssh.user
      target_branch: master # Defaults to master, so you could leave this away
```

Read more about how to [create and use encrypted secrets](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets).

## Why another mirror action?
There are already [a](https://github.com/marketplace?utf8=%E2%9C%93&query=mirror) [few](https://github.com/wearerequired/git-mirror-action) [good](https://github.com/pixta-dev/repository-mirroring-action) actions out there but none allow you to only mirror a specific branch.


