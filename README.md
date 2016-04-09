# Assignment

The app is based on Ruby on Rails web framework.

  - Ruby version -2.1.5
  - Rails version 4.2

> "Github-api" gem available for Ruby on Rails is used to extract the number of issues from a particular repository.

# Method:

* The user provides the link for the repository from which the number of issues has to be extracted.
* The user name and repository name is extracted from the link provided.
* Personal OAuth_token provided by github is used to authentication for extracting the data.
* Github.search.issues function is called which takes string which inclueds the following parameters.
   - type: issue (for extracting only issue and not pull request)
   - repo: username/repository_name
   - state: open (for extracting open issues)
   - created: >=timestamp (extracting issues created after timestamp)

* Extracted data is stored in an instance variable and then the data is displayed using html.
* Compiled app was deployed in heroku.

Heroku app link: [sanket_assignment]

[sanket_assignment]: <https://shrouded-escarpment-34552.herokuapp.com/>




