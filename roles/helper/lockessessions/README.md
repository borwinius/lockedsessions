# lockedsessions
a little helperrole for ansible to lockout old forgotten Linux-X11-Sessions


## Installation
- download the code with : `git clone https://github.com/borwinius/lockedsessions.git`
- copy the code in your ansible roles-directory
- make 1 Environmentvariables in ansible like this:  
  `terminate_sessions`:  
  `true` terminate all locked sessions  
  `false` display only all locked sessions  
## test it with ansible  
include it in your own rolefile `role/MYROLE/tasks/main.yaml`  
```
- include_role:
     name: helper/lockedsessions
  when:
     - terminate_sessions is defined
```

- checked only with KDE and GNOME on debian and suse
- this module terminate all locked session of users on a machine.
