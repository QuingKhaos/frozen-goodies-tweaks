local khaoslib_recipe = require("__khaoslib__.recipe")
local khaoslib_technology = require("__khaoslib__.technology")

-- Move to bioprocessing tab if installed.
if mods["bioprocessing-tab"] then
  data.raw["item-subgroup"]["fg-frozen"].group = "bioprocessing"
  data.raw["item-subgroup"]["fg-unfrozen"].group = "bioprocessing"
end

-- Make recipes unlock with the appropriate technology.
local unlocks = {
    ["fg-frozen-agricultural-science-pack"] = "agricultural-science-pack",
    ["fg-frozen-bioflux"] = "bioflux",
    ["fg-frozen-biter-egg"] = "captivity",
    ["fg-frozen-fish"] = "fish-breeding",
    ["fg-frozen-jelly"] = "jellynut",
    ["fg-frozen-jellynut"] = "jellynut",
    ["fg-frozen-nutrients"] = "agriculture",
    ["fg-frozen-pentapod-egg"] = "biochamber",
    ["fg-frozen-yumako"] = "yumako",
    ["fg-frozen-yumako-mash"] = "yumako"
}

for goodie, tech in pairs(unlocks) do
  khaoslib_recipe:load(goodie)
    :set {enabled = false}
    :commit()

  khaoslib_recipe:load(goodie .. "-melt")
    :set {enabled = false}
    :commit()

  khaoslib_technology:load(tech)
    :add_unlock_recipe(goodie)
    :add_unlock_recipe(goodie .. "-melt")
    :commit()
end
