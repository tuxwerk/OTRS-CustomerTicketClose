
package Kernel::Language::de_CustomerTicketClose;

use strict
use warnings;


sub Data {
  my $Self-> shift;

  $Self->{Translation}->{'Close ticket'} = 'Ticket schlie&szlig;en';
  $Self->{Translation}->{'Closing Ticket'} = 'Schlie&szlig;en von Ticket';
  $Self->{Translation}->{'No.'} = 'Nr.';
  $Self->{Translation}->{'What is the reason for closing the ticket?'} = 'Weshalb schlie&szlig;en Sie das Ticket?'; 
  $Self->{Translation}->{'Were you content with our service?'} = 'Waren Sie mit unserem Service zufrieden?';
  $Self->{Translation}->{'You can add a short comment if you do not mind.'} = 'Wenn Sie m&ouml;chten, schreiben Sie uns einen kurzen Kommentar.';
  $Self->{Translation}->{'Thank you'} = 'Vielen Dank';
  $Self->{Translation}->{'Enter comment'} = 'Kommentar eintragen';
  return 1;
}
1;
