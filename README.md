[![Build Status](https://travis-ci.org/harold29/altoros.png?branch=master)](https://travis-ci.org/harold29/altoros) [![Coverage Status](https://coveralls.io/repos/github/harold29/altoros/badge.svg?branch=master)](https://coveralls.io/github/harold29/altoros?branch=master)


# Altoros - Test

**Heroku**: https://altoros-test.herokuapp.com

**Tenant API_KEY**: 4415c2d1b9555b28112f3b776ce9ee37

**Requests:**

Questions
`https://altoros-test.herokuapp.com/questions?api_key=[api_key]&q=[query]`

Specific Question
`https://altoros-test.herokuapp.com/questions/[question_id]?api_key=[api_key]`

You can also send the api_key as a header.

To get the dashboard page:

`https://altoros-test.herokuapp.com`

Please run:

```
bundle install
rake db:create db:migrate db:seed
```
