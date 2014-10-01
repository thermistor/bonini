# Bonini, generate a roadmap from Pivotal

This project allows you to generate a high-level project roadmap for stakeholders from a Pivotal Tracker project. Stakeholders outside of engineering may not be able to get much value out of looking at the detail normally provided by Pivotal Tracker. Bonini's method is to generate a roadmap from just the Release stories and their descriptions. It does require you to use Pivotal in a particular way.

### Required conventions

* Organize the work done in an iteration into one or more releases
* You must use the *Release* story type
* Releases should have descriptions describing a high-level feature or set of features. You can use Markdown in the descriptions.

## Installation

1. Clone the repo.
1. Copy the config and add your Pivotal API Token and project id:

    cp config.yml-example config.yml

  Your Pivotal API Token can be found on [your profile page](https://www.pivotaltracker.com/profile). The project id can be found in the url of the Pivotal project.
1. Edit the `roadmap.mustache` template to match your needs.


## Usage

Just run rake and it will generate markdown that you can pipe into a file or your clipboard.

    rake
    rake | pbcopy

My workflow is to pipe it into sublime buffer, use the Sublime Markdown Preview package to preview in a browser, and then cut-and-paste that into an email to get a nicely styled email update. The Sublime Markdown Preview package has a lot of options for customizing the generated html.

    rake | subl -n

## TODO

* Show projected dates of planned releases by walking through upcoming iterations
* Get the iteration length from the API via project settings
