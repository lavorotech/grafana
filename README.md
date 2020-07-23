![Grafana](docs/logo-horizontal.png)

The open-source platform for monitoring and observability.

[![License](https://img.shields.io/github/license/grafana/grafana)](LICENSE)
[![Circle CI](https://img.shields.io/circleci/build/gh/grafana/grafana)](https://circleci.com/gh/grafana/grafana)
[![Go Report Card](https://goreportcard.com/badge/github.com/grafana/grafana)](https://goreportcard.com/report/github.com/grafana/grafana)

Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored. Create, explore, and share dashboards with your team and foster a data driven culture:

- **Visualize:** Fast and flexible client side graphs with a multitude of options. Panel plugins for many different way to visualize metrics and logs.
- **Dynamic Dashboards:** Create dynamic & reusable dashboards with template variables that appear as dropdowns at the top of the dashboard.
- **Explore Metrics:** Explore your data through ad-hoc queries and dynamic drilldown. Split view and compare different time ranges, queries and data sources side by side.
- **Explore Logs:** Experience the magic of switching from metrics to logs with preserved label filters. Quickly search through all your logs or streaming them live.
- **Alerting:** Visually define alert rules for your most important metrics. Grafana will continuously evaluate and send notifications to systems like Slack, PagerDuty, VictorOps, OpsGenie.
- **Mixed Data Sources:** Mix different data sources in the same graph! You can specify a data source on a per-query basis. This works for even custom datasources.

## Get started

- [Get Grafana](https://grafana.com/get)
- [Installation guides](http://docs.grafana.org/installation/)

Unsure if Grafana is for you? Watch Grafana in action on [play.grafana.org](https://play.grafana.org/)!

## Documentation

The Grafana documentation is available at [grafana.com/docs](https://grafana.com/docs/).

## Contributing

If you're interested in contributing to the Grafana project:

- Start by reading the [Contributing guide](/CONTRIBUTING.md).
- Learn how to set up your local environment, in our [Developer guide](/contribute/developer-guide.md).
- Explore our [beginner-friendly issues](https://github.com/grafana/grafana/issues?q=is%3Aopen+is%3Aissue+label%3A%22beginner+friendly%22).

## Get involved

- Follow [@grafana on Twitter](https://twitter.com/grafana/)
- Read and subscribe to the [Grafana blog](https://grafana.com/blog/)
- If you have a specific question, check out our [discussion forums](https://community.grafana.com/).
- For general discussions, join us on the [official Slack](http://slack.raintank.io/) team.

## License

Grafana is distributed under the [Apache 2.0 License](https://github.com/grafana/grafana/blob/master/LICENSE).

Helpful build instruction from https://www.stroppykitten.com/technical/build-grafana-package:

I had reason to re-build a custom grafana Debian package a few weeks back.  It was a little bit tricky to figure out the right steps, and I wasn't able to find this process documented anywhere else, so here it is (for my future benefit as much as anyone else's).  This is brief, and is intended to be an outline/guide only.  Your mileage may vary

Install go version 1.9 (although check the current Grafana README for the correct current version; it can and does change).  Use your choice of install method; I don't even want to guess what the current hotness will be when these instructions are used.
Install nodejs, npm, and then yarn using npm (e.g. npm install -g yarn)
Yarn has some specific nodejs version requirements, so you may need to use 'n' (npm install n, then use 'n' to install a suitable version of nodejs) to make it happy.  Again, this can and does change over time, so you may have to figure this out for yourself the hard way.
Install 'fpm' using gem (system wide is probably ok, may require additional packages/support to compile/install), e.g. gem install fpm
cd ~somedir
export GOPATH=`pwd`
If you have some specific alternative preferences for how to handle your GOPATH, then you will already understand how you could do this differently.  Make your choices, and have fun.  Remember that I don't care that I might be the devil incarnate relative to your world view; this set of instructions works, and keeps my grafana build self-contained, which is my sole goal.
go get github.com/grafana/grafana
Wait some time with zero feedback (hrnnnghhh), while the internet is consulted for all the bits (pro-tip: it's doing one or more git clones)
cd src/github.com/grafana/grafana
Make your changes, checkout a specific tag/branch, or whatever you want to do to end up with the source you want to build into a package.
go run build.go setup
yarn install --pure-lockfile
go run build.go build
Update package.json, modify 'version' to be the package version you want, e.g. 4.6.2-1.  You probably want to ensure it's one bump up from whatever package is currently installed.  Consider consulting the Debian documentation for a full explanation of what you can do with version numbers, particularly if you're going to be permanently split from the mainstream grafana debian repositories.
go run build.go -includeBuildNumber=false pkg-deb
You should end up with a debian package in a handy location, which you can then go put in your local package repo, or install via some other method. 
