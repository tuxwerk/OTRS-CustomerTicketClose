# --
# CustomerTicketClose.dtl - provides HTML form for close mask
# Copyright (C) 2012 tuxwerk - http://www.tuxwerk.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (GPL). If you
# did not receive this file, see http://www.gnu.org/licenses/gpl.txt.
# --

package Kernel::Language::de_CustomerTicketClose;

use strict;

sub Data {
  my $Self = shift;

  $Self->{Translation}->{'Close ticket'} = 'Ticket schlie�en';
  $Self->{Translation}->{'Closing ticket'} = 'Schlie�en von Ticket';
  $Self->{Translation}->{'What is the reason for closing the ticket?'} = 'Weshalb schlie�en Sie das Ticket?'; 
  $Self->{Translation}->{'Were you content with our service?'} = 'Waren Sie mit unserem Service zufrieden?';
  $Self->{Translation}->{'You can add a short comment if you like:'} = 'Wenn Sie m�chten, schreiben Sie uns einen kurzen Kommentar:';
  $Self->{Translation}->{'Thank you!'} = 'Vielen Dank!';
  $Self->{Translation}->{'Enter comment'} = 'Kommentar eintragen';
  $Self->{Translation}->{'This ticket is already closed.'} = 'Dieses Ticket wurde bereits geschlossen.';
  $Self->{Translation}->{'Thank you for closing the ticket. Thus, the support case is closed for us and will not be pursued!'} = 'Vielen Dank f�r das Schlie�en des Tickets. Damit ist der Supportfall f�r uns abgeschlossen und wird nicht weiterverfolgt!';
  $Self->{Translation}->{'However, should any further questions occur, please contact us again.'} = 'Sollten dennoch weitere Fragen auftreten, bitten wir Sie uns erneut zu kontaktieren.';
  $Self->{Translation}->{'You can reach us anytime via our support form:'} = 'Sie k�nnen uns jederzeit �ber unser Supportformular erreichen:';
  $Self->{Translation}->{'Click here'} = 'Hier klicken';
  $Self->{Translation}->{'The given data are not consistent with any ticket. Please check that you have correctly inserted the link into your browser.'} = 'Die angegebenen Daten stimmen mit keinem Ticket �berein. Bitte �berpr�fen Sie, ob Sie den Link richtig in Ihren Browser eingef�gt haben.';
  $Self->{Translation}->{'Ticket closed by client.'} = 'Ticket vom Kunden geschlossen.';
  $Self->{Translation}->{'Closed by client'} = 'Vom Kunden geschlossen';
  $Self->{Translation}->{'Comment'} = 'Kommentar';
}
1;
