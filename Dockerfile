FROM resin/rpi-raspbian

RUN apt-get update \
        && apt-get install -y --force-yes --no-install-recommends \
                locales vim wget \
	&& apt-get install apt-transport-https -y --force-yes \
	&& wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | sudo apt-key add - \
	&& echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list \
	&& apt-get update \
	&& apt-get install -y --force-yes --no-install-recommends \
		plexmediaserver \
        && apt-get autoclean \
        && apt-get autoremove \
        && rm -rf /var/lib/apt/lists/*

ADD startup.sh /

EXPOSE 32400

WORKDIR /root
ENTRYPOINT ["/startup.sh"]
