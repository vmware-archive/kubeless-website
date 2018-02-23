[![Build Status](https://travis-ci.org/kubeless/kubeless-website.svg?branch=master)](https://travis-ci.org/kubeless/kubeless-website)

# Kubeless site

This repository contains the [kubeless.io](http://kubeless.io) source code. We use [middleman](https://middlemanapp.com) to generate the final HTML code.

We recommend you the [middlemant documentation site](https://middlemanapp.com/basics/install/). There you will find useful tutorials, videos and advanced configuration guides.

## Structure

This project follows the basic structure of `middleman` projects. All the files related to the site generation are located in the `source` folder. In this folder, we can find the following files and folders:

* **assets**: it includes all the files related to the frontend. Here we will place images, styles and javascript files.
* **layouts**: these are the `middleman` layouts. It defines the basic layout for all the pages but you can create new ones if it's required. Also, we use partials to reduce the HAML code in main layout.
* **x.html.md**: All the pages of the site, written in markdown.

To define custom data to inject to the project we can use the `data` folder. It also includes an YAML example file with some links to Bitnami products. You have more information about custom data in the [middleman documentation](https://middlemanapp.com/advanced/data-files/).

If you need to add any Ruby code to the project, you can create the files in the `lib` folder. These files will be load automatically by middleman. The middlman documentation includes more information about [helpers](https://middlemanapp.com/basics/helper-methods/) and [external ruby dependencies](https://middlemanapp.com/basics/directory-structure/#lib-directory).

Once we build the project, all the files will be placed in the `build` folder. These files can be served directly in server.

## Configuration

All the middleman configuration is present in the [config.rb file](https://github.com/kubeless/kubeless.github.io/blob/master/config.rb). As you can see, the file is very simple. This is intentional because every project is different and it will require a different configuration. The config file only applies the common configuration of all our projects.

## Development

To start the development server execute the following command:

```
docker-compose up -d
```

The example site will be available on [http://localhost:4567](http://localhost:4567). The domain can change depending on your docker configuration. If you're using docker in a virtual machine, please check the [Docker Machine section](#docker-machine).

All the changes you perform in the `config.rb` file and the `source` folder will be applied directly. Once you reload the page, the changes will appear.

### Docker Machine

If you're running `docker` in a virtual machine, the URL of the project will be [http://VIRTUAL_MACHINE_IP:4567](http://VIRTUAL_MACHINE_IP:4567). Remember to change the `VIRTUAL_MACHINE_IP` placeholder with the IP of your virtual machine.

## Deployment

This project is deployed through [Travis CI](https://travis-ci.org/kubeless/kubeless.github.io) and it uses [GitHub pages](https://pages.github.com/) as hosting. On every commit in `master`, the site is deployed automatically.

## Docs

The documentation pages are generated on the fly when running `middleman`. In the file [`config.rb`](./config.rb) we obtain the latest tag available (or we use a hardcoded commit) for checking out the kubeless submodule that is at `kubeless-src`.

After that the files under `kubeless-src/docs/*md` are copied into the `source/docs/` folder adding the `middleman` frontmatter. The folders `kubeless-src/docs/img` and `kubeless-src/docs/misc` are copied as well.

The links for the different documentation pages are manually set in the file `source/layouts/partials/_links.html.haml`.
