# --
# Kernel/Language/de_CustomerTicketClose.pm - german translation
# Copyright (C) 2012-2016 tuxwerk - http://www.tuxwerk.de
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Language::de_CustomerTicketClose;

use strict;
use warnings;
use utf8;

sub Data {
  my $Self = shift;

  $Self->{Translation}->{'Close ticket'} = 'Ticket schließen';
  $Self->{Translation}->{'Closing ticket'} = 'Schließen von Ticket';
  $Self->{Translation}->{'What is the reason for closing the ticket?'} = 'Weshalb schließen Sie das Ticket?'; 
  $Self->{Translation}->{'Have you been satisfied with our service?'} = 'Waren Sie mit unserem Service zufrieden?';
  $Self->{Translation}->{'You can add a short comment if you like:'} = 'Wenn Sie möchten, schreiben Sie uns einen kurzen Kommentar:';
  $Self->{Translation}->{'Thank you!'} = 'Vielen Dank!';
  $Self->{Translation}->{'Enter comment'} = 'Kommentar eintragen';
  $Self->{Translation}->{'This ticket is already closed.'} = 'Dieses Ticket wurde bereits geschlossen.';
  $Self->{Translation}->{'Thank you for closing the ticket. The support case is therefore closed for us and will not be pursued!'} = 'Vielen Dank für das Schließen des Tickets. Damit ist der Supportfall für uns abgeschlossen und wird nicht weiterverfolgt!';
  $Self->{Translation}->{'Please contact as again if you have any further questions.'} = 'Sollten dennoch weitere Fragen auftreten, bitten wir Sie uns erneut zu kontaktieren.';
  $Self->{Translation}->{'You can reach us anytime again via our support form:'} = 'Sie können uns jederzeit wieder über unser Supportformular erreichen:';
  $Self->{Translation}->{'Click here'} = 'Hier klicken';
  $Self->{Translation}->{'The given data are not consistent with any ticket. Please check that you have correctly inserted the link into your browser.'} = 'Die angegebenen Daten stimmen mit keinem Ticket überein. Bitte überprüfen Sie, ob Sie den Link richtig in Ihren Browser eingefügt haben.';
  $Self->{Translation}->{'Ticket closed by client.'} = 'Ticket vom Kunden geschlossen.';
  $Self->{Translation}->{'Closed by client'} = 'Vom Kunden geschlossen';
  $Self->{Translation}->{'Comment'} = 'Kommentar';
}

1;
