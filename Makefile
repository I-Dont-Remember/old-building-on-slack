build:
	cd loconotion && poetry run python loconotion ../building_on_slack.toml -v && mv dist ..
