HTTP Status Code
================

An [Alfred](https://www.alfredapp.com/) workflow for looking up HTTP status
codes. Selecting a result opens the corresponding
[MDN HTTP status reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status).

![screenshot 2014-07-23 11 56 04](https://cloud.githubusercontent.com/assets/128977/3679639/b41e2988-12a6-11e4-94ff-51cb27dc09fc.png)
![screenshot 2014-07-23 11 55 54](https://cloud.githubusercontent.com/assets/128977/3679640/b67f6084-12a6-11e4-9edd-07afd141f340.png)

Testing
-------

Run the smoke test from the repository root:

```sh
make test
```

It runs the Script Filter with status code `404`, prints its Alfred XML, and
checks that the result links to the correct MDN page. To inspect another query
without the assertion:

```sh
make run QUERY=503
make run QUERY=redirect
```

To build the workflow archive:

```sh
make pack
```

The archive is written to `build/http-status-code.alfredworkflow`.
Double-click it to import the workflow into Alfred.

Installation
------------

Download the workflow from the
[release page](https://github.com/ilstar/http_status_code/releases).

The icon is from
[Milkanodised](https://www.iconfinder.com/iconsets/Milkanodised-png#readme).
