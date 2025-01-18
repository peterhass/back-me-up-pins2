install: 
	cp -n ./resebo-backup.env /etc/resebo-backup || true
	chmod 640 /etc/resebo-backup

	cp ./with-system-snapshot /usr/local/bin/with-system-snapshot
	cp ./blocking-systemd-inhibit /usr/local/bin/blocking-systemd-inhibit
	cp ./resebo-backup /usr/local/bin/resebo-backup

	cp ./resebo-backup-maintenance.service /etc/systemd/system/
	cp ./resebo-backup-maintenance.timer /etc/systemd/system/
	cp ./resebo-backup-system.service /etc/systemd/system/
	cp ./resebo-backup-system.timer /etc/systemd/system/
	cp ./resebo-backup-home.service /etc/systemd/system/
	cp ./resebo-backup-home.timer /etc/systemd/system/
	systemctl daemon-reload
enable:
	systemctl enable --now resebo-backup-maintenance.timer
	systemctl enable --now resebo-backup-system.timer
	systemctl enable --now resebo-backup-home.timer
