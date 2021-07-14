build:
	cd loconotion && poetry run python loconotion ../building_on_slack.toml -v && rm -rf ../dist; mv dist ..
