# -- Kernel/Modules/CustomerTicketClose.pm - close a ticket Copyright (C) 2012-2016 tuxwerk - http://www.tuxwerk.de -- This software comes with ABSOLUTELY NO WARRANTY. For details, see the enclosed file COPYING for license 
# information (AGPL). If you did not receive this file, see http://www.gnu.org/licenses/agpl.txt. -- --
package Kernel::Modules::CustomerTicketClose; use strict; use warnings; use Kernel::System::VariableCheck qw(:all); use Kernel::System::State; use Kernel::System::Ticket; use Kernel::System::Time; use Kernel::Language 
qw(Translatable); sub new {
    my ( $Type, %Param ) = @_;
    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );
    #get ParamObject
    $Self->{ParamObject} = $Kernel::OM->Get('Kernel::System::Web::Request');
    $Self->{TicketID} = $Self->{ParamObject}->GetParam( Param => 'TicketID' );
    $Self->{Number} = $Self->{ParamObject}->GetParam( Param => 'Number' );
    $Self->{Customer} = $Self->{ParamObject}->GetParam( Param => 'Customer' );
    $Self->{LayoutObject} = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    $Self->{StateObject} = $Kernel::OM->Get('Kernel::System::State');
    $Self->{TicketObject} = $Kernel::OM->Get('Kernel::System::Ticket');
	$Self->{ArticleObject} = $Kernel::OM->Get('Kernel::System::Ticket::Article');
    # check needed objects
    for (qw(TicketID Number TicketObject LayoutObject)) {
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
    if ($Ticket{'TicketNumber'} ne $Self->{Number} ||
        $Ticket{'CustomerUserID'} ne $Self->{Customer}) {
        return
            $Output.
            $Self->{LayoutObject}->Output(TemplateFile => 'CustomerTicketCloseError', Data => \%Param).
            $Self->{LayoutObject}->CustomerFooter();
    }
    my %CloseState = $Self->{StateObject}->StateGet( Name => 'closed successful' );
    my $CloseStateID = $CloseState{ID};
    if ($Ticket{'StateID'} == $CloseStateID) {
        # redirect to "ticket already closed"
        return
            $Output.
            $Self->{LayoutObject}->Output(TemplateFile => 'CustomerTicketCloseAlreadyClosed', Data => \%Param).
            $Self->{LayoutObject}->CustomerFooter();
    }
    if ( $Self->{Subaction} eq 'Store' ) {
        # store action
        my $Text = Translatable("Ticket closed by client.");
	if ($Self->{ParamObject}->GetParam(Param => 'Comment')) {
	    $Text .= "\n"
		. Translatable("Comment")
		. ":\n"
		. $Self->{ParamObject}->GetParam(Param => 'Comment');
	}
    my @ArticleList = $Self->{ArticleObject}->ArticleList(
        TicketID => $Self->{TicketID},
        IsVisibleForCustomer => 1
    );
	
	
    my $ArticleBackendObject;
    my %Article;
	
	
    ARTICLEMETADATA:
    for my $ArticleMetaData (@ArticleList) {
        next ARTICLEMETADATA if !$ArticleMetaData;
        next ARTICLEMETADATA if !IsHashRefWithData($ArticleMetaData);
        $ArticleBackendObject = $Self->{ArticleObject}->BackendForArticle( %{$ArticleMetaData} );
        %Article = $ArticleBackendObject->ArticleGet(
            TicketID => $Self->{TicketID},
            ArticleID => $ArticleMetaData->{ArticleID},
            DynamicFields => 0,
        );
    }
	
	my $ArticleID = $ArticleBackendObject->ArticleCreate(
		TicketID => $Self->{TicketID},
		IsVisibleForCustomer => 1,
		ArticleType => 'note-internal',
		SenderType => 'customer',
		Subject => Translatable('Closed by client'),
		Body => $Text,
		ContentType => "text/plain; charset=$Self->{LayoutObject}->{'UserCharset'}",
		UserID => 1,
		HistoryType => 'AddNote',
		HistoryComment => '%%Closed By Client',
		);
	if ($ArticleID) {
		# set state
		$Self->{TicketObject}->StateSet(
			UserID => 1,
			TicketID => $Self->{TicketID},
			StateID => $CloseStateID,
			);
		# unset lock
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
