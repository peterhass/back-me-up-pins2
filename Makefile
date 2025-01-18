install: 
	cp -n ./resebo-backup.env /etc/resebo-backup || true
	chmod 640 /etc/resebo-backup

	cp ./resebo-backup /usr/local/bin/resebo-backup

	cp ./resebo-backup-maintenance.service /etc/systemd/system/
	cp ./resebo-backup-maintenance.timer /etc/systemd/system/
	cp ./resebo-backup-srv.service /etc/systemd/system/
	cp ./resebo-backup-srv.timer /etc/systemd/system/
	systemctl daemon-reload
enable:
	systemctl enable --now resebo-backup-maintenance.timer
	systemctl enable --now resebo-backup-srv.timer
test:
	systemd-analyze verify *.service *.timer
