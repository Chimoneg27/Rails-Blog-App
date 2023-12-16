# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [API Usage](#api-usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 Rail-blog-app<a name="about-project"></a>

**Rail-blog-app**: Is a blog app built with Ruby on Rails. It allows users to create articles and comment on them. It also allows users to sign up and sign in to the app.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Ruby on Rails</summary>
<ul>
  <li>Ruby</li>
  <li>Ruby</li>
</ul>
</details>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Key Features <a name="key-features"></a>

- **Ruby on Rails**
- **Creating a data model**
- **Functional website**
- **Unit testing**
- **Database**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites
> You need the following tools be installed in your computer:
>
> - [Git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
> - [Ruby](https://github.com/microverseinc/curriculum-ruby/blob/main/simple-ruby/articles/ruby_installation_instructions.md)
> - [Rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)


### Setup
1. Download the `Zip` file or **Clone the repo with**:

```bash
git clone https://github.com/Chimoneg27/Rails-Blog-App.git
```

2. To access the project directory

```bash
cd rail-blog-app
```
### Run the App

```bash
rails s
```

```
Check http://localhost:3000/ in your browser
```
### Run Test

- To run models tests
```bash
rspec
```

### API Usage

- To use the API version make sure to set the header `Accept` to `application/json` and the header `Content-Type` to `application/json` for all requests.

refer to this discussion for more details [API](https://github.com/rails/rails/issues/25005)

- To create a comment send a `POST` request to `/users/:user_id/posts/:post_id/comments` with http authorization header set to `YOUR_API_TOKEN` which you can get from your profile page. The body of the request should be a JSON object in the following format:

```json
{
  "text": "comment content"
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👥 Author <a name="author"></a>

👤 **Garvin Chimone**

- GitHub: [@Chimoneg27](https://github.com/Chimoneg27)
- Twitter: [@GarvinChimone](https://twitter.com/GarvinChimone)
- LinkedIn: [Garvin Chimone](https://www.linkedin.com/in/garvin-chimone-37208924a/)

👤 **Eric Delali Mawudeku**

- GitHub: [@erickma1](https://github.com/erickma1)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name='future-features'></a>

- [ ]  Validations and Model specs.
- [ ]  Add more features to the app.
- [ ]  Add more tests.
- [ ]  Add more styling.
- [ ] Add more features to the app.
- [ ]  Add more tests.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

### Contributions, issues, and feature requests are welcome!

Feel free to check [issues page](https://github.com/Chimoneg27/Rails-Blog-App/issues).

## ⭐️ Show your support <a name="support"></a>

If you like this project, kindly drop a start ⭐️ for the [repository](https://github.com/Chimoneg27/Rails-Blog-App);

<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

**I would like to thank the following individuals and organizations for their contribution to this project.**

- I would like to express my heartfelt gratitude to Microverse for giving me this opportunity to learn and build this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>