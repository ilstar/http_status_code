HTTP Status Code
================

An [Alfred](https://www.alfredapp.com/) workflow for looking up HTTP status
codes. Selecting a result opens the corresponding
[MDN HTTP status reference](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status).

<img width="764" height="540" alt="Screenshot 2026-07-27 at 9 16 19 PM" src="https://github.com/user-attachments/assets/d4d05271-2834-49b0-8085-5c4d4a6fc6b5" />
<img width="764" height="172" alt="Screenshot 2026-07-27 at 9 16 31 PM" src="https://github.com/user-attachments/assets/361647dc-1255-4172-86fd-a482ab4313eb" />


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

The archive is written to `build/HTTP.Status.Code.alfredworkflow`.
Double-click it to import the workflow into Alfred.

Installation
------------

Download the workflow from the
[release page](https://github.com/ilstar/http_status_code/releases).

The icon is from
[Milkanodised](https://www.iconfinder.com/iconsets/Milkanodised-png#readme).
