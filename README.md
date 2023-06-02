<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<h3 align="center">Tea Subscription API</h3>

<p align="center">
  An API built on the Rails API framework. This API provides endpoints to create a customer, add a subscription to a customer, and add teas to a customer's subscription. (refer to <a href="#database-schema">Schema</a>)
  <br>
  <a href="https://github.com/DMTimmons1/tea_sub_api/issues">Report Bug</a>
  ·
  <a href="https://github.com/DMTimmons1/tea_sub_api/issues">Request Feature</a>
</p>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#testing-with-rspec">Testing With RSpec</a></li>
      </ul>
    </li>
    <li><a href="#restful-endpoints">RESTful Endpoints</a></li>
    <li><a href="#database-schema">Database Schema</a></li>
    <li><a href="#goals">Goals</a></li>
    <li><a href="#project-by">Credits</a></li>
  </ol>
</details>

<br>

### Built With:

* [![Ruby]][Ruby-url] **3.1.1**
* [![Rails]][Rails-url] **7.0.4**
* [![Postgresql]][Postgresql-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

This is a Ruby on Rails application which establishes API endpoints to be called in a front-end application. To run the `tea_sub_api` locally, please follow the installation instructions below. Endpoints can then be called in an application like <a href="https://www.postman.com/">Postman</a>.

<br>

### Installation

1. Clone the repo:
   ```bash
   git clone git@github.com:DMTimmons1/tea_sub_api.git
   ```

2. Install gems:
   ```bash
   bundle install
   ```

3. To establish the database, run:
   ```bash
   rails db:create
   ```

4. Since this is the back-end repository, a database migration is also necessary, run:
   ```bash
   rails db:migrate
   ```
<br>

  Inspect the `/db/schema.rb` and compare to the <a href="#database-schema">Schema</a> section below to ensure this migration has been done successfully.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

### Testing with RSpec

Once `tea_sub_api` is correctly installed, run tests locally to ensure the repository works as intended.

<br>

  To test the entire RSpec suite, run:
   ```bash
   bundle exec rspec
   ```

<br>

All tests should be passing if the installation was successful. 

If any tests are not passing, please report which tests are not passing <a href="https://github.com/DMTimmons1/tea_sub_api/issues">Here</a>. An update/fix will be issued as soon as possible!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## RESTful Endpoints

Base url to reach the endpoints listed (locally):
```
http://127.0.0.1:3000/api/v1/
```

<details close>
<summary> All Endpoints </summary>

<br>

### Get All Customers

```http
GET /customers/
```

<details close>
<summary>  Details </summary>

<br>

Request Parameters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": [
        {
            "id": "1",
            "type": "customer",
            "attributes": {
                "first_name": "FIRST_NAME",
                "last_name": "LAST_NAME",
                "email": "EMAIL",
                "address": "ADDRESS"
            }
        },
        {
            "id": "2",
            "type": "customer",
            "attributes": {
                "first_name": "FIRST_NAME",
                "last_name": "LAST_NAME",
                "email": "EMAIL",
                "address": "ADDRESS"
            }
        },
        {
        etc.
        }
    ]
}
```

</details>

---

<br>

### Get a Customer

```http
GET /customers/:customer_id/
```

<details close>
<summary>  Details </summary>
<br>

Request Parameters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": {
        "id": "1",
        "type": "customer",
        "attributes": {
            "first_name": "FIRST_NAME",
              "last_name": "LAST_NAME",
              "email": "EMAIL",
              "address": "ADDRESS"
        }
    }
}
```

| Code | Description |
| :--- | :--- |
| 404 | `NOT FOUND` |

Response:

```json

{
    "errors": [
        {
            "status": "404",
            "title": "Couldn't find Customer with 'id'=notarealid"
        }
    ]
}
```

</details>

---

<br>

### Create a Customer

```http
POST /customers
```

<details close>
<summary>  Details </summary>
<br>

Request Paramaters: <br>
```
{
  "first_name": "FIRST_NAME",
  "last_name": "LAST_NAME",
  "email": "EMAIL",
  "address": "ADDRESS"
}
```

| Code | Description |
| :--- | :--- |
| 201 | `CREATED` |

Response:

```json

{
    "data": {
        "id": "id",
        "type": "customer",
        "attributes": {
            "first_name": "FIRST_NAME",
            "last_name": "LAST_NAME",
            "email": "EMAIL",
            "address": "ADDRESS"
        }
    }
}
```

| Code | Description |
| :--- | :--- |
| 404 | `NOT FOUND` |

Response:

```json

{
    "errors": [
        {
            "status": "404",
            "title": "Validation failed: Email can't be blank, Address can't be blank"
        }
    ]
}
```

</details>

---

<br>

### Update a Customer

```http
PATCH /customers
```

<details close>
<summary>  Details </summary>
<br>

Request Paramaters: <br>
```
{
  "first_name": "FIRST_NAME",
  "last_name": "LAST_NAME",
  "email": "EMAIL",
  "address": "ADDRESS"
}
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": {
        "id": "id",
        "type": "customer",
        "attributes": {
            "first_name": "FIRST_NAME",
            "last_name": "LAST_NAME",
            "email": "EMAIL",
            "address": "ADDRESS"
        }
    }
}
```

| Code | Description |
| :--- | :--- |
| 404 | `NOT FOUND` |

Response:

```json

{
    "errors": [
        {
            "status": "404",
            "title": "Couldn't find Customer with 'id'=notarealid"
        }
    ]
}
```

</details>

---

<br>

### Delete a Customer

```http
DELETE /customers/1
```

<details close>
<summary>  Details </summary>
<br>

Request Paramaters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": {
        "id": "id",
        "type": "customer",
        "attributes": {
            "first_name": "FIRST_NAME",
            "last_name": "LAST_NAME",
            "email": "EMAIL",
            "address": "ADDRESS"
        }
    }
}
```

| Code | Description |
| :--- | :--- |
| 404 | `NOT FOUND` |

Response:

```json

{
    "errors": [
        {
            "status": "404",
            "title": "Couldn't find Customer with 'id'=notarealid"
        }
    ]
}
```

</details>

---

### Get All of a Customer's Subscriptions

```http
GET /customers/:customer_id/subscriptions
```

<details close>
<summary>  Details </summary>

<br>

Request Parameters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "TITLE",
                "price": 11.11,
                "status": "STATUS",
                "frequencey": "FREQUENCEY"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "title": "TITLE",
                "price": 22.22,
                "status": "STATUS",
                "frequencey": "FREQUENCEY"
            }
        },
        {
        etc.
        }
    ]
}
```

</details>

---

<br>

### Get a Customer's Single Subscription

```http
GET /customers/:customer_id/subscriptions/:subscription_id
```

<details close>
<summary>  Details </summary>
<br>

Request Parameters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": {
        "id": "ID",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
              "title": "TITLE",
              "price": 11.11,
              "status": "STATUS",
              "frequencey": "FREQUENCEY"
        }
    }
}
```

| Code | Description |
| :--- | :--- |
| 404 | `NOT FOUND` |

Response:

```json

{
    "errors": [
        {
            "status": "404",
            "title": "Couldn't find Subscription with 'id'=notarealid"
        }
    ]
}
```

</details>

---

<br>

### Create a Subscription for a Customer

```http
GET /customers/:customer_id/subscriptions
```

<details close>
<summary>  Details </summary>
<br>

Request Paramaters: <br>
```
{
  "title": "TITLE",
  "price": 2.99,
  "status": "STATUS",
  "frequencey": "FREQUENCEY"
}
```

| Code | Description |
| :--- | :--- |
| 201 | `CREATED` |

Response:

```json

{
    "data": {
        "id": "ID",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "title": "TITLE",
            "price": 2.99,
            "status": "STATUS",
            "frequencey": "FREQUENCEY"
        }
    }
}
```

</details>

---

<br>

### Update a Customer's Subscription

```http
PATCH /customers/:customer_id/subscriptions/:subscription_id
```

<details close>
<summary>  Details </summary>
<br>

Request Paramaters: <br>
```
{
  "first_name": "FIRST_NAME",
  "last_name": "LAST_NAME",
  "email": "EMAIL",
  "address": "ADDRESS"
}
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": {
        "id": "ID",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "title": "TITLE",
            "price": 2.99,
            "status": "STATUS",
            "frequencey": "FREQUENCEY"
        }
    }
}
```

| Code | Description |
| :--- | :--- |
| 404 | `NOT FOUND` |

Response:

```json

{
    "errors": [
        {
            "status": "404",
            "title": "Couldn't find Subscription with 'id'=notarealid"
        }
    ]
}
```

</details>

---

<br>

### Delete a Customer

```http
DELETE /customers/:customer_id/subscriptions/:subscription_id
```

<details close>
<summary>  Details </summary>
<br>

Request Paramaters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response:

```json

{
    "data": {
        "id": "ID",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "title": "TITLE",
            "price": 2.99,
            "status": "STATUS",
            "frequencey": "FREQUENCEY"
        }
    }
}
```

| Code | Description |
| :--- | :--- |
| 404 | `NOT FOUND` |

Response:

```json

{
    "errors": [
        {
            "status": "404",
            "title": "Couldn't find Subscription with 'id'=notarealid"
        }
    ]
}
```

</details>

---

</details>

<br>


## Database Schema

<img src="https://github.com/DMTimmons1/tea_sub_api/assets/117066950/f254f92d-5220-4a4c-b9fe-60accd44d6b9">

<br>

## Goals

 `tea_sub_api` was crafted to satisfy the requirements for The Turing Back-End Mod 4 **Take Home Challenge**. 

See the official project requirements [here](https://mod4.turing.edu/projects/take_home/take_home_be).

<br>

### Future Goals
- Implement enums for status of Subscription.
- Allowing FE to search for customers by another unique identifier. With Scale, Ids can be hard to utilize and find specific records. One way to resolve this could be to get customers by a unique email.
- All CRUD functionallity for teas, currently the API only has full CRUD functionallity for Customers and Subscriptions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## Project By:
<table>
  <tr>
    <td>
    <img src="https://avatars.githubusercontent.com/u/117066950?s=120&v=4">
    </td>
  </tr>
  <tr>
    <td>Dawson Timmons</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/DMTimmons1">GitHub</a><br>
      <a href="https://www.linkedin.com/in/dawson-timmons/">LinkedIn</a>
    </td>
  </tr>
</table>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/DMTimmons1/tea_sub_api.svg?style=for-the-badge
[contributors-url]: https://github.com/DMTimmons1/tea_sub_api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/DMTimmons1/tea_sub_api.svg?style=for-the-badge
[forks-url]: https://github.com/DMTimmons1/tea_sub_api/network/members
[stars-shield]: https://img.shields.io/github/stars/DMTimmons1/tea_sub_api.svg?style=for-the-badge
[stars-url]: https://github.com/DMTimmons1/tea_sub_api/stargazers
[issues-shield]: https://img.shields.io/github/issues/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[issues-url]: https://github.com/DMTimmons1/tea_sub_api/issues
[license-shield]: https://img.shields.io/github/license/pantry-wizard/pantry_wizard_be.svg?style=for-the-badge
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[Ruby]: https://img.shields.io/badge/ruby-000000?style=for-the-badge&logo=ruby&logoColor=red
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/rails-red?style=for-the-badge&logo=rubyonrails&logoColor=white&color=red
[Rails-url]: https://rubyonrails.org/
[Postgresql]: https://img.shields.io/badge/postgresql-3386FF?style=for-the-badge&logo=postgresql&logoColor=FFFFFF
[Postgresql-url]: https://www.postgresql.org/