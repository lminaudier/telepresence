#!/bin/bash
# Run the release!
set -e

# Store the SSH key used to push to github.com/datawire/homebrew-blackbird; this
# key is set as environment variable on Travis repo:
echo $HOMEBREW_KEY > packaging/homebrew.rsa

# Add ssh keys we need to push to github.com/datawire/homebrew-blackbird:
eval $(ssh-agent)
ssh-add packaging/homebrew.rsa

# Run the release:
make release