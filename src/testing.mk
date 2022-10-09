.PHONY: test
test: all
	valgrind --tool=none ./$(SPEC)

.PHONY: test-daemon
test-daemon:
	@test $(shell which entr) || entr
	while sleep 0.1; do \
		find spec/ src/ | entr -d make test --no-print-directory; \
	done

.PHONY: test-memcheck
test-memcheck: all
	valgrind --leak-check=full $(MEMCHECK_FLAGS) ./$(SPEC)

.PHONY: test-helgrind
test-helgrind: all
	valgrind --tool=helgrind $(HELGRIND_FLAGS) ./$(SPEC)