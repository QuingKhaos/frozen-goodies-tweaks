-- Move to bioprocessing tab if installed.
if mods["bioprocessing-tab"] then
  data.raw["item-subgroup"]["fg-frozen"].group = "bioprocessing"
  data.raw["item-subgroup"]["fg-unfrozen"].group = "bioprocessing"
end
