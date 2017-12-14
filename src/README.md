# How to get started

## Program required

You must first install `python3`, `pip3` and `sqlite3`.

## Setup a virtualenv

In the django project directory

```
$ virtualenv venv
$ source venv/bin/activate # If you use fish shell you should active "venv/bin/activate.fish"
```

## Install dependencies

Only when you are in the activated virtualenv

```
$ pip3 install -r requirement.txt
```

## Run it

```
$ ./manage.py migrate # Create the database
$ ./manage.py runserver # Launch the server
```
