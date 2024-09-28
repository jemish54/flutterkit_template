# Flutter Template Repository

This repository contains a customizable Flutter project template designed for use with the `flutterkit` CLI tool. It allows developers to quickly generate a boilerplate Flutter app using their own structure and configuration.

## Features

- **Customizable**: Easily modify the template to suit your project's needs.
- **Integration with `flutterkit` CLI**: The template can be used directly by the `flutterkit` CLI to generate a new Flutter project from a GitHub URL.
- **Boilerplate Setup**: Provides a basic project structure that follows best practices for Flutter development.

## Usage with `flutterkit` CLI

To use this repository as a template with the `flutterkit` CLI:

1. Publish your customized template code as a github repository.
2. In your terminal, run the `flutterkit generate` command with the URL to this repository:

   ```bash
   flutterkit generate <your-project-title> --url <github-repo-url>
   ```

## Customization

You can modify any part of the project to suit your requirements. The following aspects can be customized:

- **Project Structure**: Add or remove directories and files as needed.
- **Packages**: Pre-configure any necessary dependencies in the `flutterkit.yml` file.
- **Boilerplate Code**: Adjust the code templates provided in the `lib` folder to suit your app architecture.

## Example Structure

The basic structure of the template is as follows:

```
├── config
│
├── modules
│   ├── module1
│   ├── module2
│   └── modules.yml
│
├── project
│
├── flutterkit.yml
```

![Flutterkit Template Structure.png](Flutterkit%20Template%20Structure.png)

- `config` : Contains configuration files for the root project.

- `modules` : Contains the reproducible module templates inside the project.

- `project` : Contains the root project template that is generated inside lib folder.

- `flutterkit.yml` : Contains the configuration file for the `flutterkit` CLI tool.

Feel free to customize components based on your needs.
