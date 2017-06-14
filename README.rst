=====================================
 OTRS Package - Customer Ticket Close
=====================================

This is a package for the ticket system OTRS_ 5.0

This package allows the client to close his ticket through the public 
interface. The client needs not to be logged in and is able to 
add a note (e.g. her reason for closing the ticket). Access is restricted
by TicketID, Number and Customer (if available).

The package is released under AGPL_ Version 3 (See COPYING for more infos).

Authors:

* Marek Kralewski <mck(at)tuxwerk.de>

Download the opm:

http://opar.perl-services.de/dist/CustomerTicketClose

Installation
------------

Install the opm file in OTRS.

Set the CustomerTicketClose::SupportURL config option to your support form (if available).

Add the following link to a signature or an answer:

<a href="&lt;OTRS_CONFIG_HttpType&gt;://&lt;OTRS_CONFIG_FQDN&gt;/&lt;OTRS_CONFIG_ScriptAlias&gt;public.pl?Action=CustomerTicketClose&amp;TicketID=&lt;OTRS_TICKET_TicketID&gt;&amp;Number=&lt;OTRS_TICKET_NUMBER&gt;&amp;Customer=&lt;OTRS_TICKET_CustomerUserID&gt;">Close ticket</a>

.. _OTRS: http://www.otrs.org
.. _AGPL: http://www.gnu.org/licenses/agpl.html
