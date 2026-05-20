# Half Factor (UE4SS Edition)

Experimental UE4SS port of the [Half Factor](https://www.nexusmods.com/abioticfactor/mods/52) mod for Abiotic Factor, which rebalances weapon stats and ammo drop rates for more gunplay-focused gameplay.

This mod uses Lua scripting instead of replacing game files with .pak file loading, which makes it more compatible with other mods, and makes it a lot easier to keep up to date with game updates or to tweak balancing.

Due to bugs in older UE4SS versions, this mod really only works when used with [UE4SS For Abiotic Factor 1.20.0](https://github.com/igromanru/AF-UE4SS/releases/tag/1.20.0) or newer. However, this newer version of UE4SS reportedly doesn't seem to play nice with Abiotic Factor for some users. This mod technically still works on the current "recommended" version of UE4SS For Abiotic Factor, but the *only* thing that works is the new magazine sizes. All other weapon stats (as well as ammo drops) simply cannot work on the older version.

Personally, I have not yet run into any issues with the newest UE4SS version, this is something you'll have to test out for yourself. You can try updating UE4SS to [the latest experimental version](https://github.com/UE4SS-RE/RE-UE4SS/releases/tag/experimental-latest), while keeping igromanru's configs.

# Installation

With UE4SS installed, [download this repository as zip file](https://github.com/morerokk/AbioticFactor-HalfFactor-UE4SS/archive/refs/heads/master.zip), and unzip into your `ue4ss/Mods` folder.
