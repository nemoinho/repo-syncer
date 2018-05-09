# repo-syncer
A simple docker container to synchonize 2 git repos.

# Usage
The service fetches from one repository indicated by the environment-variable $ORIGIN and puches to a repository $REMOTE. To be able to handle ssh-connections it needs read-only access to an id_rsa-file.

    docker run --rm -d \
        -v $HOME/.ssh/id_rsa:/ssh-template/id_rsa:ro \
        -e ORIGIN=git@github.com:nemoinho/repo-syncer.git \
        -e REMOTE=git@github.com:nemoinho/another-repo.git \
        nemoinho/repo-syncer

# Important notes

1. Only SSH-based connections are supported right now
2. The provided key-file can't have a passphrase at the moment
3. Both repositories has to be accesible via one ssh-key
