# SwiftySites Website

Sources for the SwiftySites [Website](https://swiftysites.diegolavalle.com/). Built with [SwiftySites](https://github.com/swiftysites/swiftysites).

## Running locally

Just clone the repo and generate the site with `swift run`.

```sh
git clone https://github.com/swiftysites/website swiftysites-website
cd swiftysites-website
swift run
```

Spin up a web server to publish the contents of _www_ locally.

```sh
python -m http.server --directory www
```

Direct your browser to http://localhost:8000/index.html to see your local version of the site.

### Side-by-side development with SwiftySites

It is possible to develop this site together with the _SwiftySites_ library in parallel. To do this create a new Xcode Workspace and drag both projects into it.

You'll be able to build as well as make modifications to each of the repositories.

## Publishing

```sh
git push publish develop:swiftysites
```
