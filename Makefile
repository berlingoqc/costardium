GAME_REPO := $(shell pwd)

CURRENT_BRANCH := $(git symbolic-ref --short -q HEAD)

UE_PROJECT_EXT := .uproject

PROJECT := costardium

BUILD_TOOL := /opt/unreal-engine/Engine/Build/BatchFiles/RunUAT.sh BuildCookRun

PROJECT_FULL_PATH := $(GAME_REPO)/$(PROJECT)$(UE_PROJECT_EXT)

.PHONY: all build pack

all: clean build pack


clean:
	# supprime la cache de unreal
	@rm -rf ./DerivedDataCache ./Intermediate ./Saved
	# supprime mes trucs que j'ai builder
	@rm -rf .

build:
	
	$(BUILD_TOOL) -project="$(PROJECT_FULL_PATH)" \
		-cook -NoCompile -allmaps -build -stage -pak \
		-archive -archivedirectory="./"

pack:
	@zip -r $(PROJECT)_$(BRANCH).zip . -x \./DerivedDataCache\ \./Intermediate\ \./Saved\

release: build pack
	# upload le resultat dans un VM



# rimouski bic, domain floravie 20-23 septembre 2019 4 jours. Vendredi matin jusqua lendi pm
# saint antoine de tyly centre sdaint antoine, pres de quebec. 11-14 octobre 2019 4 jours



