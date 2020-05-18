# dotDesktop
##  .desktop file creator with bash and zenity

Create desktop files is not a dificult task, but we can see a bunch of applications here and there with time, e everytime creating a new file can be a little boring.

This bash file is a easy solution for this, just bash and zenity for we can create in just seconds a desktop file.

## Version 1.0

    - Create .desktop file (Application/Directory type only) with the options bellow:
        - Name (Obligatory)
        - Type (Obligatory)
        - Version
        - Icon
        - Comment
        - Exec (There is no path for now)
        - Categories

    > Desktop files are save in: ~/.local/share/applications/

## To-Do List

#### There is some work to do here:

- [X] Create cool .desktop files
- [ ] Support all [freedesktop specification](https://specifications.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html#recognized-keys "Desktop entry specifications")
- [ ] Create a application menu
- [ ] Create a config file
- [ ] Support for links
- [ ] Support for backup and export of the created desktop files