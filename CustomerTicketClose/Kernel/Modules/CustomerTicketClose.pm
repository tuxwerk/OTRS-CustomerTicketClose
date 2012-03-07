# --
# Kernel/Modules/AgentTicketClose.pm - close a ticket
# Copyright (C) 2001-2009 OTRS AG, http://otrs.org/
# --
# $Id: AgentTicketClose.pm,v 1.69 2009/08/25 14:32:55 martin Exp $
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::CustomerTicketClose;

use strict;
use warnings;

use Kernel::System::State;
use Kernel::System::Ticket;
use Kernel::System::Time;

use vars qw($VERSION);
$VERSION = qw($Revision: 1.69 $) [1];

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    $Self->{TicketID} = $Self->{ParamObject}->GetParam( Param => 'TicketID' );
    $Self->{Number}   = $Self->{ParamObject}->GetParam( Param => 'Number' );
    $Self->{Customer} = $Self->{ParamObject}->GetParam( Param => 'Customer' );

    $Self->{StateObject} = Kernel::System::State->new(%Param);

    $Self->{TicketObject} = Kernel::System::Ticket->new(
        ConfigObject => $Self->{ConfigObject},
        LogObject    => $Self->{LogObject},
        TimeObject   => $Self->{TimeObject},
        DBObject     => $Self->{DBObject},
        MainObject   => $Self->{MainObject},
        EncodeObject => $Self->{EncodeObject},
    );

    # check needed objects
    for (qw(TicketID Number Customer TicketObject DBObject LayoutObject LogObject ConfigObject)) {
        if ( !$Self->{$_} ) {
            $Self->{LayoutObject}->FatalError( Message => "Got no $_!" );
        }
    }    

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $Output = $Self->{LayoutObject}->CustomerHeader(Area => 'Customer', Title => 'Close');

    my %Ticket = $Self->{TicketObject}->TicketGet( TicketID => $Self->{TicketID},
                                                   UserID => 1);
    if ($Self->{Customer} eq "-") {
	$Self->{Customer} = "";
    }
    if ($Ticket{'TicketNumber'}   ne $Self->{Number} ||
        $Ticket{'CustomerUserID'} ne $Self->{Customer}) {
        return
            $Output.
            $Self->{LayoutObject}->Output(TemplateFile => 'CustomerTicketCloseError', Data => \%Param).
            $Self->{LayoutObject}->CustomerFooter();
    }

    my %CloseState = $Self->{StateObject}->StateGet( Name  => 'closed successful' );
    my $CloseStateID = $CloseState{ID};

    if ($Ticket{'StateID'} == $CloseStateID) {
        # redirect to ticket is closed
        return
            $Output.
            $Self->{LayoutObject}->Output(TemplateFile => 'CustomerTicketCloseAlreadyClosed', Data => \%Param).
            $Self->{LayoutObject}->CustomerFooter();
    }

    if ( $Self->{Subaction} eq 'Store' ) {

        # store action
        my %Error = ();
        my $NoteID = $Self->{ParamObject}->GetParam(Param => 'CloseNoteID');
        my $Text = "Ticket vom Kunden geschlossen.";
            if ($Self->{ParamObject}->GetParam(Param => 'Comment')) {
            $Text .= " Kommentar:\n". $Self->{ParamObject}->GetParam(Param => 'Comment');
             }

        my $ArticleID = $Self->{TicketObject}->ArticleCreate(
            TicketID => $Self->{TicketID},
            ArticleType => 'note-internal',
            SenderType => 'customer',
            From => "$Self->{UserFirstname} $Self->{UserLastname} <$Self->{UserEmail}>",
            Subject => 'Vom Kunden geschlossen',
            Body => $Text,
            ContentType => "text/plain; charset=$Self->{LayoutObject}->{'UserCharset'}",
            UserID => 1,
            HistoryType => 'AddNote',
            HistoryComment => '%%Close',
            );
        if ($ArticleID) {
            # set state
            $Self->{TicketObject}->StateSet(
                UserID => 1,
                TicketID => $Self->{TicketID},
                StateID => $CloseStateID,
                );
            # set lock
            $Self->{TicketObject}->LockSet(
                UserID => 1,
                TicketID => $Self->{TicketID},
                Lock => 'unlock'
                );
        }
	$Output .= $Self->{LayoutObject}->Output(TemplateFile => 'CustomerTicketCloseClosed', Data => \%Param);
    } else {

        $Output .= $Self->_Mask(
            TicketID => $Self->{TicketID},
            TicketNumber => $Ticket{'TicketNumber'},
            Customer => $Ticket{'CustomerUserID'}
        );
    }
    $Output .= $Self->{LayoutObject}->CustomerFooter();
    return $Output;
}

sub _Mask {
    my ( $Self, %Param ) = @_;

    # get output back
    return $Self->{LayoutObject}->Output( TemplateFile => 'CustomerTicketClose', Data => \%Param );
}

1;
