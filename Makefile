PYTHON ?= python3
QUERY ?= 404

WORKFLOW := build/http-status-code.alfredworkflow
WORKFLOW_FILES := info.plist http_status_code.py feedback.py status_code.csv icon.png
MDN_STATUS_BASE := https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status/

.PHONY: run test pack verify-pack

run:
	$(PYTHON) http_status_code.py "$(QUERY)"

test:
	@output="$$( $(PYTHON) http_status_code.py "$(QUERY)" )"; \
	printf '%s\n' "$$output"; \
	printf '%s\n' "$$output" | grep -Fq 'arg="$(MDN_STATUS_BASE)$(QUERY)"' || { \
		printf 'Expected an Alfred result linking to %s%s\n' "$(MDN_STATUS_BASE)" "$(QUERY)" >&2; \
		exit 1; \
	}; \
	printf 'Smoke test passed for HTTP %s.\n' "$(QUERY)"

pack:
	plutil -lint info.plist
	rm -f "$(WORKFLOW)"
	mkdir -p build
	zip -qj "$(WORKFLOW)" $(WORKFLOW_FILES)
	$(MAKE) --no-print-directory verify-pack

verify-pack:
	@unzip -p "$(WORKFLOW)" info.plist | plutil -lint -
	@for file in $(WORKFLOW_FILES); do \
		unzip -Z1 "$(WORKFLOW)" | grep -Fxq "$$file" || { \
			printf 'Missing %s from %s\n' "$$file" "$(WORKFLOW)" >&2; \
			exit 1; \
		}; \
	done
	@printf 'Valid Alfred workflow archive: %s\n' "$(WORKFLOW)"
