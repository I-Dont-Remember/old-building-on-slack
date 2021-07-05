# building-on-slack

## Building the site

Using [loconotion script](https://github.com/leoncvlt/loconotion) to generate static pages from a Notion page. 
Clone that repo into this one (didn't feel like doing submodules, then run:

```shell
cd loconotion # until they turn it into a package you can import
poetry install --no-dev
poetry run python loconotion ../building_on_slack.toml
```
This could be automated with GitHub Actions, but for now why automate a task that only takes a minute a week at max. Bigger fish out there to fry.

## Testing locally

It's a static site, just open the page in the browser. If you want to test more completely, Netlify enables you to run their entire stack locally with [Netlify Dev](https://www.netlify.com/products/dev/), just need to install their CLI.

## Design

Notion handles the fiddly bits, but I still have to make it look not dumb. Good example site
with a lot of traffic is [Side Hustle Stack](https://sidehustlestack.co/).


