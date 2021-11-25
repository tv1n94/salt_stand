**Vagrant stand for testing Salt**


How to provision stand:
1) `vagrant up`
2) After provision stand go to master: `vagrant ssh master`
3) Switch user to root: `sudo -i`
4) Add minion keys: `salt-key -A`


Check added keys: `salt-key -L`
Check working salt: `salt '*' test.ping`

Run simple command: `salt '*' cmd.run "uname -a"`
Run simple command on simple host: `salt minion1 cmd.run "uname -a"`

Show information about minion1 host (grains): `salt minion1 grains.items`

*For using ssh we need use roster-file*

