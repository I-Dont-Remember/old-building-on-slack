# building-on-slack

Host Notion pages as a static site for free with Loconotion & Netlify, includes steps for how to accomplish on Windows WSL.

All my Loconotion sites get cloned inside the Loconotion local repo, then scripts are run from the top level. Visual guide:

```shell
├── loconotion
│   ├── building-on-slack # this stores scripts, documentation, for all of sites.
│   ├── website-2-cloned-repo
...
```

## Prereqs to use Loconotion

- Pyenv and/or Python >= 3.8 installed
- Pipx (to download Poetry)
- Chrome installed on machine (Windows has extra steps)

## Windows prereqs

WSL doesn't have access to the Chrome instance installed on Windows - we need to get it installed inside the Linux environment. [This guide](https://www.gregbrisebois.com/posts/chromedriver-in-wsl2/) _([Stack Overflow backup link](https://stackoverflow.com/questions/63290844/how-to-run-selenium-chromedriver-from-python3-on-wsl2))_ got everything set perfectly to connect. The gist is:

- Install the window server on Windows that `$DISPLAY` can be pointed to from WSL and use Chrome like you would any other app.
- Install Chrome
- Install the [matching Chromedriver](https://chromedriver.chromium.org/)

## Opening files locally in Chrome

You should have followed the Windows prereqs by this point. If you are trying to open a file for viewing like `google-chrome public/index.html` and hitting errors, check that:

- `xlaunch` is running on Windows, and with correct settings
- Bash environment variable was already exported
  ```shell
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
  ```

## Installing Loconotion

Had to sort out a small issue with [pyenv and poetry Python versions](https://stackoverflow.com/questions/70950511/using-poetry-with-pyenv-and-having-python-version-issues).

```shell
pipx install 
# or whatever your installed >3.8 version is
pyenv local 3.8.12 # once needed to use pyenv shell 3.8.12 to get it to recognize
poetry env use 3.8.12
poetry install --no-dev
# BoS has all the docs and scripts for any & all sites I have on this setup
git clone git@github.com:I-Dont-Remember/building-on-slack.git
cp building-on-slack/Makefile.keep ./Makefile
# clone any other sites I need
git clone git@github.com:I-Dont-Remember/indielurker.git
```

## Building the site

Using [loconotion script](https://github.com/leoncvlt/loconotion) to generate static pages from a Notion page. Site repos should be cloned inside the Loconotion repo, and the corresponding Makefile should have commands to run from the top level.

```shell
make build-bos

OR 

make build-indielurker
```

This could be automated with GitHub Actions, or Netlify build, but for now why automate a task that only takes a minute a week at max. Bigger fish out there to fry.

## Testing locally

It's a static site, just open the page in the browser. If you want to test more completely, Netlify enables you to run their entire stack locally with [Netlify Dev](https://www.netlify.com/products/dev/), just need to install their CLI.

## Design

Notion handles the fiddly bits, but I still have to make it look not dumb. Good example site
with a lot of traffic is [Side Hustle Stack](https://sidehustlestack.co/).
