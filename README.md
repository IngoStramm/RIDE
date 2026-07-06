<p align="center">
  <img src="assets/ride-logo.png" alt="RIDE logo" width="180">
</p>

# RIDE - Ride Intelligent Dispatch Engine

A smart one-key mount addon that automatically chooses the best ground, flying, class mount, or Druid travel option for your current situation.

RIDE is a lightweight World of Warcraft Classic TBC Anniversary addon that gives you one smart keybind for travel. Instead of managing separate buttons for ground mounts, flying mounts, Paladin/Warlock class mounts, and Druid travel forms, RIDE chooses the best available option based on your current area and configuration.

RIDE is designed for Classic TBC, where mounts are still items in your bags. It does not rely on the broken `[flyable]` macro conditional; instead, it updates a secure travel action out of combat.

## Features

- One keybind for ground mounts, flying mounts, class mounts, and Druid travel forms.
- Ground/flying mount slots with drag-and-drop item setup.
- Druid Aquatic Form, Flight Form, and Travel Form support when known.
- Paladin Warhorse/Charger and Warlock Felsteed/Dreadsteed support when known.
- Fallback to ground mount when the character has no usable flying mount.
- Optional protection against dismounting while flying.
- Keybind setup from the RIDE options panel or WoW's Keybindings options.

## Installation

Download `RIDE.zip` from the latest GitHub Release and extract it into:

```text
World of Warcraft/_anniversary_/Interface/AddOns/
```

After extraction, the addon folder should be:

```text
World of Warcraft/_anniversary_/Interface/AddOns/RIDE/
```

Restart the game or reload the UI.

Do not use GitHub's green **Code > Download ZIP** button for installation. That downloads the source repository snapshot, not the packaged addon.

## Commands

- `/ride` - open options
- `/ride status` - print the current setup
- `/ride ground <item link or item name>` - set ground mount
- `/ride flying <item link or item name>` - set flying mount
- Drag a mount item from your bag onto the ground/flying slot in `/ride`.
- You can also pick a mount item up from your bag and click the slot.
- Right-click a mount slot to clear it.
- `/ride clear ground|flying` - clear a mount
- `/ride druid` - toggle Druid travel forms
- `/ride classmount` - toggle Paladin/Warlock class mounts
- `/ride bind <key>` - bind Smart Travel, for example `/ride bind CTRL-F`
- `/ride bind` - capture the next key
- `/ride unbind` - clear the Smart Travel keybind
- `/ride update` - rebuild the secure action

Set the key in Options > Keybindings > AddOns > RIDE, or use the Set key button in `/ride`.

## Changelog

### 1.0.4

- Published a metadata-only release after enabling the CurseForge GitHub webhook to validate automatic packaging.
- No addon behavior changes from 1.0.3.

### 1.0.3

- Published a metadata-only release to validate CurseForge automatic packaging after GitHub source integration.
- No addon behavior changes from 1.0.2.

### 1.0.2

- Added Paladin class mount support for Warhorse, Charger, Thalassian Warhorse, and Thalassian Charger.
- Added Warlock class mount support for Felsteed and Dreadsteed.
- Added a class mount option that only appears when the current character knows a supported class mount spell.
- Added `/ride classmount` and `/ride class` commands to toggle class mount usage.
- Updated smart travel fallback so Paladin/Warlock class mounts can be used when no flying mount is available.
- Prepared CurseForge automatic packaging metadata.

### 1.0.1

- Added one smart keybind for ground mounts, flying mounts, and Druid travel forms.
- Added drag-and-drop setup for ground and flying mount items.
- Added Druid support for Aquatic Form, Flight Form, and Travel Form.
- Added fallback to ground mount when no usable flying mount is configured.
- Added optional protection against dismounting while flying.
- Added standalone `/ride` configuration window.
- Added support for WoW's Keybindings options.

## Compatibility

- World of Warcraft Classic TBC Anniversary
- Interface: `20505`
