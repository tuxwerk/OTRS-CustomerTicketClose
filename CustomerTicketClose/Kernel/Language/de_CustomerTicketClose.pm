
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
  $Self->{Translation}->{'You can add a short comment if you like:'} = 'Wenn Sie m&ouml;chten, schreiben Sie uns einen kurzen Kommentar:';
  $Self->{Translation}->{'Thank you!'} = 'Vielen Dank!';
  $Self->{Translation}->{'Enter comment'} = 'Kommentar eintragen';
  $Self->{Translation}->{'This ticket is already closed.'} = 'Dieses Ticket wurde bereits geschlossen.';
  $Self->{Translation}->{'Thank you for closing the ticket. Thus, the support case is closed for us and will not be pursued!'} = 'Vielen Dank für das Schließen des Tickets. Damit ist der Supportfall für uns abgeschlossen und wird nicht weiterverfolgt!';
  $Self->{Translation}->{'However, should any further questions occur, please contact us again.'} = 'Sollten dennoch weitere Fragen auftreten, bitten wir Sie uns erneut zu kontaktieren.';
  $Self->{Translation}->{'You can reach us anytime via our <strong><a href='%s'>support form</a></strong>.'} = 'Sie können uns jederzeit über unser <strong><a href='%s'>Supportformular</a></strong> erreichen.';
  $Self->{Translation}->{'The given data are not consistent with any ticket. Please check that you have correctly inserted the link into your browser.'} = 'Die angegebenen Daten stimmen mit keinem Ticket überein. Bitte überprüfen Sie, ob Sie den Link richtig in Ihren Browser eingefügt haben.';
  $Self->{Translation}->{'Ticket closed by customer.'} = 'Ticket vom Kunden geschlossen.';
  $Self->{Translation}->{''} = '';
  return 1;
}
1;
