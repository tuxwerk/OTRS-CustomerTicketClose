all: install
	/opt/otrs2/bin/opm.pl -a build -p customer_ticket_close.sopm
	mv /tmp/CustomerTicketClose*.opm .

install:
	cp Kernel/Modules/CustomerTicketClose.pm \
	   /opt/otrs2/Kernel/Modules/
	cp Kernel/Output/HTML/Standard/*.dtl \
	   /opt/otrs2/Kernel/Output/HTML/Standard/
	cp Kernel/Config/Files/*.xml \
	   /opt/otrs2/Kernel/Config/Files

