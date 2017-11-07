# kubeless.io website

## Middleman boilerplate

This website is based on a middleman boilerplate, [See full doc](https://github.com/bitnami/middleman-boilerplate)

## Development

Website Source is in the `develop` branch. (Because master must be the github pages source)

```
git checkout develop
```

To start the development server execute the following command:

```
bundle install
bundle exec middleman server
```

The website is running on [http://localhost:4567](http://localhost:4567)

## Publish to Github Pages

```
bundle exec mgd --branch master
```
