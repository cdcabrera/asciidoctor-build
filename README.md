# Asciidoctor Build

Docker convenience wrapper for Asciidoctor.

## Requirements
The basic requirements:
 * [Docker](https://docs.docker.com/engine/installation/)
 * Optionally your system could be running
    - [NodeJS version 10+](https://nodejs.org/)
    - [Yarn 1.13+](https://yarnpkg.com), otherwise NPM should be adequate.
 

## Use

Using Docker, script into [Asciidoctor](https://asciidoctor.org/)...

### CLI

Asciidoctor Build is a Docker wrapper around Asciidoctor, you pass Asciidoctor options
directly through to Asciidoctor. 

#### Usage
```
  Usage: [options]
  
  Options:
    -t             Test, run "hello world" example                               [boolean]
    -f             Files, comma seperated file extensions to watch  [default: adoc,asc,md]
    -w             Watch, rebuild the src directory onchange              [default: false]
    -e             Execute, asciidoctor options call string      [default: asciidoctor -h]
```

For the full range of Asciidoctor options to "execute" you'll need to [reference the Asciidoctor docs](https://asciidoctor.org/man/asciidoctor/)

#### Docker setup

Asciidoctor Build can be found on Docker Hub...

* [Docker Hub, cdcabrera/asciidoctor-build](https://hub.docker.com/r/cdcabrera/asciidoctor-build/)

#### Example

The base Docker image comes preloaded with a "hello world" example, the basics should generate a directory/file called `dist/hellowWorld.html`

  ```shell
    $ docker pull cdcabrera/asciidoctor-build
    $ docker stop asciidoctor-build-test
    $ docker run -it --rm -v "$(pwd)/dist:/output" --name asciidoctor-build-test cdcabrera/asciidoctor-build -t
  ```

### Use within a project

#### Example

Set it up within a NPM script. Where your output is a `dist` directory and your source is a `src` directory

  ```
    "scripts": {
      "dockerAsciidoc": "docker run -it --rm -v \"$(pwd)/src:/data\" -v \"$(pwd)/dist:/output\" --name asciidoctor-build cdcabrera/asciidoctor-build",
      "example": "npm run dockerAsciidoc -w -e \"asciidoctor -t -dbook -a toc -v -o ../output/exampleOutputFileInDistDir.html ../data/exampleFileInSrcDir.adoc\"" 
    }
  ```


