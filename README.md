# RIDE - Ride Intelligent Dispatch Engine

RIDE is a World of Warcraft Classic TBC Anniversary addon that binds one secure button to a smart travel action.

It does not use the broken `[flyable]` macro conditional. Instead, it decides whether the player is in a flyable TBC outdoor area and updates a secure macro out of combat.

## Features

- One keybind for ground mounts, flying mounts, and Druid travel forms.
- Ground/flying mount slots with drag-and-drop item setup.
- Druid Aquatic Form, Flight Form, and Travel Form support when known.
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
- `/ride bind <key>` - bind Smart Travel, for example `/ride bind CTRL-F`
- `/ride bind` - capture the next key
- `/ride unbind` - clear the Smart Travel keybind
- `/ride update` - rebuild the secure action

Set the key in Options > Keybindings > AddOns > RIDE, or use the Set key button in `/ride`.

## Compatibility

- World of Warcraft Classic TBC Anniversary
- Interface: `20505`
