# Docker Exercism 'Python' Track Image
An Exercism 'python' track docker image that can be used to work through the
'python' language track exercises.

## Overview
This project uses a Dockerfile and Makefile to manage the creation and
distribution of an Exercism 'python' track docker image.

The image is based on *debian 9* and has some basic dev tools installed.

The image has *exercism* tools installed under the /root user account. It is
expected that when the container is run you will use the -v option to mount a
local folder to ```~/.config/exercism``` for configuration data and
```~\exercism``` for the language track files.

The image has *pyenv* installed and uses it to install, python 2.7, 3.7, 3.6 and
3.5. All of the python distributions are enabled via pyenv and can be used by
specifiying the version of python when being run. For example if you run ```$
python``` you will be running python 2.7. if you run ```$ python3``` you will
be running python 3.7. If you want ver 3.5, run ```$ python3.5```.


## Usage
To build the image

```
$ make build
```

To push the built image

```
$ make push
```

To login to docker hub

```
$ make login
```

To run the image

```
$ make run
```

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of
conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available,
see the [tags on this repository](https://github.com/mrxcitement/exercism-base/tags). 

## Authors

* **Mike Barker** - *Initial work* - [MrXcitement](https://github.com/mrxcitement)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

