produce:
	git pull
	curl -o delegated-apnic-latest https://ftp.apnic.net/stats/apnic/delegated-apnic-latest
	curl -o china_ip_list.txt https://raw.githubusercontent.com/17mon/china_ip_list/master/china_ip_list.txt
	python3 produce.py
	scp ~/nchnroutes/routes4.rsc yourusername@192.168.88.254:/
        ssh yourusername@192.168.88.254 '/ip route remove [/ip route find comment=ospf];/import file-name=routes4.rsc;/log info "ospf Rout table imported";/file remove routes4.rsc'
