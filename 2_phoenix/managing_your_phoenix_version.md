# Managing your Phoenix version

The (initial) version of your phoenix project is determined by the version of the Phoenix application generator. A generator with version `1.7` will generate a Phoenix application with version `1.7`.

To install a specific version of the application generator use the following command:

```bash
mix archive.install hex phx_new <version>
```

## Version for this course

All the material in this course is written for Phoenix `1.6.16`. We advise you to install this version of the Phoenix application generator so that you can use the examples in this repository.

```bash
mix archive.install hex phx_new 1.6.16
```

After installing the generator for version `1.6.16`, generate a new project with the installed generator. This project will have Phoenix with version `1.6.16` included.