all: deps bin/lein-classpath clean lein-jar

ci: all

clean:
	lein clean

lein-deps:
	lein deps

lein-jar:
	lein jar

bin/lein-classpath: project.clj
	./bin/gen-lein-classpath $@.tmp && mv -f $@.tmp $@

deps:
	./bin/deps install all

deps-check:
	./bin/deps check all

deps-pull:
	git subtree pull -P bin/deps.d git@github.com:StaplesLabs/Deps.git master

deps-push:
	git subtree push -P bin/deps.d git@github.com:StaplesLabs/Deps.git master

help: ?

?:
	@echo
	@echo "all  ................ Install all local dependencies, configure the lein-classpath, and run tests"
	@echo "bin/lein-classpath .. Configure the lein classpath and store it in bin/lein-classpath"
	@echo "ci  ................. Install all local dependencies, configure the lein-classpath, and run tests"
	@echo "clean ............... Run lein clean"
	@echo "deps ................ Install all local dependencies"
	@echo "deps-check .......... Check status of local dependencies"
	@echo "deps-pull ........... Pull global updates to local deps recipes"
	@echo "deps-push ........... Push local updates to global deps recipes"
	@echo "lein-deps ........... Install lein deps"
	@echo "tests ............... Run tests"
	@echo
