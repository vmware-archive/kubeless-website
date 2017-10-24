<p align="center">
  <img width="350" src="https://user-images.githubusercontent.com/4056725/31936391-c0e464b6-b8b1-11e7-845b-330bf28b6376.png" />
</p>

At [Bitnami](https://bitnami.com) we use [middleman](https://middlemanapp.com) to create static sites for our products. From simple sites to complex static applications, `middleman` fits all our requirements.

For this reason, we've created this boilerplate with the basic configuration of our static site projects. This boilerplate includes:

* Basic middleman configuration
* Folder structure
* Javascript example file
* CSS example structure
* Bitnami Design System
* HAML template engine
* A `Dockerfile` and a `docker-compose` file to run the project with one command

We recommend you the [middlemant documentation site](https://middlemanapp.com/basics/install/). There you will find useful tutorials, videos and advanced configuration guides.

## Structure

This boilerplate follows the basic structure of `middleman` projects. All the files related to the site generation are place in the `source` folder. In this folder, we can find the following files and folders:

* **assets**: it includes all the files related to the frontend. Here we will place images, styles and javascript files.
* **layouts**: these are the `middleman` layouts. It defines the basic layout for all the pages but you can create new ones if it's required. Also, we use partials to reduce the HAML code in main layout.
* **about.html.md**: an example page written in Markdown.
* **index.html.haml**: an example page written in HAML.

To define custom data to inject to the project we can use the `data` folder. It also includes an YAML example file with some links to Bitnami products. You have more information about custom data in the [middleman documentation](https://middlemanapp.com/advanced/data-files/).

If you need to add any Ruby code to the project, you can create the files in the `lib` folder. These files will be load automatically by middleman. The middlman documentation includes more information about [helpers](https://middlemanapp.com/basics/helper-methods/) and [external ruby dependencies](https://middlemanapp.com/basics/directory-structure/#lib-directory).

Once we build the project, all the files will be placed in the `build` folder. These files can be served directly in server.

## Configuration

All the middleman configuration is present in the [config.rb file](https://github.com/bitnami/middleman-boilerplate/blob/master/config.rb). As you can see, the file is very simple. This is intentional because every project is different and it will require a different configuration. The config file only applies the common configuration of all our projects.

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

The deployment will depend on how you want to serve your static files. There are a lot of options to do this:

* A personal server
* [Netlify](https://www.netlify.com/)
* [Surge](http://surge.sh/)
* [GitHub pages](https://pages.github.com/)
* ...

This project is served using GitHub Pages. However, some of our static sites are provided using [Kubernets](https://kubernetes.io/). As you can see, the options are unlimited.

## Contributing

Feel free to fork this project and play with the boilerplate. If you think that something is wrong or an important part is missing, you can open an [Issue](https://github.com/bitnami/middleman-boilerplate/issues/new) or create a [Pull Request](https://github.com/bitnami/middleman-boilerplate/compare).
